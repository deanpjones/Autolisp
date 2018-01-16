;;;This needs to be loaded into the ACADDOC.LSP or the ACAD.LSP file.

(vl-load-com)

(defun DoThisSysVarWillChange (Caller CmdSet)
  (alert "A SysVar will Change in the drawing!")
  (princ)
)

(defun DoThisSysVarChanged (Caller CmdSet)
  (alert "A SysVarChanged in the drawing!")
  (princ) 
)

(setq MyReactor1
  (vlr-sysvar-reactor
    nil
     '((:vlr-sysVarWillChange . DoThisSysVarWillChange)
       (:vlr-sysVarChanged . DoThisSysVarChanged)
      )
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


