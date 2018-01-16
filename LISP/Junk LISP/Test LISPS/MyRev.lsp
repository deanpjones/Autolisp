
(setq en (nentsel "\n Pick latest revision number: "))(setq txt (car en))(setq txtdxf (entget txt))
(setq revno (cdr (assoc 1 txtdxf)))			;Get REVISION NUMBER.
(setq revattno (cdr (assoc 2 txtdxf)))			;Get ATTRIBUTE NUMBER.
(setq revattno2 (atoi (vl-string-left-trim "REVISION_NO_" revattno)))
							
(cond
((wcmatch revno "@,@@") ifLETTERdothis)
((wcmatch revno "#,##") ifNUMBERdothis)
(T nil)
)

(find ATTRIB with name (strcat "REVISION_NO_" (itoa (1+ revattno2)))  )





(filterDXF "REV*")

(cond
((= enblkname "TITLE_DRAWING_NO") (thenADDNEXTREVISION))
((= enblkname "TB_Rev_block") (thenCOPYUPANDADDREVISION))
((= enblkname "PROJ_VER") (thenADDNEXTREVISION))
((= enblkname "CPC-REV") (thenADDNEXTREVISION))
(T (princ "\nThe revision cannot be added, please add it manually.")
)




(defun filterDXF (filter / ent en enlist enblkname blktype en2 enlist2 dxf1 dxf2)

(if (setq ent(entsel "\n Select a Block: "))          ;- Let the user select a block
(progn                                                    
  (setq en(car ent))                                  ;- Get the entity name of the block
  (setq enlist(entget en))                            ;- Get the DXF group codes
  (setq enblkname (cdr(assoc 2 enlist)))              ;- Get the Block Name
  (terpri)(princ (strcat "Block Name = " enblkname))(terpri)	      ;- Print the Block Name
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





