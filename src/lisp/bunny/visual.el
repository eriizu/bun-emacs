
;; theming, uses gruvbox theme + transparent background
;; ref. https://github.com/Greduan/emacs-theme-gruvbox
(load-theme 'gruvbox-dark-medium t)
(set-face-background 'default "undefined")

(setq-default show-trailing-whitespace t)
(setq scroll-step 1)
(setq column-number-mode 1)
(require 'idle-highlight-mode)

(global-display-line-numbers-mode t)
(global-idle-highlight-mode t)
(menu-bar-mode -1)
(size-indication-mode t)

(global-set-key (kbd "C-M-n") 'move-text-down)
(global-set-key (kbd "C-M-p") 'move-text-up)

