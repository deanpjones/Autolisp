

;;;Appends a note to a DIMENSION string by selection.
;;;Compliments of Dean Jones, Jan. 19, 2006.
;;;Revised Mar. 08, 2006 - 'TYP.' NOTE ADDITION


(defun C:dm (/ en dim dimdxf typ dimstring dimstring2 a b c d e f g h j userInput)

(setq a "<>" b " \\X" c "REF." d "F/F" e "F.D." f "FIELD DETER." g "TYP." h "A/R" j "P/L ROW")		;SYMBOLS TO BE APPENDED.

(setq userInput (strcase (getstring "(1 - <Default>)(2 - REF.)(3 - F/F)(4 - F.D.)(5 - FIELD DETER.)(6 - TYP.)(7 - A/R)(8 - P/L ROW) \nPick a NUMBER(#) for which note to add: ") T))

(setq dimstring2
	(cond
((wcmatch userInput "1") a)
((wcmatch userInput "2") (strcat a b c))
((wcmatch userInput "3") (strcat a b d))
((wcmatch userInput "4") e)
((wcmatch userInput "5") f)
((wcmatch userInput "6") (strcat a b g))
((wcmatch userInput "7") (strcat a b h))
((wcmatch userInput "8") (strcat a b j))
(T nil)
	)
)

			(while
(setq en (entsel "\n Select DIMENSION entity: "))			;select entity
(setq dim (car en))											;get entity name
(setq dimdxf (entget dim))									;get entity dxf properties
(setq typ (cdr (assoc 0 dimdxf)))							;get entity TYPE

	(if														;IF
(and dim (= "DIMENSION" typ))								;test statement to see if it's a DIMENSION.


	(progn													;THEN, if there is DIMENSION then continue.
(setq dimstring (cdr (assoc 1 dimdxf)))						;get DIMENSION STRING dxf property

(setq dimdxf (subst (cons 1 dimstring2) (assoc 1 dimdxf) dimdxf))	;**APPEND NOTE TO DIMENSION**

(entmod dimdxf)												;updates ENTITY dxf data
(entupd dim)												;updates SCREEN of update
	)

	(progn													;ELSE STATEMENT.
(princ "\n*** You are in another DIMENSION!!! ***")
	)
)
			)												;End of WHILE STATEMENT


(princ)
)

