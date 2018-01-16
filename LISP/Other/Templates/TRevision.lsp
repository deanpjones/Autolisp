(defun C:TREVISION-PRE ( / uRev uRevDate uRevInitials uRevDescr)

(setq uRev (strcase (getstring "Enter revision number:  ")))
(setq uRevDate (strcase (getstring "Enter revision date:  ")))
(setq uRevInitials (strcase (getstring "Enter your initials:  ")))
(setq uRevDescr (strcase (getstring T "Enter revision description:  ")))

;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
(defun *error* (msg)
  (princ (strcat "\nThe titleblock revision cannot update.  Error: " msg))
  (princ)
)
;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;NOTE, USE THE (MYBLK.LSP FILE USING THE FUNCTIONS, MYBLK AND MYATTRIB) FOR THE BELOW COMMANDS


;(setq r1 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO1")))
;(setq r2 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO2")))
;(setq r3 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO3")))
;(setq r4 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO4")))
;(setq r5 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO5")))
;(setq r6 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO6")))
;(setq r7 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO7")))
;(setq r8 (vl-symbol-name (myattrib-test (myblk 2 "PROJ_VER") "VER_NO8")))

;Change titleblock PRELIMINARY REVISION.
;(cond
;((= "" r1)
;(progn
(myattrib (myblk 2 "PROJ_VER") "VER_NO1" uRev)
(myattrib (myblk 2 "PROJ_VER") "VER_DATE" uRevDate)
(myattrib (myblk 2 "PROJ_VER") "VER_DRAFTED_BY" uRevInitials)
(myattrib (myblk 2 "PROJ_VER") "VER_DESC_NO1" uRevDescr)
;))
;((= "" r2)
;(progn
;(myattrib (myblk 2 "PROJ_VER") "VER_NO2" uRev)
;(myattrib (myblk 2 "PROJ_VER") "VER_DATE" uRevDate)
;(myattrib (myblk 2 "PROJ_VER") "VER_DRAFTED_BY" uRevInitials)
;(myattrib (myblk 2 "PROJ_VER") "VER_DESC_NO2" uRevDescr)
;))
;(T nil)
;)

(command "regen")

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
(princ)
)
