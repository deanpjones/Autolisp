
;;;Remove a suffix for a piece of TEXT.
;;;Compliments of Dean Jones, July 24, 2006.
;;;Revised Added lines, changed txtstrings to suit, Nov.20, 2009.

(defun C:tqq (/ en txt txtdxf txtstring txtstringReverse txtpos txtstring2)

(while
	(setq en (nentsel "\n Select text to REMOVE SUFFIX: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

;Creates a new string and redefines the selected text.
(setq txtstringReverse (vl-list->string (reverse (vl-string->list txtstring))))						;Reverses STRING.

(setq txtpos (+ 2 (vl-string-search " " txtstringReverse)))
(setq txtstring2 (vl-list->string (reverse (vl-string->list (substr txtstringReverse txtpos)))))	;Removes first word and reverse's string back.
(setq txtstring3 (vl-string-right-trim " " txtstring2)) ;Revised Added line Nov.20, 2009.
(setq txtdxf (subst (cons 1 txtstring3) (assoc 1 txtdxf) txtdxf))


	(entmod txtdxf)
	(entupd txt)
)
(princ)
)
