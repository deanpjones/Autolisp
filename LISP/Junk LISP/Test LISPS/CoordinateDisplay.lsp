;;;Coordinate Display using North South East and West.

;;;Would be nice to determine which UCS is CURRENT in the display as well!

(setq a (getpoint "\nSelect Point: "))

(setq x (car a) y (cadr a) z (caddr a))


	(cond
((= nil (minusp x)) (doX+))			;if +
((= T (minusp x)) (doX-))			;if -
	)
	
	(cond
((= nil (minusp y)) (princ "\n Y is positive"))			;if +
((= T (minusp y)) (princ "\n Y is negative"))			;if -
	)

	(cond
((= nil (minusp z)) (princ "\n Z is positive"))			;if +
((= T (minusp z)) (princ "\n Z is negative"))			;if -
	)

(defun doX-
(setq sX (rtos (abs x)))
(if (> 5 (strlen sX)) (dobreak string)	(elseadd 0+))				;if W.1+00.000 occurs
(setq strX (strcat "W."sX""))
)	
	
	
	
	
	
(princ "\n X is positive")