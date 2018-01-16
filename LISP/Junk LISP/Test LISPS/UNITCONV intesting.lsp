

(defun C:UNITCONV ( / inp1 inp2       var1 myPTS myIN myIN-FRAC )

(setq var1 (getvar "dimzin"))
(setvar "dimzin" 8)

(initget 1 "A B C")
(setq inp1 (getkword "Pick the starting units (A)mm (B)inches (C)ft-in :"))

;Cannot repeat the initget function for "D E F"????????
(initget 1 "D E F")
(setq inp2 (getkword "Pick the unit conversion (D)mm (E)inches (F)ft-in :"))




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


