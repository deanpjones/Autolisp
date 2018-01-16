;;;Block Attribute Editor
;;;Created xxxxx, 2005 by Dean Jones

(defun C:test (attributes att1 / blk blkdxf blkname blktype blktypeatt att attdxf attdxf1 )

;*********************************************************************
(defun fff ()
(princ "\n *** ")
(princ "\n *** ")
(princ "\n *** ")
(princ)
)

(cond
((= blktype "INSERT") (fff))
(t nil)
)
;*********************************************************************
;*********************************************************************
;*********************************************************************
;*********************************************************************
;*********************************************************************
;*********************************************************************
(defun att1 ()

(cond
((= blktype "INSERT") (att1))

(/= (cdr (assoc 0 enlist2)) "SEQEND") nil)					;if "SEQEND" is found then it ends loop
(t nil)
)

(princ)
)
;*********************************************************************
(defun attributes ()
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

(while (/= (cdr (assoc 0 enlist2)) "SEQEND")					;LOOP until end of attributes.

			(setq att (entnext att))				;Get NEXT entity name (attribute name)
			(setq attdxf (entget att))				;Get attribute dxf property
			(setq attdxf1 (assoc 1 attdxf))				;Get attribute dxf property (1 . X)
			(princ "\n ")						;NEW LINE
			(princ attdxf1)						;Print attribute dxf properties
)

			)
		)
		)
	)	

	(entmod blkdxf)								;updates ENTITY dxf data
	(entupd blk)								;updates SCREEN of update
(princ)
)

;******************************************************************************************************************
(defun entity ()

	(if (setq ent(entsel "\n Select a Block: "))	;- Let the user select a block

	(progn                                                    
(setq en(car ent))					;- Get the entity name of the block
(setq enlist(entget en))				;- Get the DXF group codes
(setq blkType(cdr(assoc 0 enlist)))			;- Save the type of entity

	(if (= blkType "INSERT")			;- If the entity type is an Insert entity

	(progn
	(if(= (cdr(assoc 66 enlist)) 1)			;- See if the attribute flag equals one (if so, attributes follow)

	(progn
(setq en2(entnext en))					;- Get the next sub-entity
(setq enlist2(entget en2))				;- Get the DXF group codes

	(while (/= (cdr(assoc 0 enlist2)) "SEQEND")	;- Start the while loop and keep                                                                                                                   ;-  looping until SEQEND is found.

(princ "\n ")						;-Print a new line
(princ (cdr(assoc 1 enlist2)))				;- Print the attribute DXF group codes
(setq en2(entnext en2))					;- Get the next sub-entity
(setq enlist2(entget en2))				;- Get the DXF group codes

	)	;closes while statement.

	)	;closes progn.

	)  	;closes the "if" group code 66 = 1 statement.

	)	;closes progn.

	)	;closes the "if" block type = "ATTRIB" statement

	)	;closes progn.

	)	;closes the "if" an Entity is selected statement.

(princ)
)

;******************************************************************************************************************







(princ)
)

;******************************************************************************************************************
;******************************************************************************************************************
;******************************************************************************************************************
;******************************************************************************************************************


