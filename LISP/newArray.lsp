
(setq ss (ssget :S))
(setq sslen (sslength ss))

(defun C:ARR ( / n en1 cenPt ss)
(setq n (getint "Number to array? "))
(setq en1 (entsel "Pick base circle: "))
(setq cenPt (cdr (assoc 10 (entget (car en1)))))
(setq ss (ssget :S))
(command "-ARRAY" "p" "" "p" cenPt n "360" "y")
);END DEFUN.

-ARRAY
Select objects: 1 found

Select objects:  Enter the type of array [Rectangular/Polar] <P>: P

Specify center point of array or [Base]:
Enter the number of items in the array: 5
Specify the angle to fill (+=ccw, -=cw) <360>:

Rotate arrayed objects? [Yes/No] <Y>: