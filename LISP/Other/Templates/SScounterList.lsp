;Creates a COUNTER LIST for use with MAPCAR to apply COUNTER to the LIST USING AN EXPRESSION.

(setq sslen	4)												;Get NUMBER OF ENTITIES in selection.

(setq sslist (list (1- sslen)))								;Create a COUNTER LIST from the number of entities.
(while (/= (car sslist) 0)
(setq sslist (cons (1- (car sslist)) sslist))
)