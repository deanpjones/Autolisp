(defun DEF ()
(if (setq ss1 (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "Ortho-Titleblock"))))

(progn
  (setq en (ssname ss1 0))                   ;- Get the entity name of the block
  (setq enlist(entget en))                   ;- Get the DXF group codes
  (setq blkType(cdr(assoc 0 enlist)))        ;- Save the type of entity

  (if (= blkType "INSERT")                   ;- If the entity type is an Insert entity
   (progn

    (if(= (cdr(assoc 66 enlist)) 1)          ;- See if the attribute flag equals one (if so, attributes follow)
    (progn
      (setq en2(entnext en))                 ;- Get the next sub-entity
      (setq enlist2(entget en2))             ;- Get the DXF group codes

      (while (/= (cdr(assoc 0 enlist2)) "SEQEND")  	    ;- Start the while loop and keep,looping until SEQEND is found.
        (setq en2(entnext en2))                         ;- Get the next sub-entity
        (setq enlist2(entget en2))                      ;- Get the DXF group codes
        (setq tagx (cdr (assoc 2 enlist2)))
        (setq valx (cdr (assoc 1 enlist2)))
;------------------------------------------------------
	(cond
		((= tagx "DWG_REV_NO")
	(progn
(setq newrevno (itoa (1+ (atoi valx))))
	(if (wcmatch valx "#*")
(entmod (subst (cons 1 newrevno) (assoc 1 enlist2) enlist2))
(entmod (subst (cons 1 newrevno) (assoc 1 enlist2) enlist2))
	);end IF.
	(princ "/n it worked")
	);end PROGN.
		)
(T nil)
	);end COND.
;------------------------------------------------------

      );end while.
     );end progn.
    );end if (66 . 1)
   );end progn.
  );end if (= blkType "INSERT")
);end progn.

)   ;- Close the if an Entity is selected statement
);END DEFUN.