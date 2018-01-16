;;;From AutoCAD 2005 discussion groups.

;;;From: Dean Saadallah 
;;;Date: Feb/02/05
   
;;;Re: Can't select objects
;;;...Sometimes, I get some message about maximum allowable number of
;;;selection sets reached...<<<

;;;This is typically the fault of not localizing variables within lisp
;;;routines. The following will clean up the selection set mess for you.

(defun c:clearss ( / i)
(setq i 0)
(foreach x (atoms-family 0)
(if (= (type (eval x)) 'PICKSET)
(progn
(set x NIL)
(setq i (1+ i))
)
)
)
(princ (strcat "\n" (itoa i) " selection set(s) cleared"))
(princ)
);end
 
