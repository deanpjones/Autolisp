;;;This needs to be loaded into the ACADDOC.LSP or the ACAD.LSP file.
;;;Change the text layer to text1 and text2 automatically.

(vl-load-com)

(defun DoThisBeforeSave (Caller CmdSet)

(setvar "clayer" "TEXT1")

(setq ss1 (ssget "_X" '((0 . "TEXT"))))
(command "chprop" ss1 "" "la" "TEXT1" "")
(setq ss1 nil)
(gc)

(alert "The TEXT has all been changed to the TEXT1 layer.")

(princ)
)

(setq MyReactor1
  (vlr-dwg-reactor
    nil
     '((:vlr-BeginSave . DoThisBeforeSave)
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
