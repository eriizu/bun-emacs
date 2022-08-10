;; E89 Pedagogical & Technical Lab
;; project:     emacs standard config
;; created on:  2022-08-09 - 09:26 +0200
;; 1st author:  Elise C. Philippe - eriizu
;; description: bunny coding style

(normal-erase-is-backspace-mode 0)
(setq backward-delete-char-untabify-method nil)

(require 'cc-mode)
(add-hook 'c-mode-common-hook 'electric-pair-mode)
;(add-hook 'c-mode-common-hook 'auto-newline)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  (setq c-default-style "k&r"
        c-basic-offset 4
        tab-width 8
        tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
  (setq-default indent-tabs-mode nil)
  ;;(c-toggle-auto-newline 1)
  ;;(c-toggle-comment-style 0)
  (setq comment-style 'extra-line)
  (setq fill-column 80)
  (auto-fill-mode t)
  (display-fill-column-indicator-mode)
  (setq display-fill-column-indicator-column 80)
  )

;; defining a mnor mode is required when overriding major mode keybinds
(defvar bunny-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-c") 'comment-or-uncomment-region)
    (define-key map (kbd "C-c h") 'bunny-insert-header)
    map)
  "bunny-minor-mode keymap.")

(define-minor-mode bunny-minor-mode
  "Standard bunny minor mode"
  :init-value t
  :lighter " bunny")

(bunny-minor-mode 1)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(global-set-key (kbd "C-c C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c C-r") 'replace-string)
(global-set-key (kbd "C-c C-q") 'query-string)
(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c <down>") 'shrink-window)
(global-set-key (kbd "C-c <up>") 'enlarge-window)

;; C file header
(defun bunny-insert-header ()
  "Insert a header at the beginning of the file."
  (setq project-name (read-string "Project name: "))
  (setq file-description (read-string "What's this file for? "))
  (interactive)

  ;; remembering where the user was before the insertion
  (setq old-point (point))
  (mark-end-of-buffer)
  (exchange-point-and-mark)
  (setq old-len (point))
  (goto-char 0)

  ;; inserting the header contents
  (insert "E89 Pedagogical & Technical Lab") (newline)
  (insert "project:     " project-name) (newline)
  (insert "created on:  " (format-time-string "%Y-%m-%d - %H:%M %z")) (newline)
  (insert "1st author:  " user-full-name " - " user-login-name) (newline)
  (insert "description: " file-description) (newline)

  ;; commenting the header
  (set-mark (point))
  (goto-char 0)
  (comment-region (point) (mark))

  ;; get the new len of the file
  (mark-end-of-buffer)
  (exchange-point-and-mark)
  (setq new-len (point))

  ;; reset the marks
  (setq mark-ring ())

  ;; insert a new line after the header
  (goto-char (- new-len old-len))
  (newline)

  ;; restore cursor to old point
  (goto-char (+ 1 old-point (- new-len old-len)))
  )

;(defun header_keybind ()
;	(global-set-key (kbd "C-c C-h") 'insert-header))
;(add-hook 'c-mode-common-hook 'header_keybind)
