;Creates a list of a SSGET function to be used for lisp.
(defun bpc:ss->list (ss / i lis)
(repeat (setq i (sslength ss))
(setq i (1- i)
lis (cons (ssname ss i) lis)
)
)
)

;Creates a list of SSGET function to be used for Visual Basic.
(defun bpc:ss->objlist (ss / i lis)
(repeat (setq i (sslength ss))
(setq i (1- i)
lis (cons (vlax-ename->vla-object (ssname ss i)) lis)
)
)
)