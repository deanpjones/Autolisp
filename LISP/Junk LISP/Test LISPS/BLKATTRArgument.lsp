;;;ATTRIBUTES WITHIN BLOCKS, ARGUMENT TEMPLATE by Dean Jones April 20, 2006.

;;;TO RUN SUBROUTINES at the command line type: (subroutinename argument1 argument2, etc.)
;;;eg. (SUBeENT 1)
;;;it will return (1 . value of the picked object)
;;;eg. (SUBeENT 2)
;;;it will return (2 . value of the picked object) 

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************
;;;for ARGUMENTS they should be DECLARED IN THE FUNCTION USING THEM.

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;Get entity DXF CODES for a BLOCK WITH ATTRIBUTES.
(defun SUBBLKNAME ( / en )
(setq en (car (entsel)))									;get ENTITY NAME.
)

--------------------------------OR----------------------------------------

;Get entity DXF CODES for TITLEBLOCK ENTITIES.
(defun SUBBLKNAME ( / ss1 en)
(setq ss1 (ssget "X" '((2 . "TitleBlock"))))
(setq en (cadar (ssnamex ss1 0)))
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Get entity DXF CODES for ATTRIBUTES WITHIN A BLOCK.
(defun SUBATTDXF (en dxfNO / attdxf cusdxf)

	(while (/= (cdr (assoc 0 attdxf)) "SEQEND")  			;TEST until there are NO MORE ATTRIBUTES.
(setq en (entnext en))										;get NEXT ATTRIBUTE name.
(terpri)
(setq attdxf (entget en))									;get NEXT ATTRIBUTE DXF data.
(princ (setq cusdxf (cdr (assoc dxfNO attdxf)))) 			;PRINT SPECIFIC DXF CODE.
	)														;END WHILE.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;MAIN FUNCTION for extracting ATTRIBUTES FROM A BLOCK.
(defun GETBLKATTDXF ( / )
(SUBATTDXF (SUBBLKNAME) 1)
(princ)
)

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************