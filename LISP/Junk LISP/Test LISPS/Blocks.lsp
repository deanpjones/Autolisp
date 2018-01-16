;Block Library

(defun C:blocksflow ()
  
   	(if (= (getvar "adcstate") 1)
		(command "adcnavigate" "R:/CADDSupport/2D Blocks/Flow/1-Blocks-FLOW.dwg/Blocks")
		(command "adcenter" "adcnavigate" "R:/CADDSupport/2D Blocks/Flow/1-Blocks-FLOW.dwg/Blocks")
	)
(princ)
)