;(polar pt ang dist)
;(polar '(10 10 10) ang dist)

(defun polar (p a d / )
(setq pt '(10 10 10))
(setq ang 0)
(setq dist 1)

(repeat 100
(polar pt ang dist)

);END REPEAT