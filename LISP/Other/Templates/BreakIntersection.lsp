;If a "LINE" then easy, else if a "POLYLINE"...????

(setq myPickBox (getvar "pickbox"))
(setvar "pickbox" 10)

;***************************************************************
(setq ss nil ss1 nil a nil)
(setq ss (ssget ":S:E"))
(setq sslen (sslength ss))

;Treat routine each as if it was one line at a time.
(setq lin (ssname ss 0))
(setq linDXF (entget lin))
(setq linTyp (cdr (assoc 0 linDXF)))

;Explode polylines to lines.
(cond
((= linTyp "LWPOLYLINE") (command "explode" lin))
((= linTyp "POLYLINE") (command "explode" lin))
(T (setq a T))
(nil T)
)

;Gets new selection of exploded line.
(if (/= a T)
	(progn
(setq ss1 (ssget "L"))
(setq sslen (sslength ss1))
(setq lin (ssname ss1 0))
(setq linDXF (entget lin))
(setq linTyp (cdr (assoc 0 linDXF)))
	);end progn.
T
)

(setq linPt1 (cdr (assoc 10 linDXF)))
(setq linPt2 (cdr (assoc 11 linDXF)))

;***************************************************************




(setq linList1 (list lin1pt1 lin1pt2))
(setq linList2 (list lin2pt1 lin2pt2))
(setq linsIntersection (inters lin1pt1 lin1pt2 lin2pt1 lin2pt2))

;yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
;For breaking a vertical line.
(setq yCoord (cadr linsIntersection))
(setq xCoord (car linsIntersection))
(setq brkPt1 (subst (+ yCoord 2) yCoord linsIntersection))
(setq brkPt2 (subst (- yCoord 2) yCoord linsIntersection))
;????????????????????????????????????????????????????????????
;Which is vertical line?
;(if linX x's are same and y's are different it's vertical)
;(if linX y's are same and x's are different it's horizontal)
(equal (car lin1pt1) (car lin1pt2)) ;X-value
(equal (cadr lin1pt1) (cadr lin1pt2)) ;Y-value

;(ssget "P" '((0 . "LINE") (-4 . "=,*,*")))
;(ssget "P" '((0 . "LINE") (-4 . "*,=,*")))
;(foreach n (and (= (car n)(car n)) (/= (cadr n)(cadr n))) linList1) ;then vertical line.
;(vl-remove-if-not '(lambda (i) (member i lin1pt1)) lin1pt2)
;????????????????????????????????????????????????????????????
(command "break"
;yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy




;(setq myOsmode (getvar "osmode"))
;(setvar "osmode" 32)
(setq ss nil ss1 nil)
