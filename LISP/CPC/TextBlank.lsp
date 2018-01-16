
;;;Blanks the contents of a piece of TEXT.
;;;Compliments of Dean Jones, July 24, 2006.


(defun C:textblank (/ en txt txtdxf typ txtstring txtpos txtstring2)

(while
	(setq en (nentsel "\n Select text to BLANK: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq typ (cdr (assoc 0 txtdxf)))									;get entity TYPE
	(setq txtstring (cdr (assoc 1 txtdxf)))
	
(if
(and (= "ATTRIB" typ))												;test statement to see if it's an ATTRIBUTE.
(progn
	(setq txtdxf (subst (cons 1 "") (assoc 1 txtdxf) txtdxf))
	(entmod txtdxf)
	(entupd txt)
)
(princ "\n***** This is NOT AN ATTRIBUTE. *****")
)
)
(princ)
)
