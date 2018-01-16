;;;-------------------C:DIMTORL------------------------------------------------
;;; Purpose: if the last entity in the dwg is a DIMENSION, this will rotate
;;;          the dimension text by PI radians.
;;; Author:  Herman Mayfarth
;;; Date:    24 May 01
;;; Copyright © 2001 Herman Mayfarth
;;; Provided as is and without warranty. Permission granted to freely use
;;; and redistribute without fee provided this notice remains intact.
;;; Quick & dirty, with a simple UNDO statement
;;;----------------------------------------------------------------------------
(defun C:DIMTORL ( / ent oldeko)
  (command "_.UNDO" "BEGIN")
  (setq ent (entget(entlast)))
  (if (= "DIMENSION" (cdr (assoc 0 ent)))
    (entmod(subst (cons 51 (- (cdr (assoc 51 ent)) PI)) (assoc 51 ent) ent))
    (princ "\nLast Entity is Not a DIMENSION. No Action Taken. \n")
  );if
  (setq oldeko (getvar "CMDECHO"))
  (setvar "CMDECHO" 0);suppress CMDECHO so message above is visible
  (command "_.UNDO" "END")
  (setvar "CMDECHO" oldeko);restore old value
(princ)
);C:DIMTORL

;;;-------------------C:DIMTXTOR-------------------------------------------
;;; Purpose: Rotates DIMENSION text for all DIMENSIONS in a selection set
;;;          by PI radians. Correct "upside down" DIMENSION text by selecting
;;;          the desired DIMENSIONs to change.
;;; Author:  Herman Mayfarth
;;; Version: 1.0
;;; Date:    24 May 01
;;; Copyright © 2001 Herman Mayfarth
;;; Provided as is and without warranty. Permission granted to freely use
;;; and redistribute without fee provided this notice remains intact.
;;;------------------------------------------------------------------------
(defun C:DIMTXTOR ( /
;;local symbols
                       ename
                       ent
                       gripset
                       i
                       flag
                       j
                       oldeko
                       olderr
                       ss
;;local functions
++ *lerror*
                  )
;;local error handler
(defun *lerror* (msg)
  (if (member msg '("console break" "Function cancelled"))
      (princ)
      (princ (strcat "\nError " (itoa (getvar "ERRNO")) ": " msg))
  );if
;;restore old error handler
  (setq *error* olderr olderr nil)
  (princ)
);*lerror*
;; ++ Increment counter &a .
;;;call: (++ 'a) <<--note the quote!
(defun ++ (&a)
        (set &a (1+ (eval &a)))
);end of ++
;;support for noun-verb selection
;;save a selection set of any gripped objects
(setq gripset (cadr (ssgetfirst)))
;;start an UNDO group, which cancels grips
(command "._UNDO" "_GROUP")
;;install local *error* function
(setq olderr *error*
      *error* *lerror*)
;;if gripset exists
(if gripset
;;step through gripset and modify any DIMENSION entities found
  (progn
    (setq i 0 j 0 ss (ssadd))
    (while (< i (sslength gripset))
      (setq ename (ssname gripset i))
      (if (= "DIMENSION" (cdr (assoc 0 (setq ent(entget ename)))))
        (progn
        (entmod(subst (cons 51 (- (cdr (assoc 51 ent)) PI)) (assoc 51 ent) ent))
        (++ 'j)
        );progn
      );if
      (++ 'i)
    );while
    (princ (strcat "\nText Rotated on " (itoa j) " DIMENSIONS."))
;;nil ss & set flag to set up for the case of null gripset
    (setq ss nil flag T)
  );progn
;;otherwise prompt user to select DIMENSIONS to change
  (progn
   (prompt "\nSelect Which DIMENSIONS to Rotate Dimension Text 180°: ")
      (setq ss (ssget '((0 . "DIMENSION"))))
  );
);if
;;process all entities in the resulting selection set
(if ss
  (progn
    (setq i 0)
    (while (< i (sslength ss))
      (setq ent (entget (ssname ss i)))
      (entmod(subst (cons 51 (- (cdr (assoc 51 ent)) PI)) (assoc 51 ent) ent))
      (++ 'i)
    );while
    (princ (strcat "\nText Rotated on " (itoa (sslength ss)) " DIMENSIONS."))
  );progn
  (if (null flag) (princ "\nNo DIMENSIONS Selected!"))
);if
;;restore previous error function
(setq *error* olderr)
;;switch off CMDECHO while ending the UNDO group
(setq oldeko (getvar "CMDECHO"))
(setvar "CMDECHO" 0)
(command "._UNDO" "_END")
(setvar "CMDECHO" oldeko);restore old CMDECHO value
(princ);quiet exit
);C:DIMTXTOR


