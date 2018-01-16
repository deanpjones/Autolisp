
;;;Convert angles for use with survey drawings.
;;;Compliments of Dean Jones, Feb. 03, 2005.

;;;Settings for default.
  
(defun c:def ()
	
	(setvar "angbase" 0)
	(setvar "angdir" 0)
	(setvar "aunits" 0)
	(setvar "auprec" 1)

(princ "\n*****Format for ANGLE UNITS are set to DEFAULT.*****")
(princ)
)

;;;Settings for Site Plans.

(defun c:srv ()
	
	(setvar "angbase" (* pi (/ 90 180.0)))
	(setvar "angdir" 1)
	(setvar "aunits" 1)
	(setvar "auprec" 3)

(princ "\n*****Format for ANGLE UNITS are set to SURVEY UNITS.*****")
(princ)
)

  


	      
		     
			    