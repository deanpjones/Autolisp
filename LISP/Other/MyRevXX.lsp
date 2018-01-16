

(setq mylist1 '(53.0 46.0 39.0 32.0 25.0 18.0 11.0 4.0))
(setq mylist2 '("REV_NO" "DATE" "EDITED_BY" "DRAFTING_CHECKER" "ENGINEERING_CHECKER" "PM_APPROVAL" "REV_DESC_NO1_(CO_&_PROJECT#)"))


(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO1" n)
(myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n)




(while (SETQ N #)(TEST TIL "")
);END WHILE.


;****************************************************************
;****************************************************************

(setq mylist1 '(53.0 46.0 39.0 32.0 25.0 18.0 11.0 4.0))
;(setq listTest nil)
;(foreach n mylist1 (setq listTest (cons (list (myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n)) (list listTest))))

;(foreach n mylist1 (myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n))
;(foreach n mylist1 (setq a (append (myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n))))
;????????????????????????????
(setq a
(mapcar '(append n)
(foreach n mylist1 (princ (1+ n)))
))
;????????????????????????????
(while (= a "")
(setq a (foreach n mylist1 (myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n)))
)
;????????????????????????????
;(foreach n mylist1 (setq revY n)) ;???Sets the revision line number.
???;(setq a (assoc 10 (command "listdxf1")))
(setq x (cadr (member xx mylist1))) ;Gets next line below the one selected.
(setq revNth (1+ (vl-position revY mylist1))) ;Tells me what revision line number?

(setq revDesc (strcat "REV_DESC_NO" (rtos revNth 2 0) "_(CO_&_PROJECT#)"))
(setq revName (list "REV_NO" "DATE" "EDITED_BY" "DRAFTING_CHECKER" "ENGINEERING_CHECKER" "PM_APPROVAL" revDesc))

;(cond 
;(= "CPC-REV" (setq blkName (cdr (assoc 2 (entget (myblk 1 nil))))) ;Gets block name.
;****************************************************************
(foreach n revName (myattrib-y (myblk 2 "CPC-REV") n "XX" revY)) ;Adds "XX" to all lines
;****************************************************************
;****************************************************************
