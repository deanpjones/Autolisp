;------------------------------------------
;------------------------------------------
(setq blk (car (entsel "\n Select block: ")))(setq blkdxf (entget blk))			;gets BLOCK info.	
(setq blk (car (nentsel "\n Select block: ")))(setq blkdxf (entget blk))		;gets NESTED ENTITY info.
;------------------------------------------
;Formats the DXF CODES more easily to read.
(foreach n blkdxf (princ n) (terpri))
;------------------------------------------
;------------------------------------------

;------------------------------------------
;------------------------------------------
(setq arglist '(1 2 3 4 5 6 7 8))

(mapcar '1+ arglist)								;Adds 1 to each member of the list.

(mapcar 'set '(a b c d e f g h) arglist)			;Assigns each variable to each value (eg. a = 1, b = 2, c = 3 ...)

(setq arglist '(1 2 3 4 5 6 7 8))					;Assigns a custom variable to each value (eg. varX = X, var1 = 1 ...)
(mapcar '(lambda (x) (set (read (strcat "var" (itoa x))) x)) arglist)
;------------------------------------------
;------------------------------------------

	(vl-load-all "TextRotate.lsp")
	(vl-load-all "TextSwap.lsp")
	(vl-load-all "TextUnderline.lsp")
	(vl-load-all "TextMatch.lsp")
	
(setq loadlist '("TextMatch.lsp" "TextJustify.lsp" "TextRotate.lsp" "TextSwap.lsp" "TextUnderline.lsp" "agh.lsp"))

(if (mapcar '(lambda (x) (vl-load-all x)) loadlist)
(mapcar '(lambda (x) (princ (strcat "\nLoading " x " successful!!")) (princ)) loadlist)
(mapcar '(lambda (x) (princ (strcat "\nLoading " x " failed!?")) (princ)) loadlist)
)

(setq loadlist '("TextMatch.lsp" "TextJustify.lsp" "TextRotate.lsp" "asdf.lsp" "TextSwap.lsp" "TextUnderline.lsp" "agh.lsp"))
(mapcar '(lambda (x) (load x (strcat "\n" x " not loaded"))) loadlist)


;------------------------------------------
;------------------------------------------