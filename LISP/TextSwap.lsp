;;;Swap TEXT strings with two selections.
;;;Compliments of Dean Jones, Sep. 13, 2005.
;;;Created entire lisp routine in under five minutes!!!


(defun C:ts (/ en txt txtdxf txtstring txt2 txtdxf2 txtstring2)

	(setq en (nentsel "\n Select text entity: "))				;select entity
	(setq txt (car en))							;get entity name
	(setq txtdxf (entget txt))						;get entity dxf properties
	(setq txtstring (cdr (assoc 1 txtdxf)))					;get TEXT STRING dxf property

	(setq txt2 (car (nentsel "\n Select text to swap: ")))			;*select entity, and get name
	(setq txtdxf2 (entget txt2))						;get entity dxf properties
	(setq txtstring2 (cdr (assoc 1 txtdxf2)))				;get TEXT STRING dxf property

;*****************************************************************************************************************
	(setq txtdxf (subst (cons 1 txtstring2) (assoc 1 txtdxf) txtdxf))	;**swap TXT2 with TXT1 property

	(entmod txtdxf)								;updates ENTITY dxf data
	(entupd txt)								;updates SCREEN of update
;*****************************************************************************************************************

;*****************************************************************************************************************
	(setq txtdxf2 (subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2))	;**swap TXT1 with TXT2 property

	(entmod txtdxf2)							;updates ENTITY dxf data
	(entupd txt2)								;updates SCREEN of update
;*****************************************************************************************************************

(princ)
)

