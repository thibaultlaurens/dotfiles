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

 ;; Stretch cursor to the glyph width
 x-stretch-cursor t
 )

;; Doom-vibrant theme customisation
(custom-theme-set-faces! 'doom-vibrant
  '(font-lock-variable-name-face :foreground "base8"))

;; Disable the custom scroll-margin in term-mode
(add-hook 'term-mode-hook (lambda () (setq-local scroll-margin 0)))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Turn on 80th column indicator for all files
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; Blink visible cursor
(blink-cursor-mode 'visible-cursor)

;; Mode line customization
(after! doom-modeline
  (setq doom-modeline-bar-width 4
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t))

;; Only show the encoding in the nmodeline when it't not UTF-8
(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Custom splash image
(setq fancy-splash-image (expand-file-name "assets/emacs-e.svg" doom-user-dir))

;; Which key idle delay
(setq which-key-idle-delay 0.5 ;; Default is 1.0
      which-key-idle-secondary-delay 0.05) ;; Default is nil

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

 ;; Increase company auto-completion popup delay
 company-idle-delay 0.5
 )

;; Replace selection when inserting text
(delete-selection-mode t)

;; enable word-wrap (almost) everywhere
(+global-word-wrap-mode t)

;; focus imenu-list sidebar after activation
(setq imenu-list-focus-after-activation t)

;; add shortcut to toggle imenu-list sidebar
(map! :leader
      (:prefix ("t" . "Toggle")
       :desc "Toggle imenu shown in a sidebar" "i" #'imenu-list-smart-toggle))

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
  (setq magit-repository-directories '(("~/git" . 3)
                                       ("~/code" . 3))
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
;;; TREEMACS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

  ;; <RET> to open in most recently used window
  (treemacs-define-RET-action 'file-node-open   #'treemacs-visit-node-in-most-recently-used-window)
  (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-in-most-recently-used-window)

  (set-face-attribute 'treemacs-root-face nil
                      :height 1.0
                      :weight 'bold)

  (setq treemacs-indentation 1
        treemacs-width 32
        treemacs-follow-after-init t
        treemacs-recenter-after-file-follow t
        treemacs-show-hidden-files t
        treemacs-is-never-other-window t))


;; make Treemacs accessible as Window #0
(after! (treemacs winum)
  (setq winum-ignored-buffers-regexp
        (delete (regexp-quote (format "%sFramebuffer-" treemacs--buffer-name-prefix))
                winum-ignored-buffers-regexp)))

;; refresh git status after file save
(after! treemacs
  (defun treemacs--force-git-update-current-file ()
    (-let [file (treemacs-canonical-path buffer-file-name)]
      (treemacs-run-in-every-buffer
       (when (treemacs-is-path file :in-workspace)
         (treemacs-update-single-file-git-state file)))))
  (add-hook 'after-save-hook 'treemacs--force-git-update-current-file))

;;
;;; WINUM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Open vertico when splitting the window so we can select a buffer
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

;; SPC-<number> to select windows
(after! winum
  (map! (:when (modulep! :ui window-select)
          :leader
          :n "0" #'treemacs-select-window
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

(after! yaml-mode
  (set-formatter! 'prettier '("prettier" "--stdin-filepath" filepath
                              "--parser=yaml" "--tab-width=2") :modes '(yaml-mode)))
(after! json-mode
  (set-formatter! 'prettier '("prettier" "--stdin-filepath" filepath
                              "--parser=json" "--tab-width=2") :modes '(json-mode)))

;; Add jsonnet support
(use-package! jsonnet-mode
  :defer t
  :config
  (set-electric! 'jsonnet-mode :chars '(?\n ?: ?{ ?})))

;;
;;; GOLANG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(after! lsp-mode
  (setq lsp-go-library-directories-include-go-modules t)

  (setq  lsp-go-analyses '((fieldalignment . t)
                           (nilness . t)
                           (shadow . t)
                           (unusedparams . t)
                           (unusedwrite . t)
                           (useany . t)
                           (unusedvariable . t)))
  )

;;
;;; SH ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set sh formatter to always use bash (fix zsh array error)
(after! sh-script
  (set-formatter! 'shfmt
    '("shfmt" "-ci"
      ("-i" "%d" (unless indent-tabs-mode tab-width))
      ("-ln" "bash"))))

;;
;;; Proto ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! protobuf-mode
  :defer-incrementally t)

;;
;;; PDF ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package pdf-tools
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page)
              ("C-=" . pdf-view-enlarge)
              ("C--" . pdf-view-shrink))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))

(add-hook 'pdf-view-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;;
;;; PEG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.config/doom/modules/lang/peg-mode")
(autoload 'peg-mode "peg-mode" "Mode for editing PEG grammar files" t)

(setq auto-mode-alist
      (append '(("\\.peg$"    . peg-mode))
              auto-mode-alist))
