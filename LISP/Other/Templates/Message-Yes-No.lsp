;************************************************************************************************************************
;For an message box for the user to respond YES/NO.
;Added by Dean Jones, Aug 21, 2006.

;NOTE:  ACETUTIL.ARX utilites must be loaded to work.

(defun abc ( / blkname message userResponse )
(setq blkname "rev-tri")
(setq message (strcat "Are you sure you would like to update the block \"" (strcase BlkName) "\" for the ENTIRE DRAWING?"))

(setq userResponse (acet-ui-message message "Block Update" 4))
	(if
(= 6 userResponse) 											
(alert "Please check for any FLOATING TEXT from the previous blocks.")						;If YES, then...														
(alert "NO BLOCKS were updated.")															;If NO, then CANCEL.
	)
(alert "doody doddy doo!.")
)
;************************************************************************************************************************