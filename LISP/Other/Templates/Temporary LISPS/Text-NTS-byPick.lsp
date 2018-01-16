;;;Adds a NTS>
;Dean Jones, Aug 16, 2006

(defun C:tt (/ en txt txtdxf a b txtstring )

	(setq en (nentsel "\n Select text entity: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

;;;Search string for %%u or %%U.

(setq a (getvar "dwgname"))
(setq b (vl-string-right-trim ".dwg" a))
(setq txtstring (vl-string-subst "/" " - " b ))

(setq txtdxf (subst (cons 1 txtstring) (assoc 1 txtdxf) txtdxf))	


	(entmod txtdxf)
	(entupd txt)

(princ)
)

