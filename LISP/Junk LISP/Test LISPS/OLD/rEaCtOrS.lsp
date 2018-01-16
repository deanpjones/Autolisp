;;;This needs to be loaded into the ACADDOC.LSP or the ACAD.LSP file.

(vl-load-com)

(defun DoThisDoubleClick (Caller CmdSet)
  (alert "You just DoubleClicked the drawing!")
  (princ)
)

(defun DoThisRightClick (Caller CmdSet)
  (alert "You just RightClick the drawing!")
  (princ) 
)

(setq MyReactor1
  (vlr-mouse-reactor
    nil
     '((:vlr-beginDoubleClick . DoThisDoubleClick)
       (:vlr-beginRightClick . DoThisRightClick)
      )
  )
)

(defun Clear_My_Reactors ()
  (if (and MyReactor1
   (vlr-added-p MyReactor1))
    (vlr-remove MyReactor1))
)

(defun Clear_All_Reactors ( / TMP)
  (vlr-remove-all :vlr-mouse-reactor)
)

;************************************************************