(defun C:REVCHG ( / ss1 )
(setq ss1 (ssget "X" '((0 . "INSERT") (2 . "revtri")))) 	;Get SELECTION SET.
(command "pselect" "p" "")
)

(defun C:TIECHG ( / ss1 )
(setq ss1 (ssget "X" '((0 . "INSERT") (2 . "tie-in2")))) 	;Get SELECTION SET.
(command "pselect" "p" "")
)