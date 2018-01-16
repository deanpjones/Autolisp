;MYREV-UP
;Dean Jones, Oct 08, 2008

(cond
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "0" 53.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "1" 46.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "2" 39.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "3" 32.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "4" 25.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "5" 18.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "6" 11.0)
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" "7" 4.0)


(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO1" 53.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO2" 46.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO3" 39.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO4" 32.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO5" 25.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO6" 18.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO7" 11.0)
(myattrib-y-test (myblk 2 "PROJ_VER") "VER_NO8" 4.0)


VER_NO1
VER_DATE
VER_DRAFTED_BY
VER_DRAFTING_CHECKER
VER_ENGINEERING_CHECKER
VER_PM_APPROVAL
VER_DESC_NO1

REV_NO
DATE
EDITED_BY
DRAFTING_CHECKER
ENGINEERING_CHECKER
PM_APPROVAL
REV_DESC_NO1_(CO_&_PROJECT#)

(setq mylist '((1 . 53.0) (2 . 46.0) (3 . 39.0) (4 . 32.0) (5 . 25.0) (6 . 18.0) (7 . 11.0) (8 . 4.0)))

(defun LIST_VER ()
(foreach n mylist
(myattrib-y-test (myblk 2 "PROJ_VER") (strcat "VER_NO" (itoa (car n))) (cdr n))
);END FOREACH.
;(car n)(cdr n)
);END DEFUN. 

(defun LIST_REV ()
(foreach n mylist
(myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" (cdr n))
);END FOREACH.
);END DEFUN. 

(defun LIST_PRELIMINARY_REV ()
(foreach n '(
VER_NO1
VER_DATE
VER_DRAFTED_BY
VER_DRAFTING_CHECKER
VER_ENGINEERING_CHECKER
VER_PM_APPROVAL
VER_DESC_NO1
) 
(myattrib-y-test (myblk 2 "PROJ_VER") n 53.0)
);END FOREACH.
);END DEFUN. 

