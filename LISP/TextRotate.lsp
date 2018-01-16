;;;Rotate TEXT string by selection.
;;;Compliments of Dean Jones, Oct. 12, 2005.
;;;Revision Mar. 23, 2006

(defun C:tr (/ en txt txtdxf typ rotinc rot)

	(while
(setq en (entsel "\n Select text entity: "))					;select entity
(setq txt (car en))												;get entity name
(setq txtdxf (entget txt))										;get entity dxf properties
(setq typ (cdr (assoc 0 txtdxf)))								;get entity TYPE

(if																;IF
(= "TEXT" typ)													;test for TEXT in it.
(progn
;--------------------------------------------
(setq rotinc (/ PI 2))											;set TEXT ROTATION.
(setq rot (cdr (assoc 50 txtdxf)))
	(cond														;COND find rotation and ADD 0.5PI
((and (>= rot 0) (< rot (* PI 1.5))) (setq rot (+ rot rotinc)))
((and (>= rot (* PI 1.5)) (< rot (* PI 2))) (setq rot (- (+ rot rotinc) (* PI 2))))
(T nil)
	)		

(setq txtdxf (subst (cons 50 rot) (assoc 50 txtdxf) txtdxf))	;**rotates TEXT in 90 degree increments.
;--------------------------------------------
)
			
(princ "\n*** THIS IS TOO HEAVY TO TURN!!! ***")				;ELSE, print statement.
)																;END IF		

(entmod txtdxf)													;updates ENTITY dxf data
(entupd txt)													;updates SCREEN of update
(princ "\n*** TEXT ROTATED!!! ***")
	)

(princ)
)

