

;IS-PLINE?
	;Filter ss for each.

;GET INTERSECTION OF LINES.
;IS-LINE?

;IS-VER?
;BREAK LINE!
	;Need lines intersection

(setq myPt (getpoint "Select the intersection of lines to break:  "))
(setq mySS (ssget ":S:E" myPt))
;***************************************************************
;Explode polylines to lines.
(defun EXP-PL (/)

(cond
((= linTyp "LWPOLYLINE") (command "explode" lin))
((= linTyp "POLYLINE") (command "explode" lin))
(T (setq a T))
(nil T)
);END COND.

);END DEFUN.
;***************************************************************
(defun GET-SS (/)
(setq ss (ssget ":S:E"))

(if (= 2 (sslength ss))

(repeat (sslength ss)
(IS-LINE 0)
(EXP-PL)
(IS-LINE 1)
(EXP-PL)
);END REPEAT.

(princ "\nThere are not two lines to break.")
);END IF.

);END DEFUN.
;***************************************************************
;IS-LINE?
(defun IS-LINE ( n /)
;(setq ss nil ss1 nil a nil)
;(if (/= T
;(setq ss (ssget ":S:E" (list (cons 0 "LINE"))))
;);END IF TEST.!

(progn
(setq sslen (sslength ss))
(setq lin (ssname ss n))
(setq linDXF (entget lin))
(setq linTyp (cdr (assoc 0 linDXF)))
(setq linPt1 (cdr (assoc 10 linDXF)))
(setq linPt2 (cdr (assoc 11 linDXF)))
);END PROGN.
;(princ "\nThis is not a line.  Aborting break line routine.")
;);END IF.

);END DEFUN.
;***************************************************************
;Get new ss with "LINE" ONLY.
(defun GET-NEW-SS ( n /)
(setq ss nil)
(setq ss (ssget "P" (list (cons 0 "LINE"))))

);END DEFUN.
;***************************************************************
;GET INTERSECTION OF LINES.
(defun GET-INTERS (/)

(if (= 2 sslen)
(progn
(IS-LINE 0)
(setq l1 linPt1 l2 linPt2)
(IS-LINE 1)
(setq l3 linPt1 l4 linPt2)
);END PROGN.
);END IF.

(setq linIntersection (inters l1 l2 l3 l4))

);END DEFUN.
;***************************************************************
;IS-VER?
(defun IS-VER (/)

(cond
((= (car linPt1) (car linPt2)) (setq linOrient "Vertical Line"))
((= (cadr linPt1) (cadr linPt2)) (setq linOrient "Horizontal Line"))
(T nil)
);END COND.

);END DEFUN.
;***************************************************************
;BREAK LINE!
(defun BREAK-LINE (/)

;(setq breakPt1 (IS-LINE 0)

(if (= linOrient "Verical")
;(command "break_2" (how do I select this line?)
);END IF.

);END DEFUN.
;***************************************************************
