;BillZ Jan 20, 2004 - Autodesk AutoCAD Discussion Forum

(defun myerror (s) ; If an error (such as CTRL-C) occurs
; while this command is active...
(if (/= s "Function cancelled")
(princ (strcat "\nError: " s))
)
(setvar "cmdecho" ocmd) ; Restore saved modes
(setvar "blipmode" oblp)
(setq *error* olderr) ; Restore old *error* handler
(princ)
)

(defun cspiral (ntimes bpoint hfac lppass strad vfac
/ ang dist tp ainc dhinc dvinc circle dv)

(setvar "blipmode" 0) ; turn blipmode off
(setvar "cmdecho" 0) ; turn cmdecho off
(setq circle (* 3.141596235 2))
(setq ainc (/ circle lppass))
(setq dhinc (/ hfac lppass))
(if vfac (setq dvinc (/ vfac lppass)))
(setq ang 0.0)
(if vfac
(setq dist strad dv 0.0)
(setq dist 0.0)
)
(if vfac
(command "_3dpoly") ; start spiral ...
(command "_pline" bpoint) ; start spiral from base point and...
)
(repeat ntimes
(repeat lppass
(setq tp (polar bpoint (setq ang (+ ang ainc))
(setq dist (+ dist dhinc))
)
)
(if vfac
(setq tp (list (car tp) (cadr tp) (+ dv (caddr tp)))
dv (+ dv dvinc)
)
)
(command tp) ; continue to the next point...
)
)
(command "") ; until done.
(princ)
)

;;;
;;; Interactive spiral generation
;;;

(defun C:SPIRAL (/ olderr ocmd oblp nt bp cf lp)
(setq olderr *error*
*error* myerror)
(setq ocmd (getvar "cmdecho"))
(setq oblp (getvar "blipmode"))
(setvar "cmdecho" 0)
(initget 1) ; bp must not be null
(setq bp (getpoint "\nCenter point: "))
(initget 7) ; nt must not be zero, neg, or null
(setq nt (getint "\nNumber of rotations: "))
(initget 3) ; cf must not be zero, or null
(setq cf (getdist "\nGrowth per rotation: "))
(initget 6) ; lp must not be zero or neg
(setq lp (getint "\nPoints per rotation <30>: "))
(cond ((null lp) (setq lp 30)))
(cspiral nt bp cf lp nil nil)
(setvar "cmdecho" ocmd)
(setvar "blipmode" oblp)
(setq *error* olderr) ; Restore old *error* handler
(princ)

)

;;;
;;; Interactive spiral generation
;;;

(defun C:3DSPIRAL (/ olderr ocmd oblp nt bp hg vg sr lp)
(setq olderr *error*
*error* myerror)
(setq ocmd (getvar "cmdecho"))
(setq oblp (getvar "blipmode"))
(setvar "cmdecho" 0)
(initget 1) ; bp must not be null
(setq bp (getpoint "\nCenter point: "))
(initget 7) ; nt must not be zero, neg, or null
(setq nt (getint "\nNumber of rotations: "))
(initget 7) ; sr must not be zero, neg, or null
(setq sr (getdist bp "\nStarting radius: "))
(initget 1) ; cf must not be zero, or null
(setq hg (getdist "\nHorizontal growth per rotation: "))
(initget 3) ; cf must not be zero, or null
(setq vg (getdist "\nVertical growth per rotation: "))
(initget 6) ; lp must not be zero or neg
(setq lp (getint "\nPoints per rotation <30>: "))
(cond ((null lp) (setq lp 30)))
(cspiral nt bp hg lp sr vg)
(setvar "cmdecho" ocmd)
(setvar "blipmode" oblp)
(setq *error* olderr) ; Restore old *error* handler
(princ)

)

;;; --------------------------------------------------------------------------;
