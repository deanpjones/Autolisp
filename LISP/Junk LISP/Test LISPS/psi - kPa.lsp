
;;;Conversion AutoLISP program for converting "psi" to "kPa".
;;;Compliments of Dean Jones, xxx.xx, 2005.


(defun C:press (/ psi kpa cal)
 
;;;Input (psi) value.
   	(setq psi
	       (getreal
		 "\nConvert (psi to kPa). Enter value?(psi):  "
	       )
	)
  
;;;Conversion from imperial (psi) to metric (kPa).
  
(setq kpa 6.894757)
(setq cal (rtos (* a kpa) 2 0))
(setq psi (rtos psi 2 0))

;;;Prints the result as a string.
 
        (setq g 
		(princ
	  (strcat "\nThe pressure "psi" psi = "kpa" kPa")
		)
	)
	(princ)
)



  	

	      
		     
			    