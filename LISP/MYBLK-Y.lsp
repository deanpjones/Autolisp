;Modifies or tests an attribute at a specific location.
;Good to use when attributes have the same name.
;Dean Jones, Oct.08, 2008

*******************************************************************************
;NOTE, Y-COORDINATE MUST BE EXACT VALUE IN 'POSITION-Y', NOT 'TEXT ALIGNMENT Y'
*******************************************************************************



;(myblk 2 "CPC_A1TBLK")
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;Modifies the selected attribute with the value given.
(defun MYATTRIB-Y (myblk myatt myattvalue Y / test)
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
((and (= (cdr (assoc 2 endxf)) myatt) (equal Y (caddr (assoc 10 endxf)) 0.1))
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

;(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "A0" 53.0)
;(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "A1" 46.0)
;(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "A2" 39.0)
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
(defun MYATTRIB-Y-TEST (myblk myatt Y / test)
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
((and (= (cdr (assoc 2 endxf)) myatt) (equal Y (caddr (assoc 10 endxf)) 0.1))
(progn
(setq gVarAtt (princ (cdr (assoc 1 endxf))))
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

;Sets 'gVarAtt' as a global variable to be used outside of this function.
;(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO1" 53.0)
;(myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" 53.0)
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


