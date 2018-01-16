;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;NOTE THIS DOESN'T WORK YET;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;TEXT STYLE NAME CHANGED BUT NOT THE PROPERTIES SUCK AS THE OBLIQUING ANGLE WITH IT;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;THIS MAY BE DUE TO CHANGING IT BY A DXF FORMAT, MAY NEED TO CHANGE EACH PROPERTY OF THE STYLE;;;;;;;;;;;;;;;
;;;IS THERE AN ALTERNATIVE USING A COMMAND LINE FUNCTION?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;Changes selected TEXT OR DIMENSIONS from one STYLE to another.

(defun C:chgstyl (/ ss num ennum en endxf txtstyle dimstyle)

(setq ss
(ssget '((-4 . "<or")
	(-4 . "<and")
	(0 . "TEXT")
	(7 . "ISO-L,ISO-R")
	(-4 . "and>")
	(-4 . "<and")
	(0 . "DIMENSION")
	(3 . "ISO-L,ISO-R")
	(-4 . "and>")
	(-4 . "or>")
	)
)
)
(setq num (sslength ss))						;get number of entities
(setq ennum -1)
	(repeat num							
(setq en (ssname ss (setq ennum (1+ ennum))))				;get entity name
(setq endxf (entget en))						;get entity dxf properties
(setq txtstyle (cdr (assoc 7 endxf)))					;get TEXT STYLE dxf property 
	(if (= txtstyle "ISO-L")
(setq endxf (subst (cons 7 "ISO-R") (assoc 7 endxf) endxf))		;if TXT STYLE is "ISO-L" then change to "ISO-R"
(setq endxf (subst (cons 7 "ISO-L") (assoc 7 endxf) endxf))		;if TXT STYLE is "ISO-R" then change to "ISO-L"
	)
	)
(entmod endxf)								;updates ENTITY dxf data
(entupd en)								;updates SCREEN of update

(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

