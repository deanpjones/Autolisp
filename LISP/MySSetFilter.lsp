;Selection Set Filter for specific attribute data in ProCAD.
;Creates a selection set, and the user is to edit the data from AutoCAD's properties dialog.
;Dean Jones, Jan.17, 2008.
;********************************************************************************
;********************************************************************************
;********************************************************************************
(defun C:mySSfilter ( / userIn1 userAns1 userAns2 i a filter blk blkdxf att attdxf ss1 ss2)
(setq blk nil blkdxf nil att nil attdxf nil ss1 nil ss2 nil)

(setq userIn1 (strcase (getstring "(1 - BOM#)(2 - Pipe Size)(3 - Spec)(4 - Rating)(5 - Line#)(6 - Desc.#1)(7 - Desc.#2)(8 - Desc.#3)(9 - S/F)(10 - ValveTag)(11 - DwgNo) \nEnter a FIELD(#) to filter your selection by: ") T))

(setq userAns1
	(cond
((wcmatch userIn1 "1") "BOM_NO")
((wcmatch userIn1 "2") "SIZ_STRNG")
((wcmatch userIn1 "3") "SPEC")
((wcmatch userIn1 "4") "PIP_RTG")
((wcmatch userIn1 "5") "LIN_NUM")
((wcmatch userIn1 "6") "DESC_1")
((wcmatch userIn1 "7") "DESC_2")
((wcmatch userIn1 "8") "DESC_3")
((wcmatch userIn1 "9") "S_F")
((wcmatch userIn1 "10") "VAL_TAG")
((wcmatch userIn1 "11") "DWG_NUM")
(T nil)
	)
)

(setq userAns2 (getstring T "\nEnter a VALUE to filter your selection by: "))
(princ (strcat "\nYour filter is: " userAns1 " = " userAns2))

(setq filter (list (cons 2 userAns1)(cons 1 userAns2)))

(setq ss1 (ssget))
(setq ss2 (ssadd))

(setq i 0)
	;--------------------------------------------------------------------
	(repeat (sslength ss1)

  (setq blk (ssname ss1 i))                             ;BLOCK ENTITY NAME.
  (setq blkdxf (entget blk))                            ;BLOCK DXF CODES.
  (setq blkType (cdr (assoc 0 blkdxf)))                 ;TYPE OF ENTITY.

  	;----------------------------------------------------------
  (if (= blkType "INSERT")
    (progn
    (if (= (cdr (assoc 66 blkdxf)) 1)                  	;TEST IF BLOCK HAS ATTRIBUTES.
    (progn
      (setq att (entnext blk))                          ;NEXT ATTRIB ENTITY NAME.
      (setq attdxf (entget att))       	               	;ATTRIB DXF codes.

		;------------------------------------------
		(while (/= (cdr (assoc 0 attdxf)) "SEQEND")		;- Start the while loop and keep looping until SEQEND is found.
		(progn
		;------------------------
		(setq a 0)
		(foreach n filter
			(if (member n attdxf)
			(setq a (1+ a))
			)
		)
		;------------------------
		(if (= a (length filter))
		(ssadd blk ss2)
		)
		;------------------------
		(setq att (entnext att))
		(setq attdxf (entget att))
		)
		)
		;------------------------------------------
	)
	)
	)
  )
	;----------------------------------------------------------
(setq i (1+ i))
	)
	;--------------------------------------------------------------------

(if (/= (sslength ss2) 0)
		(progn
	(sssetfirst nil ss2)
	(if (= (getvar "OPMSTATE") 0)		;If properties dialog is closed open it.
	(command "_properties")
	)
		)
	(princ (strcat "\nYour filter (" userAns1 " = " userAns2 ") did not return a selection."))
)

  (princ)
)
;********************************************************************************
;********************************************************************************
;********************************************************************************


