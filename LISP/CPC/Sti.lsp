
;;;Conversion AutoLISP program for converting steel members from metric to imperial.
;;;Compliments of Dean Jones, Dec.31, 2003.

;;;Collect Info for Steel Conversion from metric to imperial.
  
(defun C:sti (/ a b c d e f g)
  
   	(setq a
	       (getreal
		 "\nWhat is the size of member(mm):  "
	       )
	)
  
	(setq b
	       (getreal
		 "\nWhat is the weight of member(kg):  "
	       )
	)


  
;;;Conversion from metric (mm per kg/m) to imperial (in per lb/ft).
  
  	(setq c (rtos (cvunit a "mm" "in") 2 0))
	(setq d (cvunit b "kg" "lb"))
	(setq e (cvunit 1 "m" "ft"))

	(setq f (rtos (/ d e) 2 0))
	


;;;Prints the Steel Conversion into Imperial.
 
        (setq g 
		(princ
	  (strcat "\nThe steel member is: W"c" x "f"")
		)
	)
	(princ)
)

;;;Converts the steel to imperial.


  	

	      
		     
			    