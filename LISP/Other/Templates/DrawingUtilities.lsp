(atoms-family 1) 	;Prints all the variables in a drawing.
;--------------------------------------------
;--------------------------------------------
;Prints the values of all the variables.
(foreach itm (atoms-family 0)
(princ itm)
(princ "=")
(princ (eval itm))
(princ "\n")
)

;--------------------------------------------
;--------------------------------------------
;Searches for hidden variables, by VARIABLE NAME (X = "STRING")
(defun VAR_SEARCH (x / )
(foreach itm (atoms-family 1)
(if (wcmatch itm x)
(progn
(princ (strcase itm T))
(princ "=")
(princ (eval (read itm)))
(princ "\n")
)))
)
;eg.(VAR_SEARCH "D*") (Uses wcmatch for filtering and is CASE SENSITIVE.)

;--------------------------------------------
;--------------------------------------------
;--------------------------------------------
(defun c:listnums ( / atoms)
(if
(setq atoms
(apply 'append
(mapcar
'(lambda (x) (if (numberp (eval (read x))) (list x)))
(atoms-family 1)
)
)
)
(foreach x (acad_strlsort atoms)
(princ (strcat "\n" x " = "))
(princ (eval (read x)))
)
(princ "\nNo numbers found in atoms-family.")
)
(princ)
)
;--------------------------------------------
;--------------------------------------------
;--------------------------------------------
;Searches for hidden variables, by VARIABLE VALUE
;???Can I add the SYSTEM AND ENVIRONMENT VARIABLES.???
(defun mylistnums (n / atoms)
(if
(setq atoms
(apply 'append
(mapcar
'(lambda (x) (if (and (= n (eval (read x))) (numberp (eval (read x)))) (list x)))
(atoms-family 1)
)
)
)
(foreach x (acad_strlsort atoms)
(princ (strcat "\n" x " = "))
(princ (eval (read x)))
)
(princ "\nNo numbers found in atoms-family.")
)
(princ)
)
;eg.(mylistnums 5000)
;--------------------------------------------
;--------------------------------------------
;--------------------------------------------