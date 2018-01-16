;;;Updates Stamp on drawings by changing the text height to 2.5mm.

(defun C:stmpupd (/ en txt txtdxf txtstring)

	(setq en (nentsel "\n Select titleblock stamp: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 40 txtdxf)))

	(setq txtdxf (subst (cons 40 2.5) (assoc 40 txtdxf) txtdxf))	;Update text to 2.5mm.
	
	(entmod txtdxf)
	(entupd txt)
	
	(command "regen")
	(princ "\n Stamp update complete!")


(princ)
)

;;;**********************************************************************************************

;;;Updates ISO's to smaller text.
(defun C:stmpupd2 (/ en txt txtdxf txtstring)

	(setq en (nentsel "\n Select titleblock stamp: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 40 txtdxf)))

	(setq txtdxf (subst (cons 40 1.2) (assoc 40 txtdxf) txtdxf))	;Update text to 1.2mm.
	
	(entmod txtdxf)
	(entupd txt)
	
	(command "regen")
	(princ "\n Stamp update complete!")


(princ)
)

