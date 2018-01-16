
;;;Toggles isometric crosshair to regular crosshair.

  
(defun C:ss (/ grdunt)

(setq grdunt (getvar "gridunit"))
  
   	(if 	
		(= (getvar "snapstyl") 0)

		(setvar "snapstyl" 1)

		(progn
			(setvar "snapstyl" 0)
			(setvar "gridunit" grdunt)
		)
	)
(princ)
)
			



	      
		     
			    