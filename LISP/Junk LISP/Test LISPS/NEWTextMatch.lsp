


;;;Fix to add for ( 0 . "DIMENSION")

;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;Fix for lisp routine for use with ATTDEF that aren't blocked, the DXF code is different for the visible attribute.
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;;;Matches TEXT string by selection.
;;;Compliments of Dean Jones, Apr. 07, 2005. 
;;;Re-done to work with attributes and now with a filter for text objects, by Dean Jones, Oct.14, 2005.

(defun C:tmm (/ en txt txtdxf typ dim num a txtstring typ2 txt2 txtdxf2 txtstring2)

(setq en (nentsel "\n Select text entity: "))(setq txt (car en))(setq txtdxf (entget txt))(setq typ (cdr (assoc 0 txtdxf)))(setq dim (cdr (assoc 8 txtdxf)))

	(defun ENSELECT (/)
(setq en (nentsel "\n Select text entity: "))				;select entity
(setq txt (car en))											;get entity name
(setq txtdxf (entget txt))									;get entity dxf properties
(setq typ (cdr (assoc 0 txtdxf)))							;get entity TYPE
(setq dim (cdr (assoc 8 txtdxf)))							;get entity TYPE

	(if (= "DIMENSION" dim)
(progn														;if it's a DIMENSION get entity name
(setq txt (car (cadddr en)))
(setq txtdxf (entget txt))
)
															;else return NIL											
	)

(setq num 
	(cond 
((= "TEXT" typ) 1)
((= "MTEXT" typ) 1)
((= "ATTRIB" typ) 1)
((= "ATTDEF" typ) 2)
((= "DIMENSION" dim) 1)
(T nil)
	)
)
	)
	

;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------






	
(if
(and txt (or (= "TEXT" typ) (= "ATTDEF" typ) (= "ATTRIB" typ) (= "MTEXT" typ) (= "DIMENSION" typ)))		;test statement to see if it's got TEXT in it.

(progn													;if there is TEXT then continue.
(setq txtstring (cdr (assoc num txtdxf)))				;get TEXT STRING dxf property

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

