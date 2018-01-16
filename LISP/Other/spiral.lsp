;;; --------------------------------------------------------------------------;
;;; SPIRAL.LSP
;;;   (C) Copyright 1988-1992 by Autodesk, Inc.
;;;  
;;;   This program is copyrighted by Autodesk, Inc. and is  licensed
;;;   to you under the following conditions.  You may not distribute
;;;   or  publish the source code of this program in any form.   You
;;;   may  incorporate this code in object form in derivative  works
;;;   provided  such  derivative  works  are  (i.) are  designed and
;;;   intended  to  work  solely  with  Autodesk, Inc. products, and
;;;   (ii.)  contain  Autodesk's  copyright  notice  "(C)  Copyright
;;;   1988-1992 by Autodesk, Inc."
;;;
;;;   AUTODESK  PROVIDES THIS PROGRAM "AS IS" AND WITH  ALL  FAULTS.
;;;   AUTODESK  SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF  MER-
;;;   CHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK,  INC.
;;;   DOES  NOT  WARRANT THAT THE OPERATION OF THE PROGRAM  WILL  BE
;;;   UNINTERRUPTED OR ERROR FREE.
;;;
;;; --------------------------------------------------------------------------;
;;; DESCRIPTION
;;;
;;;   This is a programming example.
;;;
;;;   Designed and implemented by Kelvin R. Throop in January 1985
;;;
;;;   This program constructs a spiral. It can be loaded and called 
;;;   by typing either "spiral" or the following:
;;;   (cspiral <# rotations> <base point> <growth per rotation>
;;;            <points per circle>).
;;;
;;; --------------------------------------------------------------------------;

(defun myerror (s)                    ; If an error (such as CTRL-C) occurs
                                      ; while this command is active...
  (if (/= s "Function cancelled")
    (princ (strcat "\nError: " s))
  )
  (setvar "cmdecho" ocmd)             ; Restore saved modes
  (setvar "blipmode" oblp)
  (setq *error* olderr)               ; Restore old *error* handler
  (princ)
)


(defun cspiral (ntimes bpoint cfac lppass / ang dist tp ainc dinc circle) 
  (setvar "blipmode" 0)               ; turn blipmode off
  (setvar "cmdecho" 0)                ; turn cmdecho off
  (setq circle (* 3.141596235 2))
  (setq ainc (/ circle lppass))
  (setq dinc (/ cfac lppass))
  (setq ang 0.0)
  (setq dist 0.0)
  (command "_pline" bpoint)            ; start spiral from base point and...
  (repeat ntimes 
    (repeat lppass 
      (setq tp (polar bpoint (setq ang (+ ang ainc))
                      (setq dist (+ dist dinc))
               ))
      (command tp)                    ; continue to the next point...
    )
  ) 
  (command "")                        ; until done.
  (princ)
) 

;;;
;;;       Interactive spiral generation
;;;

(defun C:SPIRAL (/ olderr ocmd oblp nt bp cf lp) 
  (setq olderr  *error*
        *error* myerror)
  (setq ocmd (getvar "cmdecho"))
  (setq oblp (getvar "blipmode"))
  (setvar "cmdecho" 0)
  (initget 1)                         ; bp must not be null
  (setq bp (getpoint "\nCenter point: "))
  (initget 7)                         ; nt must not be zero, neg, or null
  (setq nt (getint "\nNumber of rotations: "))
  (initget 3)                         ; cf must not be zero, or null
  (setq cf (getdist "\nGrowth per rotation: "))
  (initget 6)                         ; lp must not be zero or neg
  (setq lp (getint "\nPoints per rotation <30>: "))
  (cond ((null lp) (setq lp 30))) 
  (cspiral nt bp cf lp)
  (setvar "cmdecho" ocmd)
  (setvar "blipmode" oblp)
  (setq *error* olderr)               ; Restore old *error* handler
  (princ)

) 

;;; --------------------------------------------------------------------------;


