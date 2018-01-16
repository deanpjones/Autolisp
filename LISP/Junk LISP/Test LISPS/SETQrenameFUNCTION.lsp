;;;SETQ RENAMER FUNCTION


(setq ss1 (ssget "X" 
 '(
    (-4 . "<OR")
(2 . "pip_blk")
(2 . "flg_blk")
(2 . "ftg_blk")
(2 . "scr_blk")
(2 . "nip_blk")
(2 . "gsk_blk")
(2 . "blt_blk")
(2 . "val_blk")
(2 . "mis_blk")
(2 . "sup_blk")
(2 . "dim_blk")
    (-4 . "OR>")
  )
)
)

(setq sslen (sslength ss1))											;GETS the # OF BLOCKS.

(setq count sslen)													;SETS COUNT for extraction.
	(while (not (= count 0))										;WHILE, until there are NO BLOCKS.
	(setq varnum (itoa count))										;(SETQ VARNUM enDXF) unique name for each dxf data.
		(set (read (strcat "en" (eval varnum))) dxfcodes)
	
		
		
		
;-------------------------------------------------------
;Sets a SYMBOL to a LIST.

(setq arglist '(12.0 145.8 67.2 "M20"))
		
(mapcar 'set '(a b c d) arglist)
;-------------------------------------------------------
;Sets a SYMBOL TO A LIST while also applying a FUNCTION.
(defun testset ()
	(setq c '(23.0 47.8 52.1 35.6))
	(setq d (mapcar '(lambda (a) (* pi (/ a 180.0))) c))
	(mapcar 'set '(w x y z) d)
   (princ)
)
;-------------------------------------------------------	