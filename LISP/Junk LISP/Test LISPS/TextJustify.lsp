;---------------------------------------------------------------------------------------------------------
;;;Justifies TEXT string by selection.

;MIDDLE Justification
(defun txtjmid 
	(progn
	(subst (cons '72 4) (assoc 72 txtdxf) txtdxf) 				;sets TEXT JUSTIFICATION 72 dxf property
	(subst (cons '73 0) (assoc 73 txtdxf) txtdxf)				;sets TEXT JUSTIFICATION 73 dxf property
	)
)

;---------------------------------------------------------------------------------------------------------
;;;Gets Justification input

(defun justinput
	(initget "Middle ML")							;sets Keywords
	(getkword "\nEnter justification (Middle/ML): ")			;gets USER to TYPE a justification
)

;---------------------------------------------------------------------------------------------------------


(defun C:txtj (/ en txt txtdxf)

	(setq en (entsel "\n Select text entity to justify: "))			;select entity
	(setq txt (car en))							;get entity name
	(setq txtdxf (entget txt))						;get entity dxf properties

(subst (cons 72 4) (assoc 72 txtdxf) txtdxf)
(subst (cons 73 0) (assoc 73 txtdxf) txtdxf)

	(entmod txtdxf)								;updates ENTITY dxf data
	(entupd txt)								;updates SCREEN of update

(princ)
)

;---------------------------------------------------------------------------------------------------------
	(txtjmid)								;MIDDLE justification.