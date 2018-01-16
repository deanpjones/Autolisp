
;;; This routine deletes all shapes in the drawing
;;; that do not have a file definition.
------------------------------------------------------------------------;


(defun c:delshape ()

	(setvar "CMDECHO" 0)
	(setq n 0
  		nshapes 0
  		delete 0
	)

	(setq shapes (ssget "X" '((0 . "SHAPE")))) ;shapes
	(setq shapes_name (ssget "X" (list (cons 0 "SHAPE") (cons 2 "*"))))
		(if (/= shapes nil)
		(setq nshapes (sslength shapes))
		) ; n. total de shapes

		(if (and (= shapes_name nil) (/= shapes nil))
  		(progn
			(while (< n nshapes)
			(setq entity (ssname shapes n))
			(entdel entity)
			(setq delete (+ 1 delete))
			(setq n (+ 1 n))
		)
		)
	)
	(while (and (< n nshapes) (/= shapes nil) (/= shapes_name nil))
	(setq entity (ssname shapes n))
	(if (or (= (ssmemb entity shapes_name) nil))
	(progn
	(entdel entity)
	(setq delete (+ 1 delete))
	)
	)
	(setq n (+ 1 n))   )
	(prin1 delete)
	(princ " shape(s) deleted\n")
	(command "_purge" "_sh" "" "_n")
)