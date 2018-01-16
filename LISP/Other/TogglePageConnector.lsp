
;;;Toggles one page connector for it's opposite.
;;;Compliments of Dean Jones, Aug. 14, 2007.


(defun C:togglePageConnector (/ en blk blkdxf typ blkname blkinspt blkname2 blklist blkpath blkdxf2 blkinspt2 blkdxf10 )


(setq en (entsel "\n Select PAGE CONNECTOR entity: "))		;select entity
(setq blk (car en))											;get entity name
(setq blkdxf (entget blk))									;get entity dxf properties
(setq typ (cdr (assoc 0 blkdxf)))							;get entity TYPE
(setq blkname (cdr (assoc 2 blkdxf)))						;get entity BLOCK NAME
(setq blkinspt (cdr (assoc 10 blkdxf)))						;get entity INSERTION POINT


;**********************************************************************************************************
(setq blkname2												;Set blkname2 to the BLOCK to be switched to.
(cond
((= "left-ar1" blkname) "left-arr")
((= "left-arr" blkname) "left-ar1")
((= "rght-ar1" blkname) "rght-arr")
((= "rght-arr" blkname) "rght-ar1")
((= "dual-ar1" blkname) "dual-arr")
((= "dual-arr" blkname) "dual-ar1")
(T nil)
))

;***************************************
;***************************************
;Lists the blocks in the drawing.
(defun table (s / d r)
(while (setq d (tblnext s (null d)))
(setq r (cons (cdr (assoc 2 d)) r))
)
)

(setq blklist (table "block"))								;Creates a list of blocks in the drawing.

(if 														;Test to see if the block is in the drawing.
(= nil (member blkname2 blklist))
(progn
(setq blkpath (findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Flow\\" blkname2 ".dwg")))		;Searches for new block name.
(command "_.-insert" (strcat blkname2 "=" blkpath) (command))									;Updates the block with the specified filename.
))

;***************************************
;***************************************

(if 														;test statement to see if it's a BLOCK and with the CORRECT NAME.
(and (= "INSERT" typ)
(or
(= "rght-ar1" blkname)
(= "rght-arr" blkname)
(= "left-ar1" blkname)
(= "left-arr" blkname)
(= "dual-ar1" blkname)
(= "dual-arr" blkname)
))

;****************************************************************
;***Match BLKNAME with BLKNAME2 property

(setq blkdxf2 (subst (cons 2 blkname2) (assoc 2 blkdxf) blkdxf))

;****************************************************************
);END IF.
															;updates ENTITY dxf data
(entmod blkdxf2)
(entupd blk)

;**********************************************************************************************************
;**********************************************************************************************************

(setq blkinspt2												;Set blkinspt to the NEW INSERTION to be switched to.
(cond
((= "left-ar1" blkname) -50)
((= "left-arr" blkname) 50)
((= "rght-ar1" blkname) 50)
((= "rght-arr" blkname) -50)
((= "dual-ar1" blkname) 50)
((= "dual-arr" blkname) -50)
(T nil)
))

;****************************************************************

(setq blkinspt2 (list (+ (car blkinspt) blkinspt2) (cadr blkinspt) (caddr blkinspt)))  ;Sets new BLKINSPT2

;***Match BLKINSPT with BLKINSPT2 property
(setq blkdxf10 (subst (cons 10 blkinspt2) (assoc 10 blkdxf2) blkdxf2))

;****************************************************************

															;updates ENTITY dxf data
(entmod blkdxf10)
(entupd blk)												;updates SCREEN of update

;Syncronize Attributes to block.
(arxload "battman")(acet-attsync blkname2)

);END DEFUN.






