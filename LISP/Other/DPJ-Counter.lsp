;;;Creates a counter for the supplied arguments.
;;;Compliments of Dean Jones, Apr. 10, 2007. 

;;;**********************************************************************
;Counter starts at (1- x) from the supplied length.
(defun dpj-counter2 ( list_length list_break / x)
(setq x (list (1- list_length)))				;Create a COUNTER LIST from the number of entities.
(while (/= (car x) list_break)
(setq x (cons (1- (car x)) x))
)
)
;;;**********************************************************************
;Counter starts exactly at the supplied length.
(defun dpj-counter1 ( list_length list_break / x)
(setq x (list list_length))				;Create a COUNTER LIST from the number of entities.
(while (/= (car x) list_break)
(setq x (cons (1- (car x)) x))
)
)
;;;**********************************************************************