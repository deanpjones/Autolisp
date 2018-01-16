
;**************************************************************
;**************************************************************
;**************************************************************
;**************************************************************
;**************************************************************
;**************************************************************
;**************************************************************
;Started Jan.14, 2008
;Creates a list of the blocks selected.
(setq ss1 nil sslen nil i nil mylist nil)

(setq ss1 (ssget))
(setq ss1 (ssget "P" '((0 . "INSERT") (66 . 1) (8 . "DEFPOINTS"))))
(setq sslen (sslength ss1))

(repeat (setq i (sslength ss1))
(setq 	i (1- i)
		mylist (cons (ssname ss1 i) mylist)
)
)
;*****************************************************************
;Gets DXF codes for all the blocks.
(foreach n mylist (princ (entget n))(terpri))
;*****************************************************************
;Returns first ATTRIBUTE ENTITY NAME for each block.
;(foreach n mylist (princ (entnext n))(terpri))

;Gets the each next DXF codes for every block.
;(foreach n mylist (princ (entget (entnext n)))(terpri))
;(foreach n mylist (princ (entget (entnext (entnext n))))(terpri))
;(foreach n mylist (princ (entget (entnext (entnext (entnext n)))))(terpri))
;*****************************************************************
;Gets all the block attribute entity names FOR A SINGLE BLOCK (myattlist).
(setq blk nil att nil attdxf nil myattlist nil)

(setq blk (car mylist))

(setq att (entnext blk))   ;gets first attribute name.
(setq attdxf (entget att)) ;gets DXF codes.

(while (/= (cdr (assoc 0 attdxf)) "SEQEND")
(progn
(setq myattlist (cons att myattlist))
(terpri)
(princ (setq att (entnext att)))   ;gets remaining attribute names.
(setq attdxf (entget att))         ;gets DXF codes.
))

(length myattlist)         ;gets length of list.
;*****************************************************************
;Gets DXF codes for all the attributes.
(foreach n myattlist (princ (entget n))(terpri))
;*****************************************************************



;*****************************************************************
;*****************************************************************
;Gets all the block attribute entity names FOR ALL BLOCKS COMBINED(myattlist).
(setq blk nil att nil attdxf nil myattlist nil)

		(foreach n mylist (progn

(setq att (entnext n))   			;gets first attribute name.
(setq attdxf (entget att)) 			;gets DXF codes.

(while (/= (cdr (assoc 0 attdxf)) "SEQEND")
(progn
(setq myattlist (cons att myattlist))
(terpri)
(princ (setq att (entnext att)))   	;gets remaining attribute names.
(setq attdxf (entget att))         	;gets DXF codes.
))
		))
(length myattlist)         			;gets length of list.
;*****************************************************************
;Gets DXF codes for all the attributes.
(foreach n myattlist (princ (entget n))(terpri))

;Make list of entire DXF codes., or only applicable codes.

;*****************************************************************
;(while (= (cdr (assoc 2 (entget n))) "DESC_1")

;(assoc 2 list1)
;(assoc 1 list1)

;(foreach n myattlist (princ (entget n))(terpri))
;*****************************************************************

;Need to filter for (2 . "userdefined") ATTRIBUTE TAG. (cdr(assoc 2 attlist_ALL))
;Need to filter for (1 . "userdefined") ATTRIBUTE TAG VALUE.  (cdr(assoc 1 attlist_ALL))
;So need to record (-1 . Entity Name) (2 . USERDEFINED) (1 . USERDEFINED) and make it into a selection set for all.

;?????????????????????????????????????????????????????????????????
;Goes thru attribute name list and saves attribute names that meet search query.
;Need to relay it back to which block that attribute belongs to.


;?????????????????????????????????????????????????????????????????