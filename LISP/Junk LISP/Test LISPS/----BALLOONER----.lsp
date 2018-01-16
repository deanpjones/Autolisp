;;;BALLOONER
;;;Returns dxf data on entities.

;*****************************************************************************************************
;*****************************************************************************************************
;;;Selection Set to pick all the attribute tags for BOM numbers (Returns BOM MARK#, and COORDINATES).
(defun BOM_MK (/ ss1 ssnum count att attdxf attdxf1 blk blkdxf10)

(setq ss1 (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "*blk*"))))			;gets selection set for entire database.
(setq ss1num (sslength ss1))							;gets number of entities in selection set.

(setq count 0)									;sets counter to zero.
	(while (< count ss1num)							;test for counter zero to number of entities.
(setq att (entnext (ssname ss1 count)))(setq attdxf (entget att))		;gets dxf info for each first ATTRIBUTE in selection set.

(setq attdxf1 (assoc 1 attdxf))							;gets (1 . x) dxf property (bom mark).
(princ "\n ")						
;(princ attdxf)									;Print attribute dxf properties
(princ attdxf1)									;Print (1 . x) dxf property (bom mark).

(setq blk (entget (ssname ss1 count)))						;gets dxf info for each BLOCK in selection set.
(setq blkdxf10 (assoc 10 blk))							;;gets (10 . x) dxf property (coordinates).						
;(princ blk)									;Print attribute dxf properties
(princ blkdxf10)								;Print (10 . x) dxf property (coordinates).
(princ "\n ")

(setq count (1+ count))								;steps up one for every count.
	)

(setq ss1 nil)									;release selection set from memory.

(princ)
)

;*****************************************************************************************************
;*****************************************************************************************************
;;;CREATE A BLOCK AND INSERT IT WITH A FIELD LINKED TO THE ABOVE INFO.

(setq fld (entnext (ssname ss1 count)))(setq flddxf (entget fld))
(princ flddxf)
;*****************************************************************************************************
;*****************************************************************************************************

;*****************************************************************************************************
;*****************************************************************************************************
;;;Finds the Balloon Mark Number from attribute.
(defun BALLOONLINK (/ ss1 blk blkdxf blktype att attdxf)


;*********************************************
(cond
((= blktype "INSERT") (att1))

(/= (cdr (assoc 0 attdxf)) "SEQEND") nil)					;if "SEQEND" is found then it ends loop
(t nil)
)
;*********************************************

(setq blk (car (entsel "\n Select block: ")))
(setq blkdxf (entget blk))

(setq blktype (cdr (assoc 0 blkdxf)))			
	(if (= blktype "INSERT")						;If "INSERT" entity, then...
()
()
	)


(setq att (entnext blk))(setq attdxf (entget att))				

(setq att (entnext att))(setq attdxf (entget att))		
		

;*****************************************************************************************************
;*****************************************************************************************************