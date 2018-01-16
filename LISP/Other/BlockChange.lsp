;;;Changes a block from ONE TYPE to ANOTHER TYPE by selecting specific blocks.
;;;Compliments of Dean Jones, Sep 20, 2007.


(DEFUN C:BLOCKCHG ( / blk1 blk1dxf blkname ss1 sslen ent entdxf)

(setq blk1 (car (entsel "Select NEW BLOCK to use: ")))
(setq blk1dxf (entget blk1))
(setq blkname (cdr (assoc 2 blk1dxf)))						;get BLOCK NAME dxf property


;**************************************************************************************************
;Select multiple blocks and CHANGE their DXF CODES.
(princ "Select ALL BLOCKS to be changed...\n")
(setq ss1 (ssget '((0 . "INSERT"))))						;Get BLOCKS SET.
(setq sslen (sslength ss1))									;Get NUMBER IN SELECTION SET.

(repeat sslen												;Get ENTITY NAMES FOR EACH SELECTION.
(progn
(setq ent (ssname ss1 (1- sslen)))
(setq entdxf (entget ent))


;--------------------------------------------------------------------------------------------------------------
(setq entdxf (subst (cons 2 blkname) (assoc 2 entdxf) entdxf))			;**match SELECTED BLOCKS WITH BLK1 NAME

(entmod entdxf)															;updates ENTITY dxf data
(entupd ent)															;updates SCREEN of update
;--------------------------------------------------------------------------------------------------------------

(setq sslen (1- sslen))
))
;**************************************************************************************************

(princ)
)

