;;;Increment a number for a string by +1.
;;;Dean Jones, July 25, 2006.

(defun C:textnumberincrement (/ en txt txtdxf txtstring txtstringN)

(while
	(setq en (nentsel "\n Select text number to increment up 1+: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq typ (cdr (assoc 0 txtdxf)))									;get entity TYPE
	(setq txtstring (cdr (assoc 1 txtdxf)))


;;;Figure out how to increment up or down using SHIFT????

;Need to isolate number in string, need to search for it properly, then change the number and put the string back together.
;(if (wcmatch (eval txtstring) "*#*,*##*,*###*,*####*,*#####*,*######*,*#######*,*########*")

(if (wcmatch (eval txtstring) "#,##,###,####,#####,######,#######,########")
	(progn
(setq txtstringN (itoa (1+ (atoi txtstring))))
(setq txtdxf (subst (cons 1 txtstringN) (assoc 1 txtdxf) txtdxf))
(entmod txtdxf)
(entupd txt)
	)
(princ "\nThis is NOT A NUMBER.")
)

)

(princ)
)

