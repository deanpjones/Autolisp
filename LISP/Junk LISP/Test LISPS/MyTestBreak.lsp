
;(command "line" cancel)


(setq pt1 (getpoint "\nPick 1st point of line: "))
(setq pt2 (getpoint "\nPick 2nd point of line: "))

(setq pt_list (vl-list* pt1 (list pt2)))


(setq ss1 nil ss1 (ssget "F" pt_list '((0 . "LINE"))))

	;--------------------------------------------------------------------
	(setq i 0)
	(repeat (sslength ss1)

  (setq lin (ssname ss1 i))                             ;LINE ENTITY NAME.
  (setq lindxf (entget lin))                            ;LINE DXF CODES.
  (setq pt3 (cdr (assoc 10 lindxf)))                    ;GET 10 CODE (PT3)
  (setq pt4 (cdr (assoc 11 lindxf)))                    ;GET 11 CODE (PT4)


(setq myinter (inters pt1 pt2 pt3 pt4))                 ;to get the intersection (WILL NEED TO LOOP)

;Need to verify if pt1 and pt2 are vertical or horizontal, and drawn top to bottom...
;(vl-sort-i '("a" "d" "f" "c") '>)
(cond
(= (car pt1) (car pt2)) 		;if T then VERTICAL LINE.
(= (cadr pt1) (cadr pt2)) 		;if T then HORIZONTAL LINE.
(T nil)
)
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;IF layer does not exist...
(command "layer" "make" "Utility" "color" "yellow" "" "ltype" "continuous" "" "lweight" "default" "" "")
;Get new points first before making lines.
(setq pt5x (1- (1- (car myinter))))
(append (cadr myinter) (caddr myinter))
(append 10 pt5x '(cadr myinter) '(caddr myinter))

(subst pt5x (nth 0 myinter) myinter)
;(subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2)

(setq pt6 (1+ (1+ (car myinter))))

;Draw lines...
(entmake '((0 . "LINE")(8 . "Utility")  )
(command "line" pt1 (- myinter 2)

;--------------------------------------------------------------------
;--------------------------------------------------------------------
(setq d (assoc 40 e))
	(setq e1 (subst '(40 . 50.0) d e))
	(entmod e1)
;--------------------------------------------------------------------
;--------------------------------------------------------------------
_$ (setq pt1 (vlax-make-safearray vlax-vbDouble '(1 . 3)))
#<safearray...>
(vlax-safearray->list pt1)

_$ (vlax-safearray-put-element pt1 1 100)
100

_$ (vlax-safearray-put-element pt1 2 100)
100

_$ (vlax-safearray-put-element pt1 3 75)
75

_$ (vlax-safearray->list pt1)
(100.0 100.0 75.0)

_$ (vlax-safearray-put-element pt1 1 50)
50

_$ (vlax-safearray->list pt1)
(50.0 100.0 75.0)
;--------------------------------------------------------------------
;--------------------------------------------------------------------