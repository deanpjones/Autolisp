;;;Snap toggle.
;;;Compliments of Dean Jones, May 17, 2007.
;;;***Note: This is not set for isometric snaps.***

(defun C:SNAPT ( / )

(if
(vl-every '= '(1 1) (mapcar '(lambda (x) (fix x)) (getvar "snapunit")))
(progn (setvar "snapunit" '(5 5)) (princ "\nSnap is set to 5.0"))
(progn (setvar "snapunit" '(1 1)) (princ "\nSnap is set to 1.0"))
)

(princ)
)