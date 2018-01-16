;Dean Jones Feb.05, 2008
;To convert in to mm.
(defun C:CON-IN-MM ( / x1 x2 y1 y2)
(setq x1 (getreal "\nEnter value to be converted (in-mm)(ie. 1-3/16)"))
(setq x2 (rtos x1 2))
(setq y1 (cvunit x1 "in" "mm"))
(setq y2 (rtos y1 2 1))

(prompt (strcat "\nYour value was converted: " x2 "\" to " y2 "mm"))
(princ)
)

;To convert feet-in to mm.
(defun C:CON-FTIN-MM ( / x1 x2 y1 y2)


(princ)
)