;;; key-bindings.el --- Keybindings related to built-in emacs functions

;;; Commentary:

;; Bindings related to specific modes should go with the code for that mode.
;; bindings for built in Emacs functions should go here, or this file should be
;; merged in with init.el

;;; Code:

;; I don't need to kill Emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x o") 'delete-blank-lines)

;; call macro with f5
(global-set-key [f5] 'call-last-kbd-macro)

;; reset kill region to c-x c-k...
(global-set-key "\C-x\C-k" 'kill-region)

;; ...and its fat-fingered cousin
(global-set-key "\C-c\C-k" 'kill-region)

;; swap C-f and C-s
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-s") 'forward-char)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

;; duplicate line
(global-set-key (kbd "C-d") 'duplicate-line)

;; collapse lines
(global-set-key (kbd "C-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

(defun comint-delchar-or-eof-or-kill-buffer (arg)
  "(shell): ARG if there is a buffer process, kill it.
Else kill the buffer."
  (interactive "p")
  (if (get-buffer-process (current-buffer))
      (comint-delchar-or-maybe-eof arg)
    (kill-buffer)))

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map
              (kbd "C-q") 'comint-delchar-or-eof-or-kill-buffer)))

(provide 'key-bindings)
;;; key-bindings.el ends here
