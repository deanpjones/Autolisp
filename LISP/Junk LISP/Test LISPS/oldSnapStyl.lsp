
;;; This routine toggles the isometric snap and standard snap crosshair.
;;; Jan 05, 2005 Courtesy of Dean Jones.


(defun c:ss ()
	
	(if (= (getvar "snapstyl") 1)
		(progn 
			(setvar "snapstyl" 0)
			(setvar "gridunit" '(10 10))
			(setvar "snapunit" '(1 1))
		)
		(progn 
			(setvar "snapstyl" 1)
			(setvar "gridunit" '(17.32050808 5.0))
			(setvar "snapunit" '(1.73205081 1.0))
		)
	)

(princ)

)
