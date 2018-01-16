;;;Converting TEXT FROM "psi" to "kPa".
;;;Compliments of Dean Jones, Sep. 02, 2005.

;---------------------------------------------------------------
;---------------------------------------------------------------
	(defun idtxt (/ en txt txtdxf txtstring txtstringb)

(setq en (entsel "\n Select text entity (psig-kPag): "))			;select entity
(setq txt (car en))								;get entity name
(setq txtdxf (entget txt))							;get entity dxf properties
(setq txtstring (cdr (assoc 1 txtdxf)))						;get TEXT STRING dxf property

(setq txtstringb (strcase txtstring T))						;***Convert string to lowercase.

	)
;---------------------------------------------------------------
;---------------------------------------------------------------
	(defun topsi (/ psiext psinum kpasuffix psitxt)

	(setq psinum
(progn
(substr txtstring 1 (vl-string-search " " txtstring))				;Isolates the string(###) before the space.
(rtos (* (atof txtstring) 0.1450377) 2 0)					;Converts to real/Converts to psi/Converts to string to one decimal.
)					
	)

(setq kpasuffix (substr txtstringb (+ 2 (vl-string-search " " txtstringb))))	;Isolate units as string.

(setq psiext (cond
((wcmatch txtstringb "*kpag*") (vl-string-subst "psig" "kpag" kpasuffix))	;Convert extention for whichever case suits.
((wcmatch txtstringb "*kpa*") (vl-string-subst "psi" "kpa" kpasuffix))
(t nil)
))

(setq psitxt (strcat psinum " " psiext))					;Concats the new # and units together.

(setq txtdxf (subst (cons 1 psitxt) (assoc 1 txtdxf) txtdxf))			;***Changes txtdxf entity data.

(entmod txtdxf)									;updates ENTITY dxf data
(entupd txt)

(princ "\n********Text Pressure Conversion SUCCESSFUL!!!********")

	)
;---------------------------------------------------------------
	(defun tokpa (/ kpaext kpanum psisuffix kpatxt)

	(setq kpanum
(progn
(substr txtstring 1 (vl-string-search " " txtstring))				;Isolates the string(###) before the space.
(rtos (* (atof txtstring) 6.894757) 2 0)					;Converts to real/Converts to kpa/Converts to string to one decimal.
)					
	)

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

	(defun c:converttxt (/)

(idtxt) 

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
