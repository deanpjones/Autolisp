;Block Updater. 
;Added attribute condition to the end of the function.
;ATTSYNC for attributes.
;Dean Jones, Aug 18, 2006


;************************************************************************************************************************
;************************************************************************************************************************
(defun C:BLOCKUPDATE ( / ePick eList BlkName BlkFile BlkMsg MRegen ss ssIndx)
(while
  (and
    (not (setq ePick (entsel "\nSelect Block to update...\n")))
    (/= (getvar "errno") 52)
  )
)
(if ePick (setq eList (entget (car ePick))))
(if eList
  (if (and (= (cdr (assoc 0 eList)) "INSERT") (not (assoc 1 (tblsearch "BLOCK" (cdr (assoc 2 eList))))) )
    (progn
      (setq
        BlkName (strcase (cdr (assoc 2 eList)))
        BlkFile (findfile (strcat BlkName ".dwg"))
      )

      (if (not BlkFile) (setq BlkFile (findfile (strcat (getvar "dwgprefix") "DWG\\" BlkName ".dwg"))))	; CHANGE TO COND WITH NEXT LINE???
;      (if (not BlkFile) (setq BlkFile (findfile (strcat "H:\\BORDERS\\" BlkName ".dwg")))) ; EDIT TO ANY EXISTING FOLDER PATH
      (if (not BlkFile)
        (progn
          (setq RtnMsg (dos_msgbox (strcat "File for Block " BlkName " not found. Want to Search? ") (strcat "Select File to update " BlkName) 4 4))
          (if (= RtnMsg 6)
            (setq BlkFile (getfiled (strcat "Select a file to replace " BlkName " :") (getvar "dwgprefix") "dwg" 4))
          )
        )
      )
      (if BlkFile
        (progn
          (command "_.undo" "_be")
          (setq MRegen (getvar "regenmode"))
          (setvar "regenmode" 0)
          (command "_.-insert" (strcat BlkName "=" BlkFile) (command))
          (setq
              ss (ssget "X" (list (cons 0 "INSERT") (cons 2 BlkName)))
              ssIndx nil
              ssIndx (sslength ss)
            )
          (repeat (sslength ss)
            (entupd (ssname ss (setq ssIndx (1- ssIndx))))
          )
          (if (eq BlkName (vl-filename-base BlkFile))
            (princ (strcat "Block " BlkName " has been updated from " BlkFile "."))
            (progn
              (setq BlkMsg
                (dos_msgbox
                  (strcat "Do you want to rename the Block to new name " (strcase (vl-filename-base BlkFile)) "?")
                  (strcat "Block " BlkName " has been updated from " BlkFile ".")
                  4
                  4
                )
              )
              (if (= BlkMsg 6)
                (if (tblsearch "BLOCK" (vl-filename-base BlkFile))
                  (alert (strcat "AGW Dwg Alert:\n\n" (strcat "Block " (vl-filename-base BlkFile) " already exists in this drawing. Cannot rename.")))
                  (progn
                    (princ (strcat "\nRenaming Block " BlkName " to " (vl-filename-base BlkFile) "."))
                    (command "_.rename" "_block" BlkName (strcase (vl-filename-base BlkFile)))
                  )
                )
              )
            )
          )
          (setvar "regenmode" MRegen)
          (command "_.undo" "_e")
        )
      (princ (strcat "\nBlock " BlkName " not updated."))
      )
    )
    (progn
      (princ "\nObject Selected is not a Block. Try again...\n")
      (C:BU)
    )
  )
)

;************************************************************************************************************************
;If there are attributes present.
;Added by Dean Jones, Aug 18, 2006.

(if (= (cdr (assoc 66 eList)) 1)				;IF THERE ARE ATTRIBUTES PRESENT.
	
(command "ATTSYNC" "N" blkname )				;then... ATTSYNC.

)	

;************************************************************************************************************************

(princ)
)

;************************************************************************************************************************
;************************************************************************************************************************
