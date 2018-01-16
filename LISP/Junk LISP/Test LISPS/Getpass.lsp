(defun c:GETPASS ( / dcl_id pass )
  (setq dcl_id (load_dialog "getpass.dcl"))
  (if (new_dialog "passdlg" dcl_id)
    (progn
      (action_tile "password" "(setq pass $value)")
      (start_dialog)
      (unload_dialog dcl_id)
    )
    (princ "Error: Unable to load GETPASS.DCL. ")
  )
  pass
)
