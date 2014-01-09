;;; setup-magit --- Magit inits and helpers

;;; Commentary:
;; Adds full-screen to magit status, magit-diff with commit, and colorizes the diff screen.

;;; Code:

(set-default 'magit-stage-all-confirm nil)
(set-face-foreground 'diff-added "#fff")
(set-face-background 'diff-added "#398439")
(set-face-foreground 'diff-added "#fff")
(set-face-background 'diff-removed "#ac2925")

(defadvice magit-status (around magit-fullscreen activate)
  "Set magit status to full-screen."
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defadvice magit-commit (around magit-commitdiff activate)
  "Add the diff buffer to the commit view."
  (delete-other-windows)
  ad-do-it
  (magit-diff-staged))

(defun magit-quit-session ()
  "Restore the previous window configuration and kill the magit buffer."
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(provide 'setup-magit)
;;; setup-magit ends here
