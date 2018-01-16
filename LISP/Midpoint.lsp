

(defun C:MID2POINTS (/ A B)
	(setq A (getpoint "\n1st Point: ")
              B (getpoint A "\n2nd Point: "))
        (mapcar '(lambda (C D) (/ (+ C D) 2)) A B)
)


