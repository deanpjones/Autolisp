(defun C:MYRINGREV2 ( / os pt1 n n0 n1 mylist1 n2 n3 descN a )

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
;(myattrib-y (myblk 2 "CPC-REV") "DATE" "09/02/06" n)
(myattrib-y (myblk 2 "CPC-REV") "DATE" "09/03/13" n)
(myattrib-y (myblk 2 "CPC-REV") "EDITED_BY" "DJ" n)
(myattrib-y (myblk 2 "CPC-REV") "PM_APPROVAL" "SR" n)
;-------------------------------------------------------------------------------------------------------------------
;Ring Border(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR 2008/09 DRILLING PROGRAM (NET# 10218768) (BY CPC)" n)
;Heathdale 9-1(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR CONSTRUCTION (NET# 10233770) (BY CPC)" n)
(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR CONSTRUCTION (NET# 10245193) (BY CPC)" n) ;TA-1 5-13, BC-3 C-8-H
;Green Creek d-65-I(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR CONSTRUCTION (NET# 10246561) (BY CPC)" n) ;Green Creek d-65-I
;(myattrib-y (myblk 2 "CPC-REV") descN "ISSUED FOR CONTRUCTION (NET# 10218768) (BY CPC)" n)
;-------------------------------------------------------------------------------------------------------------------

(command "regen")

(setvar "osmode" os)


(princ)
);end DEFUN.



;******************************************************************************************************
;New user input for all revisions.
(defun ( / )
(setq CPCuserDate (getstring "Enter Date: "))
(setq CPCuserInitials (getstring "Enter Your Initials: "))
(setq CPCuserPM (getstring "Enter Project Manager Initials: "))
(setq CPCuserDescription (getstring T "Enter Revision Description: "))

;---
(setq AList (append (list (getvar "CMDECHO")) AList))
	(setq AList (append (list (getvar "HIGHLIGHT")) AList))
	(setq AList (append (list (getvar "OSMODE")) AList))
	(setq AList (append (list (getpoint "\Enter First Point : ")) AList))
	(setq AList (append (list (getpoint "\Enter Second Point : ")) AList))
	(setq AList (append (list (getdist "\Enter Thickness : ")) AList))
	(setq AList (append (list (getint "\Enter Number Required : ")) AList))
;---
(setq revList1 (list CPCuserDate CPCuserInitials CPCuserPM CPCuserDescription))
(nth 0 revlist1)
(nth 1 revlist1)
(nth 2 revlist1)
(nth 3 revlist1)


;????????????????????????????????????????????????????????????????????????????????????????
(setq f (open "P:\\Riseball Enterprises\\6 - AutoCAD Configuration\\2-AutoLisp\\AutoCAD 2007\\revlist-Dean.txt" "r"))
(read-line f) 

(setq fil "P:\\Riseball Enterprises\\6 - AutoCAD Configuration\\2-AutoLisp\\AutoCAD 2007\\revlist-Dean.txt")
(setq x (open fil "r") ct 0)
(while (read-line x)
  (setq ct (1+ ct))
)
(close x)
;????????????????????????????????????????????????????????????????????????????????????????

;*************************
;Enter revision data.
(princ "/nEnter Revision Criteria: ")
(setq revNum (itoa (getint "Enter Number: ")))
(setq revSave (getstring T "Revision Name: "))
(setq a (getstring "DATE: "))
(setq b (getstring "BY: "))
(setq c (getstring "CHK'D DFTG: "))
(setq d (getstring "CHK'D ENG: "))
(setq e (getstring "APP'D PM: "))
(setq f (getstring T "REVISION ISSUE: "))
(setq rev (strcat revNum "," revSave "," a "," b "," c "," d "," e "," f ))
;*************************
(setenv (strcat "CPC-REV\\" (getvar "LOGINNAME"))
(setenv (strcat "CPC-REV\\" (getvar "LOGINNAME") )


(cond
(
;*************************
(setenv "CPC-REV\\DTS" "ABC,DEF,GHI")
(getenv "CPC-REV\\DTS")
;*************************

);end defun.
;******************************************************************************************************