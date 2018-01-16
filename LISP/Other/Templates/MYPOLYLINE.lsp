;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;Arguments (opt 1 or 2, 1-by select, 2-blkname "rev-blk" (nil or name required)
;Returns the entity name.
(defun MYPOLYLINE ( / )

(setq en (ssname (setq ss (ssget ":S:E" (list (cons 0 "POLYLINE")))) 0))

);END DEFUN.

;(mypolyline)

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
(defun MYPOLYLINEVERTICES-TEST (myblk / test)
(setq endxf (entget en))
	(if (= (cdr (assoc 66 endxf)) 1)
	(progn
;---------------------------------------------------------
;Prints all points...
(while (/= (cdr (assoc 0 endxf)) "SEQEND")
(setq en (entnext en))(setq endxf (entget en))

;****************************************************************************

(print (cdr (assoc 10 endxf)))

;****************************************************************************

);END WHILE.
;---------------------------------------------------------
	);END PROGN.
	);END IF.
(princ)
);END DEFUN.

;(mypolylinevertices-test (mypolyline))
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX