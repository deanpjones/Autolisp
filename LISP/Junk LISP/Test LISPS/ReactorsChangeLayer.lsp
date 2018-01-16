;;;This needs to be loaded into the ACADDOC.LSP or the ACAD.LSP file.

(vl-load-com)

(defun DoThisSysVarChanged (Caller CmdSet)
(if (= (getvar "clayer") "MTO-BAL")
	(progn
(setvar "clayer" "0")
(princ "\nThe layer has been changed from MTO-BAL to 0.")
	)
(princ "\n~~~~~ReactorChangeLayer has failed!~~~~~")
)
(princ) 
)

(setq MyReactor1
  (vlr-sysvar-reactor
    '("clayer")
     '((:vlr-sysVarChanged . DoThisSysVarChanged))
  )
)

(defun Clear_My_Reactors ()
  (if (and MyReactor1
   (vlr-added-p MyReactor1))
    (vlr-remove MyReactor1))
)

(defun Clear_All_Reactors ( / TMP)
  (vlr-remove-all :vlr-sysvar-reactor)
)


;;;--------------------------------------------------------------------------------
;;;--------------------------------------------------------------------------------
;;;--------------------------------------------------------------------------------

(vl-load-com)
(vlr-manager '(VLR-SysVar-Reactor nil '((:VLR-sysVarChanged . DoThisSysVarChanged)))
3)

(defun DoThisSysVarChanged (calling-reactor commandInfo)
(if (= "clayer" (car commandInfo))
	(progn
(setvar "clayer" "0")
(PRINC "\nAttempt to change layer to 0!!")
	)
	(progn
(setvar "clayer" "MTO-BAL")
(PRINC "\nAttempt to change layer to MTO-BAL!!")
	)
)
(princ)
)



;;;--------------------------------------------------------------
;;;--------------------------------------------------------------
;;;--------------------------------------------------------------
;REACTOR THAT PRINTS ANY SYSTEM VARIABLE CHANGE.

(defun sysvarChanged (reactor info)
(terpri)
(princ (strcat "*** "(car info) " "))
(princ (getvar (car info)))
(terpri)
(princ)
)

(vlr-sysvar-reactor nil '((:vlr-sysvarChanged . sysvarChanged)))
;;;--------------------------------------------------------------
;;;--------------------------------------------------------------
;;;--------------------------------------------------------------
