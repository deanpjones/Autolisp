


(setq en (nentsel "\n Select text entity: "))				;select entity
(setq txt (car en))											;get entity name
(setq txtdxf (entget txt))									;get entity dxf properties

;;;****************************************************************************
(foreach n (car (list txtdxf)) (print n))					;steps through each dxf dotted pair
;;;****************************************************************************


;;;trying to get a symbol looped so that it is assigned a value automatically
(mapcar (function (lambda (x) (setq x 1))) (list abc))		

(setq (foreach n (list abc) n) 1)



(setq typ (cdr (assoc 0 txtdxf)))							;get entity TYPE
(setq dim (cdr (assoc 8 txtdxf)))							;get entity TYPE




	(mapcar
(function (lambda (n) (setq n n)))
(list txtdxf)
	)
	
	
	
	
	
	
(mapcar  '(lambda (x) 
          (print (nth x x))
          ) 
(list txtdxf)
)

