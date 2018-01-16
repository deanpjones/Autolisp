;Block Updater.
;Re-created a block update utility.
;Takes a block path and re-defines the block from that location.
;Uses the autocad file search path's as well as any paths entered below.
;Dean Jones, Jul 04, 2007


(defun C:MYBLOCKUPDATE ( / en blk blkdxf typ blkname blkfile )

(setq en (entsel "\n Select block: "))						;Select entity
(setq blk (car en))											;Get entity name
(setq blkdxf (entget blk))									;Get entity dxf properties
(setq typ (cdr (assoc 0 blkdxf)))							;Get entity TYPE

		(if (= typ "INSERT")
		(progn
(setq blkname (strcase (cdr (assoc 2 blkdxf))))				;Gets blockname selected.

(setq blkfile
		(if (not (findfile (strcat blkname ".dwg")))					;Checks autocad supports directories for this file?
			(cond
			((findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Flow\\" blkname ".dwg")))
			((findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Ortho\\" blkname ".dwg")))
			((findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Iso\\" blkname ".dwg")))
			(T nil)
			)
			(findfile (strcat blkname ".dwg"))
		)
)

(if (and (= typ "INSERT") (/=  blkfile nil))					;Test, that it's a block, and that a block file exists.

;**************************************************************************************************************
;**************************************************************************************************************
(command "_.-insert" (strcat blkname "=" blkfile) (command))	;Updates the block with the specified filename.
;**************************************************************************************************************
;**************************************************************************************************************

(alert (strcat "\nThe block \"" blkname "\" cannot be updated, a file was not found."))		;If the file doesn't exist.
);end if.
(princ "\nBlock Update completed successfully.")
		);end progn.

		(alert "\nThe object selected is not a block, please try again.")	;If it's not a block.
		);end if.

;************************************************************************************************************************
;If there are attributes present.
;Added by Dean Jones, Aug 14, 2007.

(if (= (cdr (assoc 66 blkdxf)) 1)								;IF THERE ARE ATTRIBUTES PRESENT.
(progn (arxload "battman")(acet-attsync blkname))				;then... ATTSYNC.
)
;************************************************************************************************************************

(princ)
)
