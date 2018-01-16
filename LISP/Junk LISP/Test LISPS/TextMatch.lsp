;;;Matches TEXT string by selection.

(defun C:tmm (/ ss1 ss2 en txt txtdxf txtstring txt2 txtdxf2 txtstring2)

(setq ss1 (ssget '((-4 . "<or") (0 . "TEXT,MTEXT,DIMENSION") (-4 . "or>"))))

(cond (or
	;;;CONDITION 1
	((if (/= (sslength ss1) 1)
	(princ "\nPlease try again.")
	)
	;;;CONDITION 2
	((if (= (sslength ss1) 1)
	(setq en (entsel "\n Select text entity: "))				;select entity
	(setq txt (car en))							;get entity name
	(setq txtdxf (entget txt))						;get entity dxf properties
	(setq txtstring (cdr (assoc 1 txtdxf)))					;get TEXT STRING dxf property
	)
)




(setq ss2 (ssget '((-4 . "<or") (0 . "TEXT,MTEXT,DIMENSION") (-4 . "or>"))))

(while
	(setq txt2 (car (entsel "\n Select text to match: ")))			;*select entity, and get name
	(setq txtdxf2 (entget txt2))						;get entity dxf properties
	(setq txtstring2 (cdr (assoc 1 txtdxf2)))				;get TEXT STRING dxf property

	(setq txtdxf2 (subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2))	;**match TXT1 with TXT2 property

	(entmod txtdxf2)							;updates ENTITY dxf data
	(entupd txt2)								;updates SCREEN of update
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	(setq en (entsel "\n Select text entity: "))				;select entity
	(setq txt (car en))							;get entity name
	(setq txtdxf (entget txt))						;get entity dxf properties
	(setq txtstring (cdr (assoc 1 txtdxf)))					;get TEXT STRING dxf property

(setq ss2
(ssget '((-4 . "<or")
	(0 . "TEXT,MTEXT,ATTDEF,ARCALIGNEDTEXT,DIMENSION")
	(-4 . "<and") (0 . "INSERT") (66 . 1) (-4 . "and>")
	(-4 . "or>")
	)
)
)

(while
	(setq txt2 (car (entsel "\n Select text to match: ")))			;*select entity, and get name
	(setq txtdxf2 (entget txt2))						;get entity dxf properties
	(setq txtstring2 (cdr (assoc 1 txtdxf2)))				;get TEXT STRING dxf property

	(setq txtdxf2 (subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2))	;**match TXT1 with TXT2 property

	(entmod txtdxf2)							;updates ENTITY dxf data
	(entupd txt2)								;updates SCREEN of update
)

(princ)
)

