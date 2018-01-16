;;;Arguments for TYPES of variables in Lists.

(setq STRINGlist '("A" "B" "C" "D" "E"))				;STRINGS test list

(setq REALlist '(1.2 -2.11 3.0))						;REALS test list
(setq INTEGERlist '(1 -2 3 4 -5))						;INTEGER test list
(mapcar '(lambda (x) (numberp x)) REALlist)				;Verifies Real or Integer, Returns T or nil.
(mapcar '(lambda (x) (numberp x)) INTEGERlist)	

(setq txtlist '("A" "B" "C" "D"))						;STRINGS test list

(setq MYFUNCTION (vl-symbol-name x)						;Converts LIST OF SYMBOLS to LIST OF STRINGS.


(setq list (mapcar '(lambda (x) (MYFUNCTION)) list))	;Generic MapCar Lambda Function.


;Convert entire list to STRINGS.
(defun STRINGLIST (arg1)

)