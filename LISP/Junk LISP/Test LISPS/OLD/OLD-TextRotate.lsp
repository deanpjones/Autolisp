;;;Rotate TEXT string by selection.
;;;Compliments of Dean Jones, Oct. 12, 2005.
;;;Lisp routine created in five minutes!!!

(defun C:tr (/ en txt txtdxf txtrot)

(while
	(setq en (entsel "\n Select text entity: "))				;select entity
	(setq txt (car en))											;get entity name
	(setq txtdxf (entget txt))									;get entity dxf properties
	(setq txtrot (cdr (assoc 50 txtdxf)))						;get TEXT rotation (in radians) dxf property


	(setq txtdxf (subst (cons 50 0) (assoc 50 txtdxf) txtdxf))		;**change TEXT rotation to zero

	(entmod txtdxf)								;updates ENTITY dxf data
	(entupd txt)								;updates SCREEN of update
)

(princ)
)

