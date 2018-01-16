;;;REVISION UPDATE
;;;Created Mar.07, 2005 by Dean Jones

(defun IDATT (/ txt txtdxf txttype)

	(setq txt (car (entsel "\n Select text object: ")))			;*select entity, and get name
	(setq txtdxf (entget txt))						;get entity dxf properties
	(setq txttype (cdr (assoc 0 txtdxf)))					;Get block type dxf

	(cond
		((= txttype "INSERT")						;If "INSERT" entity, then...
			(progn							;...Check if attributes follow
			(if 
			(= (cdr (assoc 66 txtdxf)) 1)				;if (66 . 1), then attributes exist			
			T							;If EQUAL, it sets the return value to T (TRUE)
			)
			)
		)
	(t NIL)									;If NOT EQUAL, it sets the return value to NIL
	)

)

;-------------------------------------------------------------------------------------------------------------

(defun DXFATT (/ txt att attdxf attdxf1)

;Need to Pick Attribute once, and then somehow ID it then use it to move to the next function to 
;proceed to get the DXF info without picking it again....


;;;;---		(setq txt (car (entsel "\n Select text object: ")))	;*select entity, and get name

		(setq att (entnext txt))				;Get NEXT entity name (attribute name)
		(setq attdxf (entget att))				;Get attribute dxf property
		(setq attdxf1 (assoc 1 attdxf))				;Get attribute dxf property (1 . X)
		(princ "\n ")						;NEW LINE
		(princ attdxf1)						;Print attribute dxf properties

)

;-------------------------------------------------------------------------------------------------------------


(defun C:REV (/ txt)

	(IDATT)
	(DXFATT)

)

;-------------------------------------------------------------------------------------------------------------


