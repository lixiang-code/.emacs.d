;;; init-font.el  -*- lexical-binding: t -*-
;;; Font

;; other great monospace fonts:
;; Operator Mono, Input Mono, IBM Plex Mono, Computer Modern Textwriter
(defvar font-family "Iosevka")

(defvar font-size
  (pcase system-type
    ('windows-nt 11)
    ('darwin 15)))

(let ((font-string (concat font-family " " (number-to-string font-size))))
  (set-face-attribute 'default nil :font font-string))

;; display emojis
(when (eq system-type 'darwin)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

;; chinese font
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Source Han Sans SC")))

(use-cjk-char-width-table 'zh_CN)

(provide 'init-font)
