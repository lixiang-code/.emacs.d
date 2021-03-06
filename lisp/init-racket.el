;;; init-racket.el
;;; Racket and its languages

(use-package racket-mode
  :mode "\\.rkt\\'"
  :hook ((racket-mode . racket-xp-mode)
         (racket-mode . paredit-mode)
         ((racket-mode racket-repl-mode) . rainbow-delimiters-mode))
  :bind (:map racket-mode-map
         (")" . racket-insert-closing)
         ("]" . racket-insert-closing)
         ("}" . racket-insert-closing)
         ("C-M-\\" . racket-unicode-input-method-enable)
         :map paredit-mode-map
         ("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly))
  :config
  ;; don't show the pos-tip, either the pseudo tip
  (setq racket-show-functions '(racket-show-echo-area)))

(use-package scribble-mode
  :mode "\\.scrbl\\'"
  :hook ((scribble-mode . rainbow-delimiters-mode)))

(use-package pollen-mode
  :mode "\\.\\(p\\|pp\\|pm\\|pmd\\|poly\\|ptree\\)\\'"
  :requires company-pollen)

(provide 'init-racket)
