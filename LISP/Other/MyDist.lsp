 
;Distance command to give units in millimeters, decimal inches and fractional inches.
;Created Jun 29, 2007, compliments of Dean Jones.

(defun C:MYDIST ( / var1 myPTS myIN myIN-FRAC )

(setq var1 (getvar "dimzin"))
(setvar "dimzin" 8)

;Get distance in millimeters.
(setq myPTS (getdist "Pick distance between points:"))
(princ (strcat "\n" "The distance (default units) is:    (" (rtos myPTS 2 8) "mm)"))


;Convert millimeters to decimal inches.
(setq myIN (cvunit myPTS "mm" "in"))
(princ (strcat "   " (rtos myIN 2 8) "\""))

;Convert millimeters to fractional inches.
(setq myIN-FRAC (cvunit myPTS "mm" "in"))
(princ (strcat "   " (rtos myIN-FRAC 4 8)))

(setvar "dimzin" var1)

(princ)
)