;Break vertical line with single pick.
;Courtesy of Dean Jones, Sep.12, 2008.

(defun C:BREAK_3 ( / os dist pt1 pt2 pt3 )

(setq os (getvar "osmode"))
(setvar "osmode" 2048)

(setq dist (getreal "\nSpecify break distance: "))
(setq pt1 (getpoint "\nPick intersection of lines to break (Hold SHIFT for horizontal lines): "))


(setvar "osmode" 0)

;******************************************************
;Condition to be changed with pressing shift.
(if (= T (acet-sys-shift-down))
(progn
(setq pt2 (subst (+ (car pt1) dist) (car pt1) pt1))
(setq pt3 (subst (- (car pt1) dist) (car pt1) pt1))
)
(progn
(setq pt2 (subst (+ (cadr pt1) dist) (cadr pt1) pt1))
(setq pt3 (subst (- (cadr pt1) dist) (cadr pt1) pt1))
)
);END IF.
;******************************************************

;****************************
(command "break" pt2 pt3)
;****************************

(setvar "osmode" os) ;Reset OSMODE.
(princ)
)
