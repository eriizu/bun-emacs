;; Bunny Pedagogical Lab
;; project:     standard emacs config
;; created on:  2022-08-09 - 11:05 +0200
;; 1st author:  Elise C. Philippe - eriizu
;; description: emacs init

;; emacs config adapted from TechnoCore. Hanged Bunny Studio 2014-2018

;; MELPA package repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;(package-initialize)
(setq package-selected-packages
      '(move-text markdown-mode gruvbox-theme auto-package-update))
(package-install-selected-packages t)
(auto-package-update-maybe)
(setq auto-package-update-prompt-before-update t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages 'nil))

(add-to-list 'load-path "~/.emacs.d/modes/")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "site-start.d/bunny-init.el")

;;(require 'dabsic-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "<kp-7>") 'beginning-of-line)
(global-set-key (kbd "<kp-1>") 'end-of-line)
