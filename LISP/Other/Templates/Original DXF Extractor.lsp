;;;Original DXF Extractor of attributes from a block.

'***********************************************************************************************
'***********************************************************************************************

(defun origDXF ( / ent en enlist blktype en2 enlist2 )

(if (setq ent(entsel "\n Select a Block: ")) ;- Let the user select a block
(progn                                                    
  (setq en(car ent))                         ;- Get the entity name of the block
  (setq enlist(entget en))                   ;- Get the DXF group codes
  (setq blkType(cdr(assoc 0 enlist)))        ;- Save the type of entity

  (if (= blkType "INSERT")                   ;- If the entity type is an Insert entity
   (progn

    (if(= (cdr(assoc 66 enlist)) 1)          ;- See if the attribute flag equals one (if so, attributes follow)
    (progn
      (setq en2(entnext en))                 ;- Get the next sub-entity
      (setq enlist2(entget en2))             ;- Get the DXF group codes

      (while (/= (cdr(assoc 0 enlist2)) "SEQEND")  	    ;- Start the while loop and keep,looping until SEQEND is found.
        (princ "\n ")                                   ;-Print a new line
        (princ enlist2)                                 ;- Print the attribute DXF group codes
        (setq en2(entnext en2))                         ;- Get the next sub-entity
        (setq enlist2(entget en2))                      ;- Get the DXF group codes

      );end while.
     );end progn.
    );end if (66 . 1)
   );end progn.
  );end if (= blkType "INSERT")
);end progn.

)   ;- Close the if an Entity is selected statement

)
'***********************************************************************************************
'***********************************************************************************************




