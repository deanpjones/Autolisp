;;;ARGUMENT TEMPLATES by Dean Jones April 17, 2006.

;;;TO RUN SUBROUTINES at the command line type: (subroutinename argument1 argument2, etc.)
;;;eg. (SUBeENT 1)
;;;it will return (1 . value of the picked object)
;;;eg. (SUBeENT 2)
;;;it will return (2 . value of the picked object) 

;;;********************************************************************
;;;********************************************************************
;;;********************************************************************
;;;********************************************************************
;;;********************************************************************


Demo

(defun plus (list)
(apply '+ list)
)

Doug

;Demo2

(defun subfun ( c d)
(if a
(do a part)
)
(if b
(do b part)
)
(do c)
(do d)
)

(defun mainfun ( / a b)
(setq a 2 b 3)
(subfun 4 5)
)


;;;********************************************************************
;GET THE VOLUME OF A CYLINDER BY INPUTING THE RADIUS AND HEIGHT FOR A TANK.
(defun SUBCYLVOL (rad hgt / ) (* (* PI (* rad rad)) hgt))
(SUBCYLVOL 10 10)
;;;********************************************************************

(defun SUBARG (arg1 / count varname) 

(setq count sslen)													;SETS COUNT for extraction.
		(while (not (= count -1))									;evaluates until there are NO ENTITIES.
	(setq varnum (itoa count))										;CONVERTS number to string.
	(set (read (strcat "a" (eval varnum)))							;CONCATENATES prefix "a" to COUNT.
	(arg1)															;(SETQ A? ???) FOR entity dxf data.
	)
		)
)

(defun MAINARG ( / ss1 sslen en endxf count)
;;;cannot use "count" in two functions?
(setq ss1 (ssget '((0 . "LINE"))))
(setq sslen (sslength ss1))
(setq en (ssname ss1 (setq count (1- count))))
(setq endxf (entget en))
(SUBARG en)				
)

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************

(defun SUBARG (arg / )
(princ (strcat "\n The fitting " arg ))
)

(defun ARG ( / )
(SUBARG "SUCKS A BIG ONE")
(princ)
)

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************
;Program that will select any EMBEDDED ENTITY and extract the USER DEFINED dxf code.
(defun SUBeENT (arg1 / en enname endxf cusdxf)

(setq en (nentsel "\n Select entity: "))					;select entity
(setq enname (car en))										;get entity name
(setq endxf (entget enname))								;get entity dxf properties
(princ (setq cusdxf (assoc arg1 endxf)))					;get CUSTOM DXF property
(princ)
)

(defun eENT ( / )
(SUBeENT 1)
(princ)
)

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************
;Program that will select any ENTITY and extract the USER DEFINED dxf code.
(defun SUBENT (arg1 / en enname endxf cusdxf)

(setq en (entsel "\n Select entity: "))						;select entity
(setq enname (car en))										;get entity name
(setq endxf (entget enname))								;get entity dxf properties
(princ (setq cusdxf (assoc arg1 endxf)))					;get CUSTOM DXF property
(princ)
)

(defun ENT ( / )
(SUBENT 1)
(princ)
)

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************
;Program that will select any EMBEDDED ENTITY and extract ALL THE dxf codes.
(defun SUBDXFCODES ( / en enname endxf)

(setq en (entsel "\n Select entity: "))						;select entity
(setq enname (car en))										;get entity name
(princ (setq endxf (entget enname)))						;get entity dxf properties
(princ)
)

;;;***********************************************************************
;;;***********************************************************************
;;;***********************************************************************
;;;for ARGUMENTS they should be DECLARED IN THE FUNCTION USING THEM.

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
;Get entity DXF CODES for a BLOCK WITH ATTRIBUTES.
(defun SUBBLKNAME ( / en )
(setq en (car (entsel)))									;get ENTITY NAME.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Get entity DXF CODES for ALL FLG_BLK's.
(defun SUBBLKDXF ( / ss1)
(setq ss1 (ssget "X" 
 '((2 . "flg_blk"))
		)
)
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;SETQ variable renamer.
(defun SUBVARNAME (count dxfcodes / en)
(setq en (itoa count))										;(SETQ VARNUM enDXF) unique name for each dxf data.
(set (read (strcat "en" (eval varnum))) dxfcodes)			;renames variable with "en" prefix.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Count the TOTAL NUMBER OF BLOCKS.
(defun SUBBLKCOUNT (ss1 / en sslen count)
(setq sslen (sslength ss1))									;GETS the # OF BLOCKS.
(setq count sslen)											;SETS COUNT for extraction.
	(while (not (= count 0))								;WHILE, until there are NO BLOCKS.
	(setq en (ssname ss1 (setq count (1- count))))			;get BLOCK name.
	)
)
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