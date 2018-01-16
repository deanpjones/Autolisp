;From: Ian Bryant
;Date: Aug/01/06 - 18:34 (MDT)
;Converts the selected field to text.

(defun C:CF ( / ent)
(if (setq ent (car (nentsel "\nPick a field object: ")))
(entdel (cdr (assoc -1
(dictsearch (cdr (assoc 360 (entget ent))) "ACAD_FIELD")
))))
(princ)
(COMMAND "REGEN") ;ADDED TO SEE GRAPHIC, DJ SEP.15, 2011
)

