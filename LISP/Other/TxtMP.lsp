

****************************************************************************
	
(defun C:dtxt1mp ()
	
	(command "dtext" "j" "m" pause 
		(if (= (getvar 'tilemode) 1) (* (getvar 'ltscale) 0.25) 2.5)
	pause)
)


****************************************************************************
	
(defun C:dtxt2mp ()
	
	(command "dtext" "j" "m" pause 
		(if (= (getvar 'tilemode) 1) (* (getvar 'ltscale) 0.40) 4.0)
	pause)
)

****************************************************************************
	
(defun C:mtxt1mp ()
	
	(command "mtext" pause "h" (if (= (getvar 'tilemode) 1) (* (getvar 'ltscale) 0.25) 2.5) "j" "mc" )
		
(princ)
)

****************************************************************************
	
(defun C:mtxt2mp ()
	
	(command "mtext" pause "h" (if (= (getvar 'tilemode) 1) (* (getvar 'ltscale) 0.40) 4.0) "j" "mc" )
		
(princ)
)