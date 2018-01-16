;;;Adds UNDERLINE prefix "%%u" to any text string by selection.

(defun C:tu (/ en txt txtdxf txtstring)

(while
	(setq en (nentsel "\n Select text entity: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

;;;Search string for %%u or %%U.

	(if (= NIL (or (vl-string-search "%%u" txtstring) (vl-string-search "%%U" txtstring)))
		(setq txtdxf (subst (cons 1 (strcat "%%u" txtstring)) (assoc 1 txtdxf) txtdxf))
		(setq txtdxf (subst (cons 1 (substr txtstring 4)) (assoc 1 txtdxf) txtdxf))	
	)

	(entmod txtdxf)
	(entupd txt)
)

(princ)
)

