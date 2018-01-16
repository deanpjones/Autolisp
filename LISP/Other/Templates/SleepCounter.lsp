


(setq en (nentsel "\n Select block entity: "))				;select entity
(setq xyz (cadddr (caddr en)))								;set insertion of block
(setq blk (car en))											;get entity name
(setq blkdxf (entget blk))									;get DXF properties

(setq blkrot (cdr (assoc 50 blkdxf)))						;get BLOCK ROTATION ANGLE


(acet-sys-sleep 1000)