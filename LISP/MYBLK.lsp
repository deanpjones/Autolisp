
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;Arguments (opt 1 or 2, 1-by select, 2-blkname "rev-blk" (nil or name required)
;Returns the entity name.
(defun MYBLK (opt blkname / )
	(cond
((= 1 opt)(setq en (ssname (setq ss (ssget ":S" (list (cons 0 "INSERT")))) 0)))
((= 2 opt)(setq en (ssname (setq ss (ssget "X" (list (cons 0 "INSERT")(cons 2 blkname)))) 0)))
(T nil)
	);END COND.
);END DEFUN.

;(myblk 2 "CPC_A1TBLK")
;(entget (myblk 2 "CPC_A1TBLK"))
;(assoc 1 (entget (myblk 2 "CPC_A1TBLK")))
;(cdr (assoc 2 (entget (myblk 1 nil)))) ;To get the block name.
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;Modifies the selected attribute with the value given.
(defun MYATTRIB (myblk myatt myattvalue / test)
(setq endxf (entget en))
	(if (= (cdr (assoc 66 endxf)) 1)
	(progn
;---------------------------------------------------------
;Ends while on condition.
(setq test nil)
(while (and (/= (cdr (assoc 0 endxf)) "SEQEND")(not test))
(setq en (entnext en))(setq endxf (entget en))
(cond
;****************************************************************************
;(mytest (progn mycond (setq test T)))
((= (cdr (assoc 2 endxf)) myatt)
(progn
(entmod (subst (cons 1 myattvalue) (assoc 1 endxf) endxf))
(setq test T)
(setq en nil endxf nil)
);END PROGN.
)
;****************************************************************************
);END COND.
);END WHILE.
;---------------------------------------------------------
	);END PROGN.
	);END IF.
);END DEFUN.

;(myattrib (myblk 2 "CPC_A1TBLK") "CPC_DWG_#" "XXX-XXX-XXX-XXX-XXXX")
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
(defun MYATTRIB-TEST (myblk myatt / test)
(setq endxf (entget en))
	(if (= (cdr (assoc 66 endxf)) 1)
	(progn
;---------------------------------------------------------
;Ends while on condition.
(setq test nil)
(while (and (/= (cdr (assoc 0 endxf)) "SEQEND")(not test))
(setq en (entnext en))(setq endxf (entget en))
(cond
;****************************************************************************
;(mytest (progn mycond (setq test T)))
((= (cdr (assoc 2 endxf)) myatt)
(progn

;(print (cdr (assoc 1 endxf)))
;Use myVALUE as global to extract value as STRING.
(setq myVALUE (cdr (assoc 1 endxf)))

(setq test T)
(setq en nil endxf nil)
);END PROGN.
)
;****************************************************************************
);END COND.
);END WHILE.
;---------------------------------------------------------
	);END PROGN.
	);END IF.
(princ)
);END DEFUN.

;(myattrib-test (myblk 2 "CPC_A1TBLK") "CPC_DWG_#") !myVALUE
;MAKE SURE TO TEST !myVALUE
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX