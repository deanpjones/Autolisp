;Search and zoom for text value.
;Case sensitive.
;Dean Jones, Dec.01, 2008

;??If doesn't find, it still goes to last previous??
;??Needs complete string??

(defun C:MYFIND ( / filter ss1)

;(0 . "TEXT"),(0 . "ATTRIB")
(setq filter (list (cons 1 (getstring T "Enter the string to find:  "))))

(setq ss1 nil ss1 (ssget "X" filter))

(command "select" "p" "")
(command "zoom" "o" "p" "")
(command "zoom" "s" "0.6xp")

(princ)
)