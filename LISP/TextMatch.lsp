;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;Fix for lisp routine for use with ATTDEF that aren't blocked, the DXF code is different for the visible attribute.
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;;;Matches TEXT string by selection.
;;;Compliments of Dean Jones, Apr. 07, 2005. 
;;;Re-done to work with attributes and now with a filter for text objects, by Dean Jones, Oct.14, 2005.

(defun C:tm (/ en typ txt txtdxf txtstring typ2 txt2 txtdxf2 txtstring2)

(setq en (nentsel "\n Select text entity: "))				;select entity
(setq txt (car en))											;get entity name
(setq txtdxf (entget txt))									;get entity dxf properties
(setq typ (cdr (assoc 0 txtdxf)))							;get entity TYPE

(if
(and txt (or (= "TEXT" typ) (= "ATTDEF" typ) (= "ATTRIB" typ) (= "MTEXT" typ)))		;test statement to see if it's got TEXT in it.

(progn													;if there is TEXT then continue.
(setq txtstring (cdr (assoc 1 txtdxf)))					;get TEXT STRING dxf property

;;;**************************************************************************************************************
;;;Second Text pick**********************************************************************************************
;;;**************************************************************************************************************

			(while
	(setq txt2 (car (nentsel "\n Select text to match: ")))			;*select entity, and get name
	(setq txtdxf2 (entget txt2))									;get entity dxf properties
	(setq typ2 (cdr (assoc 0 txtdxf2)))								;get entity TYPE

	(if
	(and txt2 (or (= "TEXT" typ) (= "ATTDEF" typ) (= "ATTRIB" typ) (= "MTEXT" typ)))	;test statement to see if it's got TEXT in it.

		(progn												;if there is TEXT then continue.
	(setq txtstring2 (cdr (assoc 1 txtdxf2)))				;get TEXT STRING dxf property

	(setq txtdxf2 (subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2))	;**match TXT1 with TXT2 property

	(entmod txtdxf2)							;updates ENTITY dxf data
	(entupd txt2)								;updates SCREEN of update
		)

		(progn									;else, print statement.
	(princ "\n*** I CAN'T PICK UP WHAT YOU ARE PUTTING DOWN! ***")
		)
	)
			)

;;;**************************************************************************************************************
;;;**************************************************************************************************************
;;;**************************************************************************************************************

)

(progn											;else, print statement.
(princ "\n*** I CAN'T PICK UP WHAT YOU ARE PUTTING DOWN! ***")
)
)

(princ)
)

