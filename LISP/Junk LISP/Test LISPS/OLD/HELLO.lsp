(defun C:HELLO( / dcl_id )

(setq dcl_id (load_dialog "hello.dcl")) 	;Load the DCL file.

(if	(not (new_dialog "hello" dcl_id))	;Initialize the dialog.
	(exit)                                	;Exit if this doesn't work.
)



(start_dialog)					;Display the dialog box.

(action_tile "tog" "(setvar "ltscale" 33)")

(unload_dialog dcl_id)				;Unload the DCL file.



(princ)
)
