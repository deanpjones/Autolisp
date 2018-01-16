;;;Converting TEXT FROM "psi" to "kPa".
;;;Compliments of Dean Jones, Sep. 02, 2005.

	(defun c:converttxt (/ en txt txtdxf txtstring txtlist)

;---------------------------------------------------------------
;---------------------------------------------------------------

(setq en (nentsel "\n Select text entity (psig-kPag): "))			;select entity
(setq txt (car en))													;get entity name
(setq txtdxf (entget txt))											;get entity dxf properties
(foreach n txtdxf (princ n) (terpri))								;PRINT,	DXF properties

(setq txtstring (cdr (assoc 1 txtdxf)))								;get TEXT STRING dxf property
(setq txtlist (read (strcat "(" txtstring ")")))					;Converts STRING to LIST OF SYMBOLS.
(setq txtlist (mapcar '(lambda (x) (vl-symbol-name x)) txtlist))	;Converts LIST OF SYMBOLS to LIST OF STRINGS.


(foreach n txtlist (type n))



;---------------------------------------------------------------
;---------------------------------------------------------------
(defun MAKELIST ()

)
;---------------------------------------------------------------
;---------------------------------------------------------------
	(defun topsi (/ psiext psinum a b c x kpasuffix psitxt)

	(setq psinum (if (wcmatch txtstring "*`,*")				;***Tests for a case with a comma, eg. 10,200 kPag.
(progn										;then...
(setq a (substr txtstring 1 (vl-string-search " " txtstring)))			;Isolates the string(###) before the space.
(setq b (vl-string-subst "" "," a))						;if "," is found then remove from string.
(setq c (rtos (* (atof b) 0.1450377) 2 0))					;Converts to real/Converts to psi/Converts to string to one decimal.
)

(progn										;else...
(setq a (substr txtstring 1 (vl-string-search " " txtstring)))			;Isolates the string(###) before the space.
(setq c (rtos (* (atof a) 0.1450377) 2 0))					;Converts to real/Converts to psi/Converts to string to one decimal.
)
	))

(setq kpasuffix (substr txtstringb (+ 2 (vl-string-search " " txtstringb))))	;Isolate units as string.

(setq psiext (cond
((wcmatch txtstringb "*kpag*") (vl-string-subst "psig" "kpag" kpasuffix))	;Convert extention for whichever case suits.
((wcmatch txtstringb "*kpa*") (vl-string-subst "psi" "kpa" kpasuffix))
(t nil)
))

;*****************************************************************************************
(setq x (strlen psinum))							;get length of string.
(setq y (/ x 3))								;get number of threes in string length.
(setq counter 0)
(setq psinumb psinum)
	(setq z (while (= counter y)						;loop til counter reaches "y".
(setq counter (1+ counter))							;count
(setq psinumb (strcat "," (substr psinum (1+ (- x (* 3 counter))))) (length?))	;build string in loop by adding commas from right to left.

)
(if (>= 5 x)									;IF number string is five characters or more...
(setq psinum (strcat (substr psinum 1 (- x 3)) "," (substr psinum (- x 2))))	;adds "," to the string.
;*****************************************************************************************

(setq psitxt (strcat psinum " " psiext))					;Concats the new # and units together.

(setq txtdxf (subst (cons 1 psitxt) (assoc 1 txtdxf) txtdxf))			;***Changes txtdxf entity data.

(entmod txtdxf)									;updates ENTITY dxf data
(entupd txt)

(princ "\n********Text Pressure Conversion SUCCESSFUL!!!********")

	)
;---------------------------------------------------------------
	(defun tokpa (/ kpaext kpanum d e f psisuffix kpatxt)

	(setq kpanum (if (wcmatch txtstring "*`,*")				;***Tests for a case with a comma, eg. 10,200 kPag.
(progn										;then...
(setq d (substr txtstring 1 (vl-string-search " " txtstring)))			;Isolates the string(###) before the space.
(setq e (vl-string-subst "" "," d))						;if "," is found then remove from string.
(setq f (rtos (* (atof e) 6.894757) 2 0))					;Converts to real/Converts to kpa/Converts to string to one decimal.
)

(progn										;else...
(setq e (substr txtstring 1 (vl-string-search " " txtstring)))			;Isolates the string(###) before the space.
(setq f (rtos (* (atof e) 6.894757) 2 0))					;Converts to real/Converts to kpa/Converts to string to one decimal.
)
	))

(setq psisuffix (substr txtstringb (+ 2 (vl-string-search " " txtstringb))))	;Isolate units as string.

(setq kpaext (cond
((wcmatch txtstringb "*psig*") (vl-string-subst "kPag" "psig" psisuffix))	;Convert extention for whichever case suits.
((wcmatch txtstringb "*psi*") (vl-string-subst "kPa" "psi" psisuffix))
(t nil)
))

(setq kpatxt (strcat kpanum " " kpaext))					;Concats the new # and units together.

(setq txtdxf (subst (cons 1 kpatxt) (assoc 1 txtdxf) txtdxf))			;***Changes txtdxf entity data.

(entmod txtdxf)									;updates ENTITY dxf data
(entupd txt)

(princ "\n********Text Pressure Conversion SUCCESSFUL!!!********")

	)
;---------------------------------------------------------------

;***************************************************************
;***************************************************************
;***************************************************************


	  
	(cond
((wcmatch txtstringb "*kpa*") (topsi))
((wcmatch txtstringb "*psi*") (tokpa))
(t (princ "\n******************PLEASE TRY AGAIN!******************"))
	)

(princ)
	)

;***************************************************************
;***************************************************************
;***************************************************************
