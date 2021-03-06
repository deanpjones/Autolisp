(defun C:dj_open( / dcl_id )
  (setq dcl_id (load_dialog "dj_open.dcl")) ; Load the DCL file.
  (if (not (new_dialog "dj_open" dcl_id))   ; Initialize the dialog.
    (exit)                                ; Exit if this doesn't 
                                          ; work.
  )
  (start_dialog)                          ; Display the dialog 
                                          ; box.
  (unload_dialog dcl_id)                  ; Unload the DCL file.
  (princ)
)