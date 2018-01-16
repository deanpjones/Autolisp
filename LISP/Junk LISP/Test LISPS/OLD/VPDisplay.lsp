;;;Toggles viewport ON and OFF
        
(defun C:vpdisplay ()

(if (= (getvar "psltscale") 0) (

	(setq a (getreal "Enter the scale (1:XX):  ")) 
	(setvar "userR5" a)
	(setvar "ltscale" (* a 10))
	(setq a (rtos a 2 0))
	(princ (strcat "\nThe Linetype scale has been set to modelspace 1:"a"."))
)

-------------------------------------------------------------

	((setvar "ltscale" 10)
	(setvar "psltscale" 1)
	(princ "\nThe Linetype scale has been set to paperspace.")
))

(princ)

)





