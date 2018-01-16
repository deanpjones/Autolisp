;;;Block Attribute Editor
;;;Created Feb.25, 2005 by Dean Jones

(defun C:test (/ blk blkdxf blkname blktype blktypeatt att attdxf attdxf1 )

;*********************************************************************
(defun fff ()
(princ "\n *** ")
(princ "\n *** ")
(princ "\n *** ")
)

(cond
((= blktype "INSERT") (fff))
(t nil)
)
;*********************************************************************

	(setq blk (car (entsel "\n Select block: ")))				;*select entity, and get name
	(setq blkdxf (entget blk))						;get entity dxf properties
	(setq blkname (cdr (assoc 2 blkdxf)))					;get SPECIFIC dxf property
	(setq blktype (cdr (assoc 0 blkdxf)))					;Saves block type.

	(if (= blktype "INSERT")						;If "INSERT" entity, then...
		(progn								
		(if (= (cdr (assoc 66 blkdxf)) 1)				;...Check if attributes follow

			(progn
			(setq att (entnext blk))				;- Get the next sub-entity
			(setq attdxf (entget att))				;- Get the DXF group codes
			(princ "\n ")						
			(princ attdxf)						;Print attribute dxf properties

;*********************************************************************

(while (/= (cdr (assoc 0 enlist2)) "SEQEND")					;LOOP until end of attributes.

			(setq att (entnext att))				;Get NEXT entity name (attribute name)
			(setq attdxf (entget att))				;Get attribute dxf property
			(setq attdxf1 (assoc 1 attdxf))				;Get attribute dxf property (1 . X)
			(princ "\n ")						;NEW LINE
			(princ attdxf1)						;Print attribute dxf properties
)

;*********************************************************************

(cond 
(
((/= (cdr (assoc 0 enlist2)) "SEQEND") nil)

;*********************************************************************
			)
		)
		)
	)	

	(entmod blkdxf)								;updates ENTITY dxf data
	(entupd blk)								;updates SCREEN of update

(princ)
)

;******************************************************************************************************************
;******************************************************************************************************************
;******************************************************************************************************************
;******************************************************************************************************************


