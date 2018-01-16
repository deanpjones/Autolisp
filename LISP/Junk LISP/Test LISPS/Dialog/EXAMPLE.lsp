;;;--- EXAMPLE.lsp - Text Find

(defun saveVars()
  ;;;--- Save the input from the dialog box
  (setq textVal (get_tile "textval"))
)


(defun C:EXAMPLE()

  ;;;--- Load the dcl file
  (setq dcl_id (load_dialog "EXAMPLE.dcl"))

  ;;;--- Load the dialog definition if it is not already loaded
  (if (not (new_dialog "EXAMPLE" dcl_id) ) (exit))

  ;;;--- If an action event occurs, do this function
  (action_tile "cancel" "(setq ddiag 1)(done_dialog)")
  (action_tile "accept" "(setq ddiag 2)(saveVars)(done_dialog)") 

  ;;;--- Display the dialog box
  (start_dialog)

  ;;;--- If the cancel button was pressed - display message
  (if (= ddiag 1)
    (princ "\n \n ...EXAMPLE Cancelled. \n ")
  )

  ;;;--- If the "Okay" button was pressed
  (if (= ddiag 2)
    (princ "\n \n ...Example Complete!")
  )

  ;;;--- Suppress the last echo for a clean exit
  (princ)

) 