"C:\\_Configuration\\2-AutoLisp\\Dialog.dcl"
"\\\\CANPRINT\\HP8150N8 Rm2213"
(setq dbox "C:/_Configuration/2-AutoLisp/Dialog.dcl")			;Set dialog *.dcl name.


(setq dbox "Revcloud")			;Set dialog *.dcl name.
(setq loadok (new_dialog dbox (load_dialog dbox) "Revcloud.lsp"))

(unload_dialog dcl_id)

;;-----------------------------------------------------------------------------
;;-----------------------------------------------------------------------------
(defun C:DIALOG( / dcl_id )
  (setq dcl_id (load_dialog "Dialog.dcl")) ; Load the DCL file.
  (if (not (new_dialog "Dialog" dcl_id))   ; Initialize the dialog.
    (exit)                                ; Exit if this doesn't 
                                          ; work.
  )
  (start_dialog)                          ; Display the dialog 
                                          ; box.
  (unload_dialog dcl_id)                  ; Unload the DCL file.
  (princ)
)
;;-----------------------------------------------------------------------------
;;-----------------------------------------------------------------------------







;; Load the dialog box.  Set up error checking to make sure   
;; the dialog file is loaded before continuing           
	(if (= -1 (setq dcl_id (load_dialog dbox)))
(progn
(princ (strcat "\nCannot load "dbox""))
(setq dialogLoaded nil)
)
	)

	
	
	
;;Loading a specific dialog into memory	
	(if (and dialogLoaded
        (not (new_dialog "gp_mainDialog" dcl_id))
(progn
(princ "\nCannot show dialog gp_mainDialog")
(setq dialogShow nil)
)
	)

	
;;Initializing the default values of the dialog.
	(if (and dialogLoaded dialogShow)
    (progn
      ;; Set the initial state of the tiles
      (set_tile "gp_trad" (rtos tileRad 2 2))
      (set_tile "gp_spac" (rtos tileSpace 2 2))

      
      
      
      ;; Assign actions (the functions to be invoked) to dialog buttons
(action_tile
  "gp_lw"
  "(setq plineStyle \"Light\")"
)
(action_tile
  "gp_hw"
  "(setq plineStyle \"Pline\")"
)
(action_tile
  "gp_actx"
  "(setq objectCreateMethod \"ActiveX\")"
)
(action_tile
  "gp_emake"
  "(setq objectCreateMethod \"Entmake\")"
)
(action_tile
  "gp_cmd"
  "(setq objectCreateMethod \"Command\")"
)
(action_tile "cancel" "(done_dialog) (setq UserClick nil)")
(action_tile
  "accept"
  (strcat "(progn (setq tileRad (atof (get_tile \"gp_trad\")))"
       "(setq tileSpace (atof (get_tile \"gp_spac\")))"
       "(done_dialog) (setq UserClick T))"
  )
)





;;Start the dialog
(start_dialog)