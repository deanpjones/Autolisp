;;;List Formater
;;;Dean Jones, April 25, 2006

(setq blk (car (entsel "\n Select block: ")))(setq blkdxf (entget blk))			;gets BLOCK info.	
----OR----
(setq blk (car (nentsel "\n Select block: ")))(setq blkdxf (entget blk))		;gets NESTED ENTITY info.
;------------------------------------------
;Formats the DXF CODES more easily to read.
(foreach n blkdxf (princ n) (terpri))