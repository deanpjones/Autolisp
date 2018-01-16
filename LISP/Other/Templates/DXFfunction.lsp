;CUSTOM FUNCTION that takes MULTIPLE SELECTIONS and applies a function to a LIST (see SScounterList.lsp).
;and gives each ENTITY A CUSTOM NAME
;and gets a SPECIFIC DXF CODE.
;Dean Jones, April 26, 2006.




;(mapcar '(lambda (x) (setvarname (setvalue)) list))		;Use COUNTER LIST to get DXF CODES for each entity.
;VARNAME should be a STRING for a prefix used for a symbol name.
;SS1 is the SELECTION SET to be passed to the function.
;dxfNO is the DXF CODE number to be extracted.
;LIST to be passed to

(defun MyDXFeXtractor ( varname ss1 dxfNO mylist / endxf cusdxf )
(mapcar '(lambda (x)
(set (read (strcat varname (itoa x)))							;Set CUSTOM VARIABLE NAME.
	(progn
(setq endxf (entget (ssname ss1 x)))							;Get DXF CODES for each entity.
(setq cusdxf (cdr (assoc dxfNO endxf)))							;Set DXF CODE number to extract.
	)
)) mylist)
)

;To PASS FUNCTION
;(MyDXFeXtractor varname ss1 dxfNO list)
;eg.(MyDXFeXtractor "myvar" ss1 8 '(0))