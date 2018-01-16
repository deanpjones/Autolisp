;PRINTS a numbered list. (Note, list starts at one.)
;Dean Jones, July 27, 2006.

(defun LISTNUMBERER ( customlist / )
(foreach n customlist (princ (strcat (itoa (1+ (vl-position n customlist))) " - " n )) (terpri))
)



