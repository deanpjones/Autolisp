;;;Realtime UCS Cycle.
        
(defun C:ucscyc ()

	(if (= (menugroup "express") nil) (command "menuload" "C:/Program Files/AutoCAD 2002/Express/acetmain.mnc")
	)

	(command "ucsicon" "on")
	(command "rtucs" "c")
	
(princ)
)




