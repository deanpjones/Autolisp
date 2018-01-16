;;;Filters DXF codes using (2 . xxx) <-- attribute name as the filter.
;;;Compliments of Dean Jones, Apr. 04, 2007. 

'***********************************************************************************************
'***********************************************************************************************
;Enter a string ("xxxx") to execute the filter for the selection.
(defun filterDXF (filter / ent en enlist blktype en2 enlist2 dxf1 dxf2)

(if (setq ent(entsel "\n Select a Block: "))          ;- Let the user select a block
(progn                                                    
  (setq en(car ent))                                  ;- Get the entity name of the block
  (setq enlist(entget en))                            ;- Get the DXF group codes
  (setq blkType(cdr(assoc 0 enlist)))                 ;- Save the type of entity
  (if (= blkType "INSERT")                            ;- If the entity type is an Insert entity
   (progn
    (if(= (cdr(assoc 66 enlist)) 1)                   ;- See if the attribute flag equals one (if so, attributes follow)
    (progn
      (setq en2(entnext en))                          ;- Get the next sub-entity
      (setq enlist2(entget en2))                      ;- Get the DXF group codes
      (while (/= (cdr(assoc 0 enlist2)) "SEQEND")     ;- Start the while loop and keep    ;-  looping until SEQEND is found.

'***********************************************************************************************
	(if (wcmatch (cdr (assoc 2 enlist2)) filter)  ;filters for the (2 . xxxx) code.
        	(progn
	(terpri)                                      ;- Print a new line
        (setq dxf2 (assoc 2 enlist2))                 ;- Print the attribute DXF group codes
	(setq dxf1 (assoc 1 enlist2))		      ;- Print the attribute DXF group codes
	(princ (strcat (cdr dxf2) " = " (cdr dxf1)))
	(terpri)
		)
	)
'***********************************************************************************************

        (setq en2(entnext en2))                       ;- Get the next sub-entity
        (setq enlist2(entget en2))                    ;- Get the DXF group codes
      )
     )
    )  ;- Close the if group code 66 = 1 statement
   )
  )   ;- Close the if block type = "ATTRIB" statement
)
)

)
'***********************************************************************************************
'***********************************************************************************************




