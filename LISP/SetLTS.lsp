;Dean Jones, June 9, 2004

;;;Toggles linetype scale from model to paperspace.
;;;Ltscale to modelspace.
        
(defun C:ltsms (/ a)

	(setvar "psltscale" 0)
	(setq a (getreal "Enter the scale (1:XX):  ")) 
	(setvar "userR5" a)
	(setvar "ltscale" (* a 10))
	(setq a (rtos a 2 0))
	(command "regen")
	(princ (strcat "\nThe Linetype scale is set to modelspace 1:"a".\n"))(princ)
	
)

----------------------------------------------------------------------------------

;;;Ltscale to paperspace.

(defun C:ltsps ()

	(setvar "userR5" 1)
	(setvar "ltscale" 10)
	(setvar "psltscale" 1)
	(command "regen")
	(princ "\nThe Linetype scale is set to paperspace.")(princ)
	

)

----------------------------------------------------------------------------------






