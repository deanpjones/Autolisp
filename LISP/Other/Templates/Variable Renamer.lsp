;;;Variable Renamer Function.
;;;Dean Jones, April 25, 2006

(setq arglist '(1 2 3 4 5 6 7 8))				;Assigns a custom variable to each value (eg. varX = X, var1 = 1 ...)
(mapcar '(lambda (x) (set (read (strcat "var" (itoa x))) x)) arglist)