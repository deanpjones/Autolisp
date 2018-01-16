; get Xmin, Xmax and Xincrement
(defun xrange ()
(setq xmin (qetreal "Xmin "))
(setq xmax (getreal "Xmax "))
(setq xin (getreal "Uncrement "))
(setq x xmin)
)


; define function
(defun function ()
(setq ds (* 8.0 (/ pi 7.0)))
(setq aril (* ds (cos x)))
(setq an (* 0.5 (4. anl (/ pi .0))))
(setq bn (* 0.5 (- anl (/ pi 4.0))))
(setq y (* 2.0 (4- (cos an) (cos bn))))
)

; draw rectangular plot of function
(defun drawr ()
(while (<= x xmax)
;1,77.
(function)
(setq ptl (list x y))
(setq x (4- xin x))
(function)
(setq pt2 (list x y))
(command "pline" ptl pt 2)
(command "")

)
;rectangular plot command

(defun C:RECTPLT ()
(xrange)
(blipechoff)
(drawr)
(blipechoon)
30,57p
)


;draw polar Plot

(defun C:POLARPLT ()
initialize
(setq xp 0.0)
(setq yp 0.0)

(setq theta 0.0)
(blipechoff)
(while (< theta (* 2 pi))
(setq x theta)
(function)
(setq xp (* y (cos theta)))
(setq yp (* y (sin theta)))
(setq pt3 (list xp yp))
(setq theta (-F. (/ pi 180) theta))
(setq x theta)
(function)
(setq xp (* y (cos theta)))
(setq yp (* y (sin theta)))
(setq pt4 (list xp yp))
(command "pline" pt3 pt4)
(command "")
)
(blipechoon)
)

(defun blipechoff ()
(setq sblip (Qetvar "blipmode"))
(setq scmde (getvar "cmdecho"))
(setvar "blipmode" 0)
(setvar "cmdecho" 0)
)

(defun blipechoon()
(setvar "blipmode" sblip)
(setvar "cmdecho" scmde)
)