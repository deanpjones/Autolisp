
;;;Remove a suffix character for a piece of TEXT.
;;;Compliments of Dean Jones, Nov.25, 2008.


(defun C:trr (/ en txt txtdxf txtstring txtstringReverse txtstringChop txtstringNew)

(while
	(setq en (nentsel "\n Select text to REMOVE SUFFIX CHARACTER: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

;???????????????????????????????
(setq txtstringReverse (vl-list->string (reverse (vl-string->list txtstring))))						;Reverses STRING.
(setq txtstringReverse (vl-string-left-trim " " txtstringReverse))

(if (> (strlen txtstringReverse) 1) 																;If more than one character.										;Removes first (last) character.
(setq txtstringChop (substr txtstringReverse 2))
(princ "\nYou cannot chop the text any further.")
)

(setq txtstringNew (vl-list->string (reverse (vl-string->list txtstringChop))))						;Reverses STRING back.
;???????????????????????????????

(setq txtdxf (subst (cons 1 txtstringNew) (assoc 1 txtdxf) txtdxf))


	(entmod txtdxf)
	(entupd txt)
)
(princ)
)
