;(apply '(lambda (x) (* x x)) '(3))

;(setq list1 (list 1 2 3))
;(apply '(lambda (x y z) (+ x y z)) list1)

;(apply '(lambda (arg1 arg2 arg3) (strcat arg1 arg2 arg3)) stampList)

;(foreach n stampList (progn (princ n)(princ)))
;(foreach n stampList (progn (princ n)(princ)))

; (apply '(lambda (x) (strcat x)) 'stampList)

;(foreach n stampList (progn (princ (strcat (itoa (length (member n revStampList))) " - " n))(princ)(terpri)))