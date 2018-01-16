;;;1. select a block
;;;2. extract xdata
;;;3. modify xdata from location

;;;4. by selecting multiple blocks


;;;Attribute editor.
;;;Compliments of Dean Jones, Dec.24, 2004.


  
(defun C:ATTDXF (/ blk blknme blkdxf blktype att attnme attdxf)
  
	(if (setq blk (entsel "\n Select a Block: ")) 			;Prompts user to select the BLOCK.
		(progn                                                    
  		(setq blknme (car blk))                         	;Gets the BLOCK NAME.
  		(setq blkdxf (entget blknme))                          	;Gets the BLOCK DXF group codes.

  		(setq blktype (cdr (assoc 0 blkdxf)))                 	;Gets the BLOCK TYPE.
  	(if (= blktype "INSERT")                               		;IF the BLOCK TYPE is an "INSERT" entity THEN...
   	(progn
		(if (= (cdr (assoc 66 blkdxf)) 1)    			;IF the ATTRIBUTE FLAG = 1 (ATTRIBUTES EXIST).
    		(progn
			(setq att (entnext blk))			;Get the next SUB ENTITY.
      			(setq attnme (car att))                     	;Get the ATTRIBUTE NAME.
      			(setq attdxf (entget attnme))                	;Get the ATTRIBUTE DXF group codes.

      	(while (/= (cdr (assoc 0 attdxf)) "SEQEND")  			;Start the WHILE LOOP until it finds "SEQEND" (SEQEND is last sub entity).                                                                                                                   ;-  looping until SEQEND is found.
	
	(princ "\n ")                                          		;Print a new line.
        (princ attdxf)                                  		;Print the ATTRIBUTE DXF group codes.

        (setq attnme (entnext attnme))                  		;Get the next SUB ENTITY.
        (setq attdxf (entget attnme))                      		;Get the ATTRIBUTE DXF group codes.

      	)
     	)
    	)  								;Close the IF GROUP CODE 66 = 1 statement.
   	)
  	)   								;Close the WHILE BLOCK TYPE = "ATTRIB" LOOP.
	)
	)   								;Close the IF a BLOCK is selected statement.

	
      

)		     
			    