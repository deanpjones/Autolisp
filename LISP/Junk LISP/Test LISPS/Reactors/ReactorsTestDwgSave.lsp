;;;This needs to be loaded into the ACADDOC.LSP or the ACAD.LSP file.

(vl-load-com)

(defun DoThisAfterSave (Caller CmdSet)
  (alert "You just saved the drawing!")
  (princ)
)

(defun DoThisBeforeSave (Caller CmdSet)
  (alert "You are about to save the drawing!")
  (princ) 
)

(setq MyReactor1
  (vlr-dwg-reactor
    nil
     '((:vlr-BeginSave . DoThisBeforeSave)
       (:vlr-SaveComplete . DoThisAfterSave)
      )
  )
)

(defun Clear_My_Reactors ()
  (if (and MyReactor1
   (vlr-added-p MyReactor1))
    (vlr-remove MyReactor1))
)

(defun Clear_All_Reactors ( / TMP)
  (vlr-remove-all :vlr-dwg-reactor)
)
