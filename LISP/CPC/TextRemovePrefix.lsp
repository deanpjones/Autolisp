

;;;Remove a prefix for a piece of TEXT.
;;;Compliments of Dean Jones, July 21, 2006.
;;;Revised Added lines, changed txtstrings to suit, Nov.20, 2009.

(defun C:textremoveprefix (/ en txt txtdxf txtstring txtpos txtstring2)

(while
	(setq en (nentsel "\n Select text to REMOVE PREFIX: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

;Creates a new string and redefines the selected text.

(if (setq txtpos (+ 2 (vl-string-search " " txtstring)))
(progn
(setq txtstring2 (substr txtstring txtpos))
(setq txtstring3 (vl-string-left-trim " " txtstring2)) ;Revised Added line Nov.20, 2009.
(setq txtdxf (subst (cons 1 txtstring3) (assoc 1 txtdxf) txtdxf))
))

	(entmod txtdxf)
	(entupd txt)
)
(princ)
)



