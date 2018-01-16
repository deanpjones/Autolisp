;;;Creates MTO leader for a MTO balloon.

(defun C:mtoldr (/ en txt txtdxf txtstring)

	(setq en (entsel "\n Select text entity: "))
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

(princ)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^C^C_lyrcurMTO-BAL;line;ins \\;lengthen;de;-2.5;

(defun C:mtoldr (/ pt1 entdxf pt2)


;;;Sets layer to MTO-BAL.  
(if (= clayer MTO-BAL)
	(command "-layer" "m" "MTO-BAL" "c" "1" "" "")
	(setvar "clayer" "MTO-BAL")
)


;;;Gets point1 for leader.
(setq pt1 (getpoint "Pick start of leader:"))

;;;(IF OBJECT IS ON DEFPOINTS LAYER RETURN 'T' IF NOT RETRY)
;;;(CAN ONLY BE ONE OBJECT OR RETRY)
(setq pt1 (getpoint "Select start of leader:")
(setq pt2 (getcorner pt1 "Pick second point for leader start:")
(ssget "_:S" PT '((8 . "Defpoints")))
(ssget "_C" PTLIST '((8 . "Defpoints"))) 
(ssget "_W" PTLIST '((8 . "Defpoints"))) 


;;;Gets point2 for leader.
(setq entdxf (entget (car (entsel "\n Select MTO Balloon: "))))
(setq pt2 (cdr (assoc 10 entdxf)))


;;;Draws leader line.
(command "line" "ins")


(princ)
)

