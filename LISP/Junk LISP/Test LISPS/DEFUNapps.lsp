;;;TO SELECT OBJECT AND GET DXF INFO, does not save the object...
;----------------------------------
(entget (car (entsel)))
;----------------------------------


;;;IDENTIFY OBJECT
;;;Created Feb.28, 2005 by Dean Jones

(defun IDBLK (/ blk blkdxf blktype)


	(setq blk (car (entsel "\n Select object: ")))				;*select entity, and get name
	(setq blkdxf (entget blk))						;get entity dxf properties
	(setq blktype (cdr (assoc 0 blkdxf)))					;Get block type dxf

	(cond
		((= blktype "INSERT") (princ "this IS a BLOCK!"))		;If EQUAL, it sets the return values TRUE
		((/= blktype "INSERT") (alert "this is NOT a block!"))		;If NOT EQUAL, it sets the return values FALSE
	(t (ALERT "This is NOT a Block!"))
	)

)

;-------------------------------------------------------------------------------------------------------------

;;;IDENTIFY TEXT/ATTRIBUTE
;;;Created Mar.01, 2005 by Dean Jones

(defun IDTXT (/ txt txtdxf txttype att attdxf)


	(setq txt (car (entsel "\n Select text object: ")))			;*select entity, and get name
	(setq txtdxf (entget txt))						;get entity dxf properties
	(setq txttype (cdr (assoc 0 txtdxf)))					;Get block type dxf

	(cond
		((= txttype "TEXT") (princ "this IS TEXT!"))			;If EQUAL, it sets the return values TRUE

	(t (ALERT "This is NOT text!"))
	)

)

;-------------------------------------------------------------------------------------------------------------
;;;REVISION UPDATE
;;;Created Mar.07, 2005 by Dean Jones

(defun IDATT (/ txt txtdxf txttype att attdxf)


	(setq txt (car (entsel "\n Select text object: ")))			;*select entity, and get name
	(setq txtdxf (entget txt))						;get entity dxf properties
	(setq txttype (cdr (assoc 0 txtdxf)))					;Get block type dxf

	(cond
		((= txttype "INSERT")						;If "INSERT" entity, then...
			(progn							;...Check if attributes follow
			(if 
			(= (cdr (assoc 66 txtdxf)) 1)				;if (66 . 1), then attributes exist			
			(princ "this IS an ATTRIBUTE!")				;If EQUAL, it sets the return values TRUE
			)
			)
		)
	(t (ALERT "This is NOT an Attribute!"))
	)

)

;-------------------------------------------------------------------------------------------------------------


(defun APP1 (/ AAA)

	(setq AAA (princ "DEFUN WORKS"))

)

;-------------------------------------------------------------------------------------------------------------
;;;Command Prompt applications
;;;Created Mar.01, 2005 by Dean Jones

(defun c:app (/ )

(IDBLK)
(IDTXT)
(IDATT)

(princ)
)

