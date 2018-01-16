(defun C:MYRINGREV ( / os pt1 n n0 n1 mylist1 n2 n3 descN a )

(setq os (getvar "osmode"))	;get osmode
(setvar "osmode" 64)		;set osmode

(if (= nil (setq pt1 (getpoint "Pick last revision line number (or Press Enter for None): ")))
(setq pt1 (list 0.0 61.0 0.0)))												;get last rev number.

(setq n (- (cadr pt1) 8))													;get new line number (REAL).
(setq n0 (- (cadr pt1) 1))													;get last line number (REAL).
(setq n1 (rtos n 2 1))														;get new line number (STRING).

(setq mylist1 '("53.0" "46.0" "39.0" "32.0" "25.0" "18.0" "11.0" "4.0"))
(setq n2 (1+ (vl-position n1 mylist1)))										;get line number place (REAL).
(setq n3 (rtos n2 2 0))														;get line number place (STRING).


(setq descN (strcat "REV_DESC_NO" n3 "_(CO_&_PROJECT#)"))					;create desc text.


(myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n0)					;test last rev number.(gets gVarAtt from MYBLK-Y.lsp)
(if (/= nil gVarAtt)
(setq revN (rtos (1+ (atoi gVarAtt)) 2 0))							;set new revision number.	
(setq revN "0")
)


(myattrib (myblk 2 "CPC_A1TBLK") "REV" revN)			;MODIFY OFFICIAL REV.

(myattrib-y (myblk 2 "CPC-REV") "REV_NO" revN n)		;MODIFY REVISION REV.

;(myattrib-y (myblk 2 "CPC-REV") "DATE" "09/11/02" n)
;(myattrib-y (myblk 2 "CPC-REV") "DATE" "09/11/06" n)

;(myattrib-y (myblk 2 "CPC-REV") "PM_APPROVAL" "RD" n)
;(myattrib-y (myblk 2 "CPC-REV") "PM_APPROVAL" "DS" n)

;-------------------------------------------------------------------------------------------------------------------
;(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR CONSTRUCTION (NW# 10239217) (BY CPC)" n);Default
;(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR CONSTRUCTION (NW# 10239217) (BY CPC)" n);Rick Dowell
;(myattrib-y (myblk 2 "CPC-REV") descN "AS-BUILT (NW# 10266263) (BY CPC)" n);Debbie Seimens

;Medicine River 12-28
;(myattrib-y (myblk 2 "CPC-REV") "DATE" "09/06/26" n)(myattrib-y (myblk 2 "CPC-REV") "EDITED_BY" "DJ" n)(myattrib-y (myblk 2 "CPC-REV") "PM_APPROVAL" "MC" n)
;(myattrib-y (myblk 2 "CPC-REV") descN "AS-BUILT (NW# 10249726) (BY CPC)" n);Medicine River 12-28

;Valhalla-La Glace - Debbie Seimens
(myattrib-y (myblk 2 "CPC-REV") "DATE" "09/11/27" n)(myattrib-y (myblk 2 "CPC-REV") "EDITED_BY" "DJ" n)(myattrib-y (myblk 2 "CPC-REV") "PM_APPROVAL" "DS" n)
(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR REVIEW (NW# 10266263) (BY CPC)" n);Debbie Seimens

;-------------------------------------------------------------------------------------------------------------------

(command "regen")

(setvar "osmode" os)


(princ)
);end DEFUN.


;???????????????????????????????????????????
(defun C:TREV ( / pathprefix fullpath fileRevW fileRevR getDate getDwgBy getChkdBy getChkdEng getAppdPM getRevDesc os pt1 n n0 n1 mylist1 n2 n3 descN a ptA ptC)

;How to write to a text file for the revision info...
(setq pathprefix (GETVAR "DWGPREFIX"))
(setq fullpath (strcat pathprefix "revision.txt"))

;----------------------------------------
;Writes a new revision.txt file.
(if (= nil (vl-directory-files pathprefix "revision.txt" 1))
(progn
(setq fileRevW (open fullpath "w"))
;??????????(setq fileRev (open "c:\\new.txt" "w"))

(write-line (setq getDate (getstring "Enter the revision date: ")) fileRevW)
(write-line (setq getDwgBy (getstring "Enter the initials drawn by: ")) fileRevW)
(write-line (setq getChkdBy (getstring "Enter the initials checked by: ")) fileRevW)
(write-line (setq getChkdEng (getstring "Enter the initials engineer checked by: ")) fileRevW)
(write-line (setq getAppdPM (getstring "Enter the initials approved project manager: ")) fileRevW)
(write-line (setq getRevDesc (getstring T "Enter the revision description: ")) fileRevW)

(CLOSE fileRevW)
);end progn.
);end if.
;----------------------------------------
;Reads revision.txt file.
(if (/= nil (vl-directory-files pathprefix "revision.txt" 1))
(progn
(setq fileRevR (open fullpath "r"))

(setq getDate (read-line fileRevR))
(setq getDwgBy (read-line fileRevR))
(setq getChkdBy (read-line fileRevR))
(setq getChkdEng (read-line fileRevR))
(setq getAppdPM (read-line fileRevR))
(setq getRevDesc (read-line fileRevR))

(CLOSE fileRevR)
);end progn.
(princ "/nRevision.txt file not found.")
);end if.
;----------------------------------------

;*******************************************************************
;*******************************************************************
;Revision lisp in action.
(setq os (getvar "osmode"))	;get osmode
(setvar "osmode" 64)		;set osmode
;---------------------------------------------------------
(if (= nil (setq pt1 (getpoint "Pick last revision line number (or Press Enter for None): ")))
(setq pt1 (list 0.0 61.0 0.0)))												;get last rev number.

(setq n (- (cadr pt1) 8))													;get new line number (REAL).
(setq n0 (- (cadr pt1) 1))													;get last line number (REAL).
(setq n1 (rtos n 2 1))														;get new line number (STRING).

(setq mylist1 '("53.0" "46.0" "39.0" "32.0" "25.0" "18.0" "11.0" "4.0"))
(setq n2 (1+ (vl-position n1 mylist1)))										;get line number place (REAL).
(setq n3 (rtos n2 2 0))														;get line number place (STRING).

(setq descN (strcat "REV_DESC_NO" n3 "_(CO_&_PROJECT#)"))					;create desc text.
;---------------------------------------------------------
(myattrib-y-test (myblk 2 "CPC-REV") "REV_NO" n0)					;test last rev number.(gets gVarAtt from MYBLK-Y.lsp)
(if (/= nil gVarAtt)
(setq revN (rtos (1+ (atoi gVarAtt)) 2 0))							;set new revision number.	
(setq revN "0")
)
;---------------------------------------------------------
(myattrib (myblk 2 "CPC_A1TBLK") "REV" revN)			;MODIFY OFFICIAL REV.
(myattrib-y (myblk 2 "CPC-REV") "REV_NO" revN n)		;MODIFY REVISION REV.

;Change revision info based on revision.txt
(myattrib-y (myblk 2 "CPC-REV") "DATE" getDate n)
(myattrib-y (myblk 2 "CPC-REV") "EDITED_BY" getDwgBy n)
(myattrib-y (myblk 2 "CPC-REV") "DRAFTING_CHECKER" getChkdBy n)
(myattrib-y (myblk 2 "CPC-REV") "ENGINEERING_CHECKER" getChkdEng n)
(myattrib-y (myblk 2 "CPC-REV") "PM_APPROVAL" getAppdPM n)
(myattrib-y (myblk 2 "CPC-REV") descN getRevDesc n)

;-------------------------------------------------------------------------------------------------------------------
(command "regen")
(setvar "osmode" os)
;*******************************************************************
;*******************************************************************

;----------------------------------------------
;Draw a rectangle around the area being edited.
(setq ptA (list 312 72))
(setq ptC (list 492 -2))

(command "zoom" "w" ptA ptC)
(command "zoom" "s" "0.8xp")

(grvecs '(-3 (312 72) (492 72)
          -3 (492 72) (492 -2)
          -3 (492 -2) (312 -2)
          -3 (312 -2) (312 72)
))
;----------------------------------------------

(princ)
);end defun.

;???????????????????????????????????????????