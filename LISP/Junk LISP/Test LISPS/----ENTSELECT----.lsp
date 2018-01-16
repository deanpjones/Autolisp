
;;;Returns dxf data on entities.

(setq blk (car (nentsel "\n Select block: ")))(setq blkdxf (entget blk))		;gets NESTED ENTITY info.	

(setq blk (car (entsel "\n Select block: ")))(setq blkdxf (entget blk))		;gets BLOCK info.		



(setq att (entnext blk))(setq attdxf (entget att))				;gets ATTRIBUTE info.				

(setq att (entnext att))(setq attdxf (entget att))				;gets continued ATTRIBUTES info.


;;;***************************************************************************************************************			


(setq blk (car (entsel "\n Select block: ")))(setq blkdxf (entget blk))		;gets BLOCK info.		



(setq att (entnext blk))(setq attdxf (entget att))				;gets ATTRIBUTE info.	

;**********************************************
(setq flddxf (entget (cdr (assoc 360 attdxf))))					;gets FIELD info?????
;**********************************************





(entget (namedobjdict))	;lists dictionary info.

(setq dictinfo (entget (cdr (assoc 350 attdxf))))