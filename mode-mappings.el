;;; This file makes tracing setup convoluted, should be merged with init.el
;; rather than init -> mode map -> setup-mode
;; within init.el, you'll need to consolidate the hooks for each mode, by mode,
;; rather than by activated mode.

;; Eldoc

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)
(add-hook 'css-mode-hook 'fci-mode)

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . html-mode))
(add-hook 'html-mode-hook
          (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))
(eval-after-load "sgml-mode"
  '(define-key html-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point))

;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

;;(autoload 'js2-mode "js2-mode" nil t)
(defun my-js2-mode-hook ()
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode)))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(add-hook 'js2-mode-hook (lambda ()
                           (require 'setup-js2-mode)))

(provide 'mode-mappings)
