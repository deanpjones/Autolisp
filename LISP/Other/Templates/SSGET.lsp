(setq pt1 (getpoint))										;Get Point
(setq ss1 (ssget "C" pt1 pt1 '((0 . "LINE")))) 				;Get SELECTION SET.

(defun C:REVCHG ( / ss1 )
(setq ss1 (ssget "X" '((0 . "INSERT") (2 . "revtri")))) 	;Get SELECTION SET.
(command "pselect" "p" "")
)



;**************************************************************************************************
;Select multiple blocks and VIEW their DXF CODES.
(setq ss1 (ssget '((0 . "INSERT"))))						;Get BLOCKS SET.
(setq sslen (sslength ss1))									;Get NUMBER IN SELECTION SET.

(repeat sslen												;Get ENTITY NAMES FOR EACH SELECTION.
(progn
(setq ent (ssname ss1 (1- sslen)))
(setq entdxf (entget ent))

(terpri)(princ entdxf)(terpri)

(setq sslen (1- sslen))
))
;**************************************************************************************************

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