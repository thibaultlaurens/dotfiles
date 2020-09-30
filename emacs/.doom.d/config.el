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
(setq doom-font (font-spec :family "Source Code Pro" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

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

;; Uniquify buffer names
(setq-default uniquify-buffer-name-style 'forward)

;; Display time in the modeline
(display-time-mode 1)

;; Maximize emacs on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; By default while in insert all changes are one big blob. Be more granular
(setq evil-want-fine-undo t)

;; Replace selection when inserting text
(delete-selection-mode 1)

;; always follow symlinks
(setq-default vc-follow-symlinks t)

;; Auto save files
;;(set auto-save-default t)

;; SPC <number> to select window
(after! winum
    (map! (:when (featurep! :ui window-select)
            :leader
            :n "1" #'winum-select-window-1
            :n "2" #'winum-select-window-2
            :n "3" #'winum-select-window-3
            :n "4" #'winum-select-window-4
            :n "5" #'winum-select-window-5
            :n "6" #'winum-select-window-6
        )))

;; Split window and move to it
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Toggle centered cursor
(map! :leader
      :desc "Center cursor"
      :n "t-" (λ! () (interactive) (centered-cursor-mode 'toggle)))

;; Magit
(after! magit
  ;; (magit-wip-mode)
  (setq magit-repository-directories '(("~/git" . 2))
        magit-save-repository-buffers nil
        ;; Don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        magit-log-arguments '("--graph" "--decorate" "--color")
        ;; magit-delete-by-moving-to-trash nil
        git-commit-summary-max-length 120))

;; https://noelwelsh.com/posts/2019-01-10-doom-emacs.html
;; https://tecosaur.github.io/emacs-config/config.html
;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org
;; https://lccambiaghi.github.io/.doom.d/readme.html
