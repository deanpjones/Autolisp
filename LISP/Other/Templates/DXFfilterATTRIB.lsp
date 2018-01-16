;;;Filters DXF codes using (2 . xxx) <-- attribute name as the filter.
;;;Compliments of Dean Jones, Apr. 04, 2007.

'***********************************************************************************************
'***********************************************************************************************
;Enter a string ("xxxx") to execute the filter for the selection.
(defun DXFfilterATTRIB ( / ent en enlist blktype en2 enlist2 )

(setq myEN nil)								 ;- Reset global variable to NIL.

(if (setq ent(entsel "\n Select a Block: ")) ;- Let the user select a block
(progn
  (setq en(car ent))                         ;- Get the entity name of the block
  (setq enlist(entget en))                   ;- Get the DXF group codes
  (setq blkType(cdr(assoc 0 enlist)))        ;- Save the type of entity
  (setq myEN (cons (cons en ()) ()))		 ;- Create an entity list.(THE BLOCK)

  (if (= blkType "INSERT")                   ;- If the entity type is an Insert entity
   (progn

    (if(= (cdr(assoc 66 enlist)) 1)          ;- See if the attribute flag equals one (if so, attributes follow)
    (progn
      (setq en2(entnext en))                 ;- Get the next sub-entity
      (setq myEN (cons (cons en2 ()) myEN))  ;- Create an entity list.
      (setq enlist2(entget en2))             ;- Get the DXF group codes

      (while (/= (cdr(assoc 0 enlist2)) "SEQEND")  	    ;- Start the while loop and keep,looping until SEQEND is found.
        (setq en2(entnext en2))                         ;- Get the next sub-entity
        (setq myEN (cons (cons en2 ()) myEN))  		    ;- Create an entity list.
        (setq enlist2(entget en2))                      ;- Get the DXF group codes

      );end while.
     );end progn.
    );end if (66 . 1)
   );end progn.
  );end if (= blkType "INSERT")
);end progn.

)   ;- Close the if an Entity is selected statement

(terpri)
(princ myEN)
(princ)

)
'***********************************************************************************************
'***********************************************************************************************

;;;Lists the specified attribute (NUM) with the number of entities and the block name.
(defun getATT ( num / blkdxf )
(princ (strcat "\n" "The block *" (cdr(assoc 2 (entget (car (last myEN))))) "* has " (itoa (length myEN)) " entities in it."))
(terpri)
(setq blkdxf (entget (car (nth (1- num) myEN))))
(foreach n blkdxf (princ n) (terpri))
(princ)
)

;;;***********************************************************************************************
;;;***********************************************************************************************
;;;????????????????????????????????????????????????????????????????????????????????????????????
;;;Needs work for the print output.
;;;Lists ALL the attributes within the block.
(defun getATTall ( / xlist blkdxf )
(princ (strcat "\n" "The block *" (cdr(assoc 2 (entget (car (last myEN))))) "* has " (itoa (length myEN)) " entities in it."))
(terpri)
(setq xlist (dpj-counter1 (length myEN) 1))
;;(setq blkdxf (foreach n xlist (princ (entget (car (nth (1- n) myEN)))) (terpri))

;;(setq blkdxf (foreach n xlist (entget (car (nth (1- n) myEN)))))
;;(foreach n blkdxf (princ n) (terpri))

(setq blkdxf (mapcar '(lambda (x) (entget (car x))) myEN ))
(foreach n blkdxf (terpri) (princ n) (terpri))
(princ)
)
;;;**********************************************************************************************

(while (/= n 0) (1- (length myEN)))

(mapcar '(lambda (x) (1- x)) '(10 20 30))

(nth n lst)
(foreach n myEN (princ (vl-position n myEN))(princ))
(foreach n myEN (cons (vl-position n myEN) n))

(foreach n myEN (princ (cons (1+ (vl-position n myEN)) n))(princ))
(foreach n myEN (princ (car (cons (1+ (vl-position n myEN)) n)))(princ))

(DPJ-COUNTER1 (LENGTH MYEN) 1)