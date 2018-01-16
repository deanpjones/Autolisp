;Insert Stamp and Permit block with user input.
;Courtesy of Dean Jones, Jun 26, 2008.

(defun C:BeaverStamp ( / c d e f g h stampList userInput blkPath stampName stampPath pt1)

;a "AB-KEVIN WILFING" b "AB-MUHAMMAD IRFAN"
(setq c "AB-ANDJELKO GIGOVIC" d "AB-SAMEER LALLY" e "AB-ANTON HUYNH" f "AB-BERT J. JONES" g "AB-DUANE P. ROLLHEISER" h "AB-GREG WELLAND")		;Stamps to be used.
(setq stampList (list c d e f g h))
(setq revStampList (reverse (list c d e f g h)))

(terpri)

(foreach n stampList (progn (princ (strcat (itoa (length (member n revStampList))) " - " n))(princ)(terpri)))
(setq userInput (strcase (getstring "\nType a NUMBER(#) for which beaver stamp to use: ") T))

(setq blkPath "S:\\BR-S\\gsGRP\\GROUP\\ENGCAD\\00.000 CAD Management\\700\\702 Blocks\\P.Eng Stamps\\")
(setq stampName
	(cond
((wcmatch userInput "1") c)
((wcmatch userInput "2") d)
((wcmatch userInput "3") e)
((wcmatch userInput "4") f)
((wcmatch userInput "5") g)
((wcmatch userInput "6") h)
(T nil)
	)
)
(setq stampPath (strcat blkPath stampName ".dwg"))

(setq pt1 (getpoint "Select Beaver Stamp Location: "))
(command "-insert" stampPath pt1 "1" "" "0")

(alert (strcat "Please insure that you DELETE AND PURGE *** " stampName " *** from the drawing when you are finished."))
(princ)
)

