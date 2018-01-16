;PREFIX ADDED TO A LIST using STRINGS.
;Dean Jones, April 27, 2006.

(setq varlist (mapcar '(lambda (x) (read (strcat "var" (itoa x)))) sslist))			;Creates Custom Variable names.