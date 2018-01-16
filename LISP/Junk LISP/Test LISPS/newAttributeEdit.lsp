

(if (setq blk (entsel "\n Select a Block: "))	;- Let the user select a block

(progn                                                    

  (setq blknme1 (car blk1))			;- Get the entity name of the block

  (setq blkdxf1 (entget blknme1))			;- Get the DXF group codes

  (setq blktype1 (cdr (assoc 0 blkdxf1)))		;- Save the type of entity

  (if (= blktype1 "INSERT")			;- If the entity type is an Insert entity

   (progn

    (if (= (cdr (assoc 66 blkdxf1)) 1)		;- See if the attribute flag equals one (if so, attributes follow)

    (progn

      	(setq att1 (entnext blk1))		;- Get the next sub-entity

      	(setq attdxf1 (entget att1))		;- Get the DXF group codes

        (princ "\n ")				;- Print a new line
 
        (princ (assoc 1 attdxf1))		;- Print the attribute DXF group codes

     )

    )  ;- Close the if group code 66 = 1 statement

   )

  )   ;- Close the if block type = "ATTRIB" statement

)

)   ;- Close the if an Entity is selected statement




