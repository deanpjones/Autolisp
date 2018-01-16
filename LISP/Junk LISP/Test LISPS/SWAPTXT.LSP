;SWAPTXT - Quickly swaps two text entities.
;
;Jeffery P Sanders
;
(defun C:SWT(/ ht eset enlist len)
  (princ "\n ")(princ "\n ")
  (princ "\nSelect Both Text Entities: ")
  (setq eset(ssget))
  (if (and (/= eset nil)(> (sslength eset) 1))
   (progn
    (setq en1(ssname eset 0))
    (setq enlist1(entget en1))
    (setq en2(ssname eset 1))
    (setq enlist2(entget en2))
    (princ "\n ") (princ "\n ")
    (princ "\n...Please Wait....Exchanging Text...")
    (setq txt1(cdr (assoc 1 enlist1)))
    (setq txt2(cdr (assoc 1 enlist2)))
    (setq enlist1 (subst
		    (cons 1 txt2)
		    (assoc 1 enlist1)
		    enlist1
		  )
    )
    (entmod enlist1)
    (setq enlist2 (subst
		    (cons 1 txt1)
		    (assoc 1 enlist2)
		    enlist2
		   )
    )
    (entmod enlist2)
   )
   (princ "\nNothing Selected")
  )
  (princ "\n ....SWapTxt Complete.")(princ "\n ")
  (princ)
)
