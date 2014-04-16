;; -*- mode: emacs-lisp -*-

;; If ~/.elisp/ exists, add it to load-path
(if (file-accessible-directory-p (expand-file-name "~/.elisp/"))
    (add-to-list 'load-path (expand-file-name "~/.elisp/")))

;; If there are local customizations, load them
(if (file-readable-p (expand-file-name "~/.emacs-local.el"))
    (load-file (expand-file-name "~/.emacs-local.el")))

;; Save customizations done through customization buffers to a separate file
(setq  custom-file  "~/.emacs-custom.el")
(load  custom-file)


;; Enable color themes
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;; Enable ibuffer
(require 'ibuffer)

;; Sort buffer by major-mode
(setq ibuffer-default-sorting-mode 'major-mode)

;; What buffers should ibuffer show?
(setq ibuffer-always-show-last-buffer t)
(setq ibuffer-view-ibuffer t)

;; Use ibuffer instead of the default buffer list
(global-set-key  (kbd "C-x C-b")  'ibuffer-other-window)

;; Show line and column numbers in the mode line
(setq line-number-mode t)
(setq column-number-mode t)

;; Display time and date in mode line
(setq display-time-day-and-date t)
(display-time)

;; highlight empty lines at end of file
(setq indicate-empty-lines t)

;; Don't add new lines when going to next line at end of file
(setq next-line-add-newlines nil)

;; highlight current line
(global-hl-line-mode t)

;; Highlight matching parenthesis
(show-paren-mode t)

;; Show line numbers on the left edge
(global-linum-mode t)
(setq linum-format "%d ")

;; Kill line contents and newline with one C-k
(setq kill-whole-line t)

;; Highlight trailing whitespaces ...
(setq show-trailing-whitespace t)

;; ... and delete them before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Scroll output in compilation buffer
(setq compilation-scrool-output t)

;; Always show syntactic analysis information when indenting lines in c-mode
(setq c-echo-syntactic-information-p t)

;; Warn about some syntactic errors while editing
(setq c-report-syntactic-errors t)

;; Tab key always indent in c-mode
(setq c-tab-always-indent t)

;; Show current function name in mode line
(setq which-function-mode t)

;; Add final newline when saving
(setq require-final-newline t)

;; Enable git version control mode
(require 'vc-git)

;; Automatically revert buffers after checkout
(global-auto-revert-mode)

;; Load magit, an interactive mode for manipulating Git repositories
(require 'magit)

;; Load magit's stgit support
;; You will need magit 1.1.0 or later for this
(require 'magit-stgit)

;; Bind magit status to C-x v b
(global-set-key [(control x) (v) (b)] 'magit-status)

;; Do not show startup screen
(setq inhibit-startup-screen t)

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)
