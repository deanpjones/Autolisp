;;;Justify TEXT string by selection.
;;;Compliments of Dean Jones, Mar. 23, 2006.


(defun C:tg (/ en txt txtdxf typ j72a j73a j72b j73b)

	(while
(setq en (entsel "\n Select text entity: "))					;select entity
(setq txt (car en))												;get entity name
(setq txtdxf (entget txt))										;get entity dxf properties
(setq typ (cdr (assoc 0 txtdxf)))								;get entity TYPE

;***************************************************************************************************************
;***************************************************************************************************************
	(if
(= "TEXT" typ)													;test statement to see if it's got TEXT in it.
	(progn															;if there is TEXT then continue.
;----------------------------------------------------------------------------------------------------

(setq j72a (cdr (assoc 72 txtdxf)))								;get TEXT JUSTIFICATION dxf property
(setq j73a (cdr (assoc 73 txtdxf)))								;get TEXT JUSTIFICATION dxf property



	(cond														;TEST for MID, ML, MR and Toggle.
((and (= j72a 4) (= j73a 0)) (setq j72b 4 j73b 0))				;MIDDLE - MIDDLE
((and (= j72a 2) (= j73a 2)) (setq j72b 0 j73b 2))				;MIDDLE RIGHT - MIDDLE LEFT
((and (= j72a 0) (= j73a 2)) (setq j72b 2 j73b 2))				;MIDDLE LEFT - MIDDLE RIGHT
(T nil)
	)

	
(setq txtdxf (subst (cons 72 j72b) (assoc 72 txtdxf) txtdxf))		;**change TEXT JUSTIFICATION property
(entmod txtdxf)													;updates ENTITY dxf data
(setq txtdxf (subst (cons 73 j73b) (assoc 73 txtdxf) txtdxf))		;**change TEXT JUSTIFICATION property
(entmod txtdxf)													;updates ENTITY dxf data
	)															;END PROGN
;--------------------------------------------

(princ "\n*** NO TEXT HERE ANYWHERE BOYS!!! ***")				;ELSE, print statement.
	)															;END IF
;***************************************************************************************************************
;***************************************************************************************************************													;END IF

(entupd txt)													;updates SCREEN of update
(princ "\n*** TEXT JUSTIFICATION changed!!! ***")
	)															;END WHILE
	
(princ)
)

