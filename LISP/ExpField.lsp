;Explodes a field without selection.
;Based on the block being inserted at the right coordinate.
;Dean Jones Jun. 09, 2008

(defun C:ExpField ( / pt1 ss1 en att)

(setq pt1 '(815 65))
(setq ss1 (ssget pt1))
(setq en (ssname ss1 0))
(setq att (entnext en))

(entdel (cdr (assoc -1 (dictsearch (cdr (assoc 360 (entget att))) "ACAD_FIELD"))))

(princ)
)
