
;(setq ss1 (ssget "X" '((0 . "INSERT") (2 . "TITLE_DRAWING_NO")))) 	;Get SELECTION SET.
;(command "pselect" "p" "")

;(command "-ATTEDIT" "y" "TITLE_DRAWING_NO"


;**********************************************************
;Get entity DXF CODES for TITLEBLOCK ENTITIES.
(defun SUBBLKNAME ( / ss1 en)
(setq ss1 (ssget "X" '((2 . "TITLE_DRAWING_NO"))))
(setq en (cadar (ssnamex ss1 0)))
)
;**********************************************************
(defun SUBATTDXF (en dxfNO / attdxf cusdxf)

	(while (/= (cdr (assoc 0 attdxf)) "SEQEND")  			;TEST until there are NO MORE ATTRIBUTES.
(setq en (entnext en))										;get NEXT ATTRIBUTE name.
(terpri)
(setq attdxf (entget en))									;get NEXT ATTRIBUTE DXF data.
(princ (setq cusdxf (cdr (assoc dxfNO attdxf)))) 			;PRINT SPECIFIC DXF CODE.
;----------------------------------------------------------------------------------------
	(if (blank) then
	(setq attdxf2 (subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2))	;**match TXT1 with TXT2 property

	(entmod attdxf2)							;updates ENTITY dxf data
	(entupd txt2)								;updates SCREEN of update
;----------------------------------------------------------------------------------------
	)														;END WHILE.
)
;**********************************************************
;MAIN FUNCTION for extracting ATTRIBUTES FROM A BLOCK.
(defun GETBLKATTDXF ( / )
(SUBATTDXF (SUBBLKNAME) 1)
(princ)
)
;**********************************************************