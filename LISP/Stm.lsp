
;;;Conversion AutoLISP program for converting steel members from metric to imperial.
;;;Compliments of Dean Jones, Dec.31, 2003.

;;;Collect Info for Steel Conversion from imperial to metric.
  
(defun C:stm (/ a b c d e f g)
  
   	(setq a
	       (getreal
		 "\nWhat is the size of member(in):  "
	       )
	)
  
	(setq b
	       (getreal
		 "\nWhat is the weight of member(lb):  "
	       )
	)


  
;;;Conversion from imperial (in per lb/ft) to metric (mm per kg/m).
  
  	(setq c (rtos (cvunit a "in" "mm") 2 0))
	(setq d (cvunit b "lb" "kg"))
	(setq e (cvunit 1 "ft" "m"))

	(setq f (rtos (/ d e) 2 0))
	


;;;Prints the Steel Conversion into Metric.
 
        (setq g 
		(princ
	  (strcat "\nThe steel member is: W"c" x "f"")
		)
	)
	(princ)
)

;;;Converts the steel to imperial.


  	

	      
		     
			    