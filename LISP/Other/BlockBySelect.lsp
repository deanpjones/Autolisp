
;*************************************
;Selects ALL BLOCKS by selecting one block.
;Dean Jones, Dec.10, 2009.
(defun C:BlockBySelect (/ blkname ss)

;------------------------------------------------------------
;Select the block.
(setq blkname (cdr (assoc 2 (entget (myblk 1 nil)))))

;Grab all blocks with this name in a selection set.
(setq ss (ssget "X" (list (cons 0 "INSERT")(cons 2 blkname))))

;Select blocks.
(sssetfirst nil ss)
;------------------------------------------------------------

(princ)
);end defun.

