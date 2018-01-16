;;;Text Routine BY PICK
;;;Dean Jones, Aug 17, 2006

;*****************************************************************
(defun TXTSTRINGFUNCTION ( arg1 / en txt txtdxf txtstring )

	(setq en (nentsel "\n Select text entity: "))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

;;;Needs a FUNCTION that returns a TEXT STRING.

(setq txtstring arg1 )

(setq txtdxf (subst (cons 1 txtstring) (assoc 1 txtdxf) txtdxf))	

	(entmod txtdxf)
	(entupd txt)

(princ)
)

;*****************************************************************


;EXAMPLE FUNCTION.
(defun HAH ( / a b )
(setq a (getvar "dwgname"))
(setq b (vl-string-right-trim ".dwg" a))
(vl-string-subst "/" " - " b )
)

;TO EXECUTE TWO FUNCTIONS TOGETHER.
(defun C:ABC ( / )
(TXTSTRINGFUNCTION (HAH))
)