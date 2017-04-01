;; -*- mode: emacs-lisp -*-

;; TODO:
;; - multicursor with evil-mc or evil-multiedit
;; - drag stuff around with drag-stuff
;; - doom-themes
;; - gtags

(defun dotspacemacs/layers ()
  "Configuration Layers declaration"

  (setq-default

   ;; Base distributiion to use (`spacemacs-base'|`spacemacs')
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (`all'|`unused'|`nil')
   dotspacemacs-enable-lazy-installation 'unused

   ;; Ask for confirmation before installing a layer lazily.
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(

     ;; Checkers
     spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-by-default nil)

     ;; Completion
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)

     ;; Emacs
     better-defaults
     (ibuffer :variables
              ibuffer-group-buffers-by 'mode)
     org

     ;; Languages
     clojure
     elixir
     emacs-lisp
     erlang
     go
     html
     javascript
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     python
     react
     yaml

     ;; Source-Control
     git
     github
     (version-control :variables
                      version-control-diff-tool 'diff-hl)

     ;; Themes
     (colors :variables
             colors-colorize-identifiers 'var)

     ;; Tools
     ansible
     dash
     docker
     nginx
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts

     ;; Web Services
     search-engine

     )

   ;; List of additional packages that will be installed
   dotspacemacs-additional-packages
   '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     vi-tilde-fringe
     )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; (`used-only'|`used-but-keep-unused'|`all')
   dotspacemacs-install-packages 'used-only))


(defun dotspacemacs/init ()
  "Initialization function. This function is called at the very startup of
Spacemacs initialization before layers configuration."

  ;; Exhaustive list of all the supported spacemacs settings.
  (setq-default

   ;; ELPA repositories are contacted via HTTPS whenever it's possible.
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; If non nil then spacemacs will check for updates at startup.
   dotspacemacs-check-for-update nil

   ;; A form that evaluates to a package directory.
   dotspacemacs-elpa-subdirectory nil

   ;; One of `vim', `emacs' or `hybrid'.
   dotspacemacs-editing-style 'vim

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner (`official'|`random'|`/path/to/image')
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer. Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'
   dotspacemacs-startup-lists
   '(
     (recents . 5)
     (projects . 10)
     )

   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   dotspacemacs-themes
   '(
     spacemacs-dark
     spacemacs-light
     )

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts.
   dotspacemacs-default-font
   '(
     "Hack"
     :size 11
     :weight normal
     :width normal
     :powerline-scale 1.1
     )

   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"

   ;; A shortcut key which is the equivalent of pressing `<leader> m`.
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; Ccontrol whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   dotspacemacs-distinguish-gui-tab nil

   ;; If non nil `Y' is remapped to `y$' in Evil states.
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, J and K move lines up and down when in visual mode.
   dotspacemacs-visual-line-move-text t

   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non nil the default layout name is displayed in the mode-line.
   dotspacemacs-display-default-layout t

   ;; If non nil then the last auto saved layouts are resume automatically upon start.
   dotspacemacs-auto-resume-layouts nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. (`original'|`cache'|`nil')
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non nil, the helm header is hidden when there is only one source.
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm'. (`bottom'|`top'|`left'|`right')
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. (`always'|`source')
   dotspacemacs-helm-use-fuzzy 'always

   ;; When enabled pressing `p` several times cycle between the kill ring content.
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing the commands.
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. (`right'|`bottom'|`right-then-bottom')
   dotspacemacs-which-key-position 'bottom

   ;; If non nil a progress bar is displayed when spacemacs is loading.
   dotspacemacs-loading-progress-bar t

   ;; If non nil the frame is fullscreen when Emacs starts up.
   dotspacemacs-fullscreen-at-startup nil

   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   dotspacemacs-maximized-at-startup t

   ;; The transparency level of a frame when it's active or selected. (0..100)
   dotspacemacs-active-transparency 95

   ;; The transparency level of a frame when it's inactive or deselected. (0..100)
   dotspacemacs-inactive-transparency 95

   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non nil smooth scrolling (native-scrolling) is enabled.
   dotspacemacs-smooth-scrolling t

   ;; Turn on line numbers in all `prog-mode' and `text-mode' derivatives.
   ;; If set to `relative', also turns on relative line numbers.
   dotspacemacs-line-numbers t

   ;; Code folding method. (`evil'|`origami')
   dotspacemacs-folding-method 'evil

   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. (`any'|`current'|`all'|`nil')
   dotspacemacs-highlight-delimiters 'all

   ;; If non nil, advise quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   dotspacemacs-default-package-repository nil

   ;; Delete whitespace while saving buffer. (`all'|`trailing'|`changed'|`nil')
   dotspacemacs-whitespace-cleanup `trailing
   ))

(defun dotspacemacs/user-init ()

  (setq-default

   ;; misc emacs defaults
   vc-follow-symlinks t
   require-final-newline t

   ;; vim search
   evil-search-module 'evil-search)

   ;; unbind right `alt` key from "M"
   mac-right-option-modifier nil

   ;; magit status buffer in fullscreen
   git-magit-status-fullscreen t

   ;; frame title is file path and append a '•' when buffer has unsaved changed
   frame-title-format
   '((:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
              "%b"))
     (:eval (if (buffer-modified-p)
                " •")))

  )

(defun dotspacemacs/user-config ()

  ;; replace active region just by typing text
  (delete-selection-mode 1)

  ;; dispplay time
  (setq display-time-24hr-format t)
  (display-time-mode t)

  ;; enable rainbow-mode by default
  (add-hook 'prog-mode-hook 'rainbow-mode)

  ;; wrap long lines
  (global-visual-line-mode t)
  (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

  ;; powerline settings
  (setq powerline-default-separator 'slant
        ns-use-srgb-colorspace nil)

  ;; take € and # back
  (defun init/apple-uk-keymap (map)
    (define-key map (kbd "M-2") #'(lambda () (interactive) (insert "€")))
    (define-key map (kbd "M-3") #'(lambda () (interactive) (insert "#"))))

  (with-eval-after-load 'evil
    (init/apple-uk-keymap evil-insert-state-map))

  (with-eval-after-load 'helm
    (init/apple-uk-keymap helm-map))

  ;; custom scroll margin
  (setq scroll-margin 10)

  ;; replace the standard text representations globally
  (global-prettify-symbols-mode +1)

  ;; tern path
  (setenv "PATH" (concat (getenv "PATH") ":/Users/thibault/.nvm/versions/node/v0.12.17/bin"))
  (setq exec-path (append exec-path '("/Users/thibault/.nvm/versions/node/v0.12.17/bin")))

  ;; 80-column marker
  (add-hook 'prog-mode-hook 'fci-mode)
  (setq fci-rule-column 80
        fci-rule-color "gray35")

  ;; evil-escape conf: "jk", 0.2s and unordered sequence
  (setq evil-escape-key-sequence "jk"
        evil-escape-delay 0.2
        evil-escape-unordered-key-sequence t)

  ;; indent-guide
  (indent-guide-global-mode)
  (setq indent-guide-recursive t
        indent-guide-delay nil
        indent-guide-threshold 0)

  ;; neotree
  (setq neo-theme 'ascii
        neo-smart-open t
        neo-dont-be-alone t
        neo-show-updir-line t
        neo-vc-integration '(face char)
        projectile-switch-project-action 'neotree-projectile-action)

  ;; git and magit
  (setq magit-repository-directories '("~/github/" . 3))
  (global-git-commit-mode t)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

  ;; dash intergration
  (setq helm-dash-docset-newpath "~/Library/Application Support/Dash/DocSets")
  (setq helm-dash-browser-func 'eww)

  ;; blink visible cursor
  (blink-cursor-mode 'visible-cursor)

  ;; trash files
  (setq delete-by-moving-to-trash t)

  ;; don't create lockfiles
  (setq create-lockfiles nil)

  ;; make evil treat an emacs symbol as a word (ex: fix cmd 'dw' with word with '_')
  (with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

  )

;; Do not write anything past this comment: Emacs will auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (engine-mode stickyfunc-enhance srefactor ibuffer-projectile highlight-indent-guides sublimity insert-shebang fish-mode company-shell nginx-mode magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht rainbow-mode rainbow-identifiers color-identifiers-mode jinja2-mode helm-dash dockerfile-mode docker tablist docker-tramp dash-at-point ansible-doc ansible clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider seq queue clojure-mode vmd-mode helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag flyspell-correct-helm ace-jump-helm-line yapfify yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements ob-elixir live-py-mode less-css-mode hy-mode haml-mode go-guru go-eldoc flycheck-mix emmet-mode cython-mode company-web web-completion-data company-go go-mode company-anaconda anaconda-mode pythonic alchemist elixir-mode xterm-color smeargle shell-pop orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term magit-gitflow htmlize gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl auto-dictionary mmm-mode markdown-toc markdown-mode gh-md all-the-icons font-lock+ erlang hide-comnt reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl company-tern dash-functional tern company-statistics company auto-yasnippet ac-ispell auto-complete web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode ws-butler window-numbering which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash async aggressive-indent adaptive-wrap ace-window ace-link avy quelpa package-build spacemacs-theme)))
 '(spacemacs-theme-comment-bg nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
