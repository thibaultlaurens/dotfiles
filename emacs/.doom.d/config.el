;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thibault Laurens"
      user-mail-address "thibault.laurens@pm.me")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 13)
      doom-variable-pitch-font (font-spec :family "SauceCodePro Nerd Font" :size 13)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 24))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Maximize emacs on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Display time and battery info in the modeline
(after! doom-modeline
  (display-time-mode 1)
  (display-battery-mode 1))

;; Replace selection when inserting text
(delete-selection-mode 1)

;; Turn on 80th column indicator for all files
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; Blink visible cursor
(blink-cursor-mode 'visible-cursor)

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Disable custom scroll-margin in term-mode
(add-hook 'term-mode-hook (lambda () (setq-local scroll-margin 0)))

;; Add py-isort-before-save to before-save-hook in python-mode
(add-hook 'python-mode-hook (lambda() (add-hook 'before-save-hook 'py-isort-before-save)))

;; Invalidate project cache once switched to it
(add-hook 'projectile-after-switch-project-hook (lambda () (projectile-invalidate-cache nil)))

(setq-default
 ;; Always follow symlinks
 vc-follow-symlinks t

 ;; Uniquify buffer names
 uniquify-buffer-name-style 'forward
 )

(setq
 ;; Auto save files
 auto-save-default t

 ;; By default while in insert all changes are one big blob. Be more granular
 evil-want-fine-undo t

 ;; Split window and move to it
 evil-split-window-below t
 evil-vsplit-window-right t

 ;; Don’t move back the cursor when exiting insert mode
 evil-move-cursor-back nil

 ;; Trash files
 delete-by-moving-to-trash t

 ;; Don't create lockfiles
 create-lockfiles nil

 ;; less sensitive mouse / trackpad scrolling
 mouse-wheel-scroll-amount '(5 ((shift) . 1) ((control) . nil))
 mouse-wheel-progressive-speed nil

 ;; Add a margin when scrolling vertically
 scroll-margin 5

 js-indent-level 2
 )

;; Pull up ivy when splitting the window so we can select a buffer
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/projectile-find-file))

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

;; Refresh neotree for added/removed files
(after! neotree
  (map! :map neotree-mode-map
        :n "R"  #'neotree-refresh))

;; Set frame title with file path and major mode
(setq-default frame-title-format '("%f [%m]"))

;; Set rg to search in hidden files
(after! counsel
  (setq counsel-rg-base-command
        "rg -M 240 --hidden --with-filename --no-heading --line-number --color never --glob '!.git' %s"))

;; Magit
(after! magit
  (setq magit-repository-directories '(("~/git" . 4))
        magit-save-repository-buffers nil
        ;; Don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        magit-log-arguments '("--graph" "--decorate" "--color")
        git-commit-summary-max-length 120))

;; Projectile
(after! projectile
  (when (require 'magit nil t)
    (mapc #'projectile-add-known-project
          (mapcar #'file-name-as-directory (magit-list-repos)))
    ;; Optionally write to persistent `projectile-known-projects-file'
    (projectile-save-known-projects)))
