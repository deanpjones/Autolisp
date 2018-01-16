;;;Audit and PurgeAll Utility to clean up drawings
;;;(PURGE will hopefully reduce the file sizes)
;;;(Audit cleans up problem with TEXTMASK erasing the TEXT)
;;;Compliments of Dean Jones Mar. 15, 2006

(defun c:auditpurgeall (/)

(command "layer" "set" "0" "")

(command "audit" "y")
(princ "\n******This DRAWING has been successfully AUDITED******")
(princ "\n")

(repeat 3 (command "-purge" "a" "" "n"))
(princ "\n******This DRAWING has been successfully PURGED******")

(princ)
)