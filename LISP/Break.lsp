;;;Break command macro for selecting line first, then break by one or two points.
;;;Compliments of Dean Jones, May 17, 2007.

(defun C:BREAK_1 (/)

(princ "\nSelect object to break (1pt):")
(command "break" PAUSE "_f" (getpoint "\nPick break point:") "@")
(princ)
)


(defun C:BREAK_2 (/)

(princ "\nSelect object to break (2pts):")
(command "break" PAUSE "_f" (getpoint "\nPick 1st break point:") (getpoint "\nPick 2nd break point:"))
(princ)
)

