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

;; Maximize emacs on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Display time and battery info in the modeline
(after! doom-modeline
  (display-time-mode 1)
  (display-battery-mode 1))

;; Replace selection when inserting text
(delete-selection-mode 1)

;; Blink visible cursor
(blink-cursor-mode 'visible-cursor)

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

(setq-default
 ;; always follow symlinks
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

 ;; trash files
 delete-by-moving-to-trash t

 ;; don't create lockfiles
 create-lockfiles nil

 ;; less sensitive mouse / trackpad scrolling
 mouse-wheel-scroll-amount '(5 ((shift) . 1) ((control) . nil))
 mouse-wheel-progressive-speed nil

 ; Add a margin when scrolling vertically
 scroll-margin 2
 )

;; Turn on 80th column indicator for all files
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; Pull up ivy when splitting the window so we can select a buffer
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

;; SPC <number> or SPC <[>, <]> to select windows
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

;; Toggle centered cursor
(map! :leader
      :desc "Center cursor"
      :n "t-" (λ! () (interactive) (centered-cursor-mode 'toggle)))

;; Set frame title with project name (when possible)
(setq frame-title-format
    '(""
      (:eval
       (if (s-contains-p org-roam-directory (or buffer-file-name ""))
           (replace-regexp-in-string ".*/[0-9]*-?" "🢔 " buffer-file-name)
         "%b"))
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; Magit
(after! magit
  ;; (magit-wip-mode)
  (setq magit-repository-directories '(("~/git" . 4))
        magit-save-repository-buffers nil
        ;; Don't restore the wconf after quitting magit
        magit-inhibit-save-previous-winconf t
        magit-log-arguments '("--graph" "--decorate" "--color")
        ;; magit-delete-by-moving-to-trash nil
        git-commit-summary-max-length 120))

