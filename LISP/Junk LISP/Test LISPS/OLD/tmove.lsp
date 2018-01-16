;;;Moves objects multiple until cancelled


(defun C:tmove ()
	(princ)
	(princ)
	(setvar "PICKFIRST" 0)
	(while (command "move" "p" "from"))
	(setvar "PICKFIRST" 1)
	(princ)
)



(mapcar
   (function (lambda (x) ("x" "x")))

(while (/= 1 0) (command "move" pause "from"))
	
