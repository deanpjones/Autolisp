;;;LENGTHEN lines by adding or subtracting (press SPACEBAR).
;;;Compliments of Dean Jones, Mar. 30, 2006.


(defun C:len (/ lts lplus lminus)

;;;Turn off groups ??????????????

		(while
		
(princ "\n***PRESS ('Z' to shorten) ('X' to lengthen) line***")
(princ "\n")

(setq lts (getvar "ltscale"))							;GET LTSCALE variable.

	(cond
	((= (cadr (grread)) 122)
(progn													;LENGTHEN line.
(setq lminus (command "lengthen" "de" (* -0.1 lts)))
(princ "\n***line shortened***")
)
	)
	
	((= (cadr (grread)) 120)
(progn													;SHORTEN line.
(setq lplus (command "lengthen" "de" (* 0.1 lts)))
(princ "\n***line lengthened***")
)
	)
	
(T nil)
)
										
		)	
(princ)
)