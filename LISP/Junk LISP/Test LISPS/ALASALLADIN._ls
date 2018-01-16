;;;Created Feb.25, 2005 by Dean Jones

(defun C:test (/ blk blkdxf blkspecific blktype blktypeatt att attdxf)


	(setq blk (car (entsel "\n Select block: ")))				;*select entity, and get name
	(setq blkdxf (entget blk))						;get entity dxf properties
	(setq blkspecific (cdr (assoc xx blkdxf)))				;get SPECIFIC dxf property
	(setq blktype (cdr (assoc 0 blkdxf)))					;Saves block type.

	(if (= blktype "INSERT")						;If "INSERT" entity, then...
		(progn								;...Check if attributes follow
		(if (= (cdr (assoc 66 blkdxf)) 1)
			(progn
			(setq att (entnext blk))				;Get NEXT entity name (attribute name)
			(setq attdxf (entget att))				;Get attribute dxf property
			(princ "\n ")						;NEW LINE
			(princ (assoc 1 attdxf))				;Print attribute dxf properties
		)
		)
	)	

	(entmod blkdxf)								;updates ENTITY dxf data
	(entupd blk)								;updates SCREEN of update

(princ)
)

