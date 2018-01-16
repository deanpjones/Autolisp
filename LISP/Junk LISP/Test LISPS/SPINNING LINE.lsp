


;;;SPINNING LINE ROUTINE HOPEFULLY

(defun C:spinline (/ ln)

(setq ln (entmake '((0 . "LINE") (10 225.167 140.0 0.0) (11 225.167 150.0 0.0))))
(entdel (entlast))  
(setq ln (entmake '((0 . "LINE") (10 220.836 142.5 0.0) (11 229.497 147.5 0.0))))
(entdel (entlast))
(setq ln (entmake '((0 . "LINE") (10 220.836 147.5 0.0) (11 229.497 142.5 0.0))))
(entdel (entlast))


(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq x 0)
(while (= x 100)
(grvecs 
(setq x (1+ x)) (0 0)(10 x)
))