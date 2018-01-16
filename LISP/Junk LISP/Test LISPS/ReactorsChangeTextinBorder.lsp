;;;This needs to be loaded into the ACADDOC.LSP or the ACAD.LSP file.

;;;--------------------------------------------------------------
;;;--------------------------------------------------------------
;REACTOR TO TOGGLE A PIECE OF TEXT IN THE TITLE BLOCK FOR REDUNDANT ENTRIES TO KEEP THEM CONSISTENT.

(vlr-mouse-reactor data callbacks)
:vlr-beginDoubleClick

(vl-load-com)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun DoThisDoubleClick ( pt1 / minX minY maxX maxY pt1 pt2 sslen )

(princ)
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(GET DOUBLECLICK PT)
(DEFINE A BOX THAT IT WAS DOUBLE CLICKED IN)
(setq minX 358)
(setq minY 24)
(setq maxX 390)
(setq maxY 37)


	(if (and (> (car pt) minX) (< (car pt) maxX) (> (cadr pt) minY) (< (cadr pt) maxY))
(TOGGLE TEXT IN BOX)
(setq pt1 (list minx miny))
(setq pt2 (list maxx maxy))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun SUBBLKNAME ( / ss1 en)
(setq ss1 (ssget "X" '((2 . "TitleBlock"))))
(setq en (cadar (ssnamex ss1 0)))
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Get entity DXF CODES for ATTRIBUTES WITHIN A BLOCK.
(defun SUBATTDXF (en dxfNO / attdxf cusdxf)

	(while (/= (cdr (assoc 0 attdxf)) "SEQEND")  			;TEST until there are NO MORE ATTRIBUTES.
(setq en (entnext en))										;get NEXT ATTRIBUTE name.
(terpri)
(setq attdxf (entget en))									;get NEXT ATTRIBUTE DXF data.
(setq dxf2 (cdr (assoc 2 attdxf)))							;SAVE DXF code 2.
		(if (= dxf2 "SPEC")											;IF...
		(princ (setq cusdxf (cdr (assoc dxfNO attdxf)))) 			;PRINT SPECIFIC DXF CODE.
		)															;END IF.
	)														;END WHILE.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;MAIN FUNCTION for extracting ATTRIBUTES FROM A BLOCK.
(defun GETBLKATTDXF ( / )
(SUBATTDXF (SUBBLKNAME) 2)
(princ)
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(setq MyReactor1
  (vlr-mouse-reactor
    nil
     '((:vlr-beginDoubleClick . DoThisDoubleClick))
  )
)

(defun Clear_My_Reactors ()
  (if (and MyReactor1
   (vlr-added-p MyReactor1))
    (vlr-remove MyReactor1))
)

(defun Clear_All_Reactors ( / TMP)
  (vlr-remove-all :vlr-mouse-reactor)
)