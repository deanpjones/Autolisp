;Explodes a field without selection.
;Based on the block being inserted at the right coordinate.
;Dean Jones Jun. 09, 2008

(defun C:RevUpISO ( / pt1 ss1 en att)

(setq pt1 '(8.2747 16.1327))
(setq ss1 (ssget ":N"))
(command "8.2747,16.1327")
(setq en (ssname ss1 0))
(setq att (entnext en))

(entdel (cdr (assoc -1 (dictsearch (cdr (assoc 360 (entget att))) "ACAD_FIELD"))))

(princ)
)


(setq en (nentsel))
8.2747,16.1327
(setq endxf (entget (car en)))
(setq txtstring (cdr (assoc 1 endxf)))
(setq endxf (subst (cons 1 "1") (assoc 1 endxf) endxf))
(entmod endxf)
regen
(setq en (nentsel))
18.6383,16.1327
(setq endxf (entget (car en)))
(setq txtstring (cdr (assoc 1 endxf)))
(setq endxf (subst (cons 1 "DJ") (assoc 1 endxf) endxf))
(entmod endxf)
(entupd en)
regen
(setq en (nentsel))
32.9993,16.1327
(setq endxf (entget (car en)))
(setq txtstring (cdr (assoc 1 endxf)))
(setq endxf (subst (cons 1 "08.03.28") (assoc 1 endxf) endxf))
(entmod endxf)
(entupd en)
regen
(setq en (nentsel))
48.4974,16.1327
(setq endxf (entget (car en)))
(setq txtstring (cdr (assoc 1 endxf)))
(setq endxf (subst (cons 1 "ADDED CPC DRAWING NUMBER") (assoc 1 endxf) endxf))
(entmod endxf)
(entupd en)
regen
