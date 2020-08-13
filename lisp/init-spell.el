;;; init-spell.el
;;; Spell checking

;; some references:
;; - https://www.emacswiki.org/emacs/InteractiveSpell
;; - https://joelkuiper.eu/spellcheck_emacs
;; - https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-spelling.el

(use-package flyspell
  :if (executable-find "hunspell")
  :hook ((git-commit-setup . flyspell-mode)
         ;; (text-mode . flyspell-mode)
         ;; (prog-mode . flyspell-prog-mode)
         )
  :init
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
  (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))

(use-package flyspell-correct-ivy
  :after flyspell
  :bind ("C-c s" .  flyspell-correct-at-point)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

(provide 'init-spell)
