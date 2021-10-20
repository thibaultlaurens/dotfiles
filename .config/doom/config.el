;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;
;;; MISC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thibault Laurens"
      user-mail-address "thibault.laurens@pm.me")

;; Maximize emacs on startup
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Set rg to search in hidden files
(after! counsel
  (setq counsel-rg-base-command
        "rg -M 240 --hidden --with-filename --no-heading --line-number --color never --glob '!.git' %s"))

;; Disable lsp file watcher to improve perf on large repos
(with-eval-after-load 'lsp-mode
  (setq lsp-enable-file-watchers nil))

;; Default location for org files
(setq org-directory "~/org/")

;;
;;; UI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq
 doom-theme 'doom-vibrant

 doom-font (font-spec :family "FiraCode Nerd Font" :size 13)
 doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 13)
 doom-big-font (font-spec :family "FiraCode Nerd Font" :size 24)

 ;; Style of line numbers in effect: `nil' | `t' | `relative'.
 display-line-numbers-type t

 ;; Enable mouse / trackpad progressive scrolling
 mouse-wheel-progressive-speed t

 ;; Add a margin when scrolling vertically
 scroll-margin 5
 )

;; Disable the custom scroll-margin in term-mode
(add-hook 'term-mode-hook (lambda () (setq-local scroll-margin 0)))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Display time and battery info in the modeline
(after! doom-modeline
  (display-time-mode t)
  (display-battery-mode t))

;; Turn on 80th column indicator for all files
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; Blink visible cursor
(blink-cursor-mode 'visible-cursor)

;; Only show the encoding in the nmodeline when it't not UTF-8
(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)


;; Set frame title with file path and major mode
(setq-default frame-title-format '("%f [%m]"))

;;
;;; FILES / BUFFERS / TEXT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Uniquify buffer names
(setq-default uniquify-buffer-name-style 'forward)

(setq
 ;; Auto save files
 auto-save-default t

 ;; Trash files
 delete-by-moving-to-trash t

 ;; Don't create lockfiles
 create-lockfiles nil
 )

;; Replace selection when inserting text
(delete-selection-mode t)

;;
;;; EVIL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq
 ;; Be more granular on undo
 evil-want-fine-undo t

 ;; Split window and move to it
 evil-split-window-below t
 evil-vsplit-window-right t

 ;; Don’t move back the cursor when exiting insert mode
 evil-move-cursor-back nil

 ;; Implicit /g flag on evil ex substitution.
 evil-ex-substitute-global t
 )

;;
;;; VC / MAGIT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; Always follow symlinks
(setq-default vc-follow-symlinks t)

(after! magit
  (setq magit-repository-directories '(("~/git" . 2)
                                       ("~/code" . 2))
        magit-save-repository-buffers nil
        ;; Don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        magit-log-arguments '("--graph" "--decorate" "--color")
        git-commit-summary-max-length 120))

;;
;;; PROJECTILE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Invalidate project cache once switched to it
(add-hook 'projectile-after-switch-project-hook (lambda () (projectile-invalidate-cache nil)))

(after! projectile
  ;; Ignore directories to increase speed
  (add-to-list 'projectile-globally-ignored-directories "*github.com")
  (add-to-list 'projectile-globally-ignored-directories "*vendor")

  ;; Add magit repos as known projects
  (when (require 'magit nil t)
    (mapc #'projectile-add-known-project
          (mapcar #'file-name-as-directory (magit-list-repos)))
    (projectile-save-known-projects)))

;;
;;; NEOTREE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Neotree evil mode key bindings
(add-hook 'neotree-mode-hook
        (lambda ()
        (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
        (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
        (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
        (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
        (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
        (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
        (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

;;
;;; WINUM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Open vertico when splitting the window so we can select a buffer
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+vertico/switch-workspace-buffer))

;; Assign window number 0 to neotree
(defun winum-assign-0-to-neotree ()
  (when (string-match-p (buffer-name) ".*\\NeoTree\\*.*") 10))

;; SPC-<number> to select windows
(after! winum
  (add-to-list 'winum-assign-functions #'winum-assign-0-to-neotree)
  (map! (:when (featurep! :ui window-select)
         :leader
         :n "0" #'winum-select-window-0-or-10
         :n "1" #'winum-select-window-1
         :n "2" #'winum-select-window-2
         :n "3" #'winum-select-window-3
         :n "4" #'winum-select-window-4
         :n "5" #'winum-select-window-5
         )))

;;
;;; PYTHON ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add py-isort-before-save to before-save-hook in python-mode
(add-hook 'python-mode-hook (lambda() (add-hook 'before-save-hook 'py-isort-before-save)))

;; Set python3 and venv custom path
(with-eval-after-load 'lsp-mode
  (lsp-register-custom-settings
   '(("python.pythonPath" "/usr/local/bin/python3")
     ("python.stubPath" "")
     ("python.venvPath" "/Users/tlaurens/.venv")))
  )

;;
;;; JS / JSON / YAML ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; JS Indent level
(setq js-indent-level 2)

;; Use prettier instead of yaml-lsp
(setq-hook! 'yaml-mode-hook +format-with-lsp nil)

;;
;;; SH ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set sh formatter
(after! format-all
  (set-formatter! 'shfmt
    '("shfmt"
      "-i" "2"
      ;; Mode selection copied from the default config
      ("-ln" "%s" (cl-case (and (boundp 'sh-shell) (symbol-value 'sh-shell))
                    (bash "bash") (mksh "mksh") (t "posix"))))
    :modes 'sh-mode))

