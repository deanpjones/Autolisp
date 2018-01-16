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
(acet-str-replace find1 replace2 STRING)
(setq entdxf (subst (cons 2 blkname) (assoc 2 entdxf) entdxf))			;**match SELECTED BLOCKS WITH BLK1 NAME

(entmod entdxf)															;updates ENTITY dxf data
(entupd ent)															;updates SCREEN of update
;--------------------------------------------------------------------------------------------------------------

(setq sslen (1- sslen))
))
;**************************************************************************************************