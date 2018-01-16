
(defun C:REVUPALL ()
;***************************************************************************************************************
;***************************************************************************************************************
;***************************************************************************************************************
;To automatically update the revision as specified below.
;Dean Jones Jun 10, 2008
;NEXTREV 08.03.28 ADDED CPC DRAWING NUMBER DJ
;**********************************************************************************************
;**********************************************************************************************
;**********************************************************************************************
(defun REVUP1 (/ myfilter mydate mydescr myinit att1 att1dxf tag1 val1 attxdxf tagx valx newrevno chknewrevno chkmydate chkmydescr chkmyinit)
(setq myfilter '((0 . "INSERT")(66 . 1)(2 . "TITLE_DRAWING_NO")))
;********************************
(defun MYBLK (myfilter /)
(ssname (ssget "X" myfilter) 0)
)
;**********************************************************************
(setq mydate "08.03.28" mydescr "ADDED CPC DRAWING NUMBER" myinit "DJ")
;**********************************************************************
(setq att1 (entnext (MYBLK myfilter)))(setq att1dxf (entget att1)) ;ATTRIB TAG DXF

;-------------------------------------------------------------------
;Must set first ATTRIB info here.
(setq tag1 (cdr (assoc 2 att1dxf)))(setq val1 (cdr (assoc 1 att1dxf)))
(if (= tag1 "PLANT_NUMBER") (setq plantno val1))
;-------------------------------------------------------------------
;-------------------------------------------------------------------
;------------------------------------------------------
(setq chknewrevno 0 chkmydate 0 chkmydescr 0 chkmyinit 0)
;------------------------------------------------------

	(while (/= (cdr (assoc 0 att1dxf)) "SEQEND")

;------------------------------------------------------
(setq att1 (entnext att1))(setq attxdxf (entget att1));scroll thru attribs.(NOTE THIS LINE MUST SAVE OVER ITSELF TO REACH THE NEXT ENTITY WHILE LOOPING)
(setq tagx (cdr (assoc 2 attxdxf)))(setq valx (cdr (assoc 1 attxdxf)));return tag and values.
;------------------------------------------------------

	(cond
		((= tagx "DRAWING_REVISION_NO")
	(progn
(setq newrevno (itoa (1+ (atoi valx))))
	(if (wcmatch valx "#*")
(entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))
(entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))
	);end IF.
	);end PROGN.
)


((and (= chknewrevno 0)(= tagx "REVISION_NO_1")(= valx "")) (progn (entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))(setq chknewrevno 1)))
((and (= chknewrevno 0)(= tagx "REVISION_NO_2")(= valx "")) (progn (entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))(setq chknewrevno 1)))
((and (= chknewrevno 0)(= tagx "REVISION_NO_3")(= valx "")) (progn (entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))(setq chknewrevno 1)))
((and (= chknewrevno 0)(= tagx "REVISION_NO_4")(= valx "")) (progn (entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))(setq chknewrevno 1)))
((and (= chknewrevno 0)(= tagx "REVISION_NO_5")(= valx "")) (progn (entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))(setq chknewrevno 1)))

((and (= chkmydate 0)(= tagx "REVISION_DATE_1")(= valx "")) (progn (entmod (subst (cons 1 mydate) (assoc 1 attxdxf) attxdxf))(setq chkmydate 1)))
((and (= chkmydate 0)(= tagx "REVISION_DATE_2")(= valx "")) (progn (entmod (subst (cons 1 mydate) (assoc 1 attxdxf) attxdxf))(setq chkmydate 1)))
((and (= chkmydate 0)(= tagx "REVISION_DATE_3")(= valx "")) (progn (entmod (subst (cons 1 mydate) (assoc 1 attxdxf) attxdxf))(setq chkmydate 1)))
((and (= chkmydate 0)(= tagx "REVISION_DATE_4")(= valx "")) (progn (entmod (subst (cons 1 mydate) (assoc 1 attxdxf) attxdxf))(setq chkmydate 1)))
((and (= chkmydate 0)(= tagx "REVISION_DATE_5")(= valx "")) (progn (entmod (subst (cons 1 mydate) (assoc 1 attxdxf) attxdxf))(setq chkmydate 1)))

((and (= chkmydescr 0)(= tagx "REVISION_DESCRIPTION_1")(= valx "")) (progn (entmod (subst (cons 1 mydescr) (assoc 1 attxdxf) attxdxf))(setq chkmydescr 1)))
((and (= chkmydescr 0)(= tagx "REVISION_DESCRIPTION_2")(= valx "")) (progn (entmod (subst (cons 1 mydescr) (assoc 1 attxdxf) attxdxf))(setq chkmydescr 1)))
((and (= chkmydescr 0)(= tagx "REVISION_DESCRIPTION_3")(= valx "")) (progn (entmod (subst (cons 1 mydescr) (assoc 1 attxdxf) attxdxf))(setq chkmydescr 1)))
((and (= chkmydescr 0)(= tagx "REVISION_DESCRIPTION_4")(= valx "")) (progn (entmod (subst (cons 1 mydescr) (assoc 1 attxdxf) attxdxf))(setq chkmydescr 1)))
((and (= chkmydescr 0)(= tagx "REVISION_DESCRIPTION_5")(= valx "")) (progn (entmod (subst (cons 1 mydescr) (assoc 1 attxdxf) attxdxf))(setq chkmydescr 1)))

((and (= chkmyinit 0)(= tagx "REVISED_BY_1")(= valx "")) (progn (entmod (subst (cons 1 myinit) (assoc 1 attxdxf) attxdxf))(setq chkmyinit 1)))
((and (= chkmyinit 0)(= tagx "REVISED_BY_2")(= valx "")) (progn (entmod (subst (cons 1 myinit) (assoc 1 attxdxf) attxdxf))(setq chkmyinit 1)))
((and (= chkmyinit 0)(= tagx "REVISED_BY_3")(= valx "")) (progn (entmod (subst (cons 1 myinit) (assoc 1 attxdxf) attxdxf))(setq chkmyinit 1)))
((and (= chkmyinit 0)(= tagx "REVISED_BY_4")(= valx "")) (progn (entmod (subst (cons 1 myinit) (assoc 1 attxdxf) attxdxf))(setq chkmyinit 1)))
((and (= chkmyinit 0)(= tagx "REVISED_BY_5")(= valx "")) (progn (entmod (subst (cons 1 myinit) (assoc 1 attxdxf) attxdxf))(setq chkmyinit 1)))

(T nil)
	);end COND.
;------------------------------------------------------
	);end WHILE.
;------------------------------------------------------
;------------------------------------------------------

(princ)
);end DEFUN.





;***************************************************************************************************************
;***************************************************************************************************************
;***************************************************************************************************************
;To automatically update the revision as specified below.
;Dean Jones Jun 11, 2008
;NEXTREV 08.03.28 ADDED CPC DRAWING NUMBER DJ

(defun REVUP2 ( / ss2 en enlist blkType en2 enlist2 tagx valx ss1 ss1len count x en endxf endxf10 enN endxfN endxf10N x1 y1 pt1 newrevno mydate mydescr myinit)

;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------
(defun DEF ()
(if (setq ss2 (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "Ortho-Titleblock"))))

(progn
  (setq en (ssname ss2 0))                   ;- Get the entity name of the block
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
(DEF)
;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------

(setq ss1 nil)
(setq ss1 (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "TB_Rev_block"))))
(setq ss1len (sslength ss1))

;---------------------------------------
(setq count (1- ss1len))
(setq x 0)
(while (/= count -1)

		(setq en (ssname ss1 count))
		(setq endxf (entget en))
		(setq endxf10 (assoc 10 endxf))

			(if (< x (caddr (assoc 10 endxf)));Compares Yval of blocks and saves that highest entity.
			(progn
		(setq enN en)
		(setq endxfN endxf)
		(setq endxf10N endxf10)
			);END PROGN.
			);END IF.

(setq count (1- count))
);END WHILE.

;---------------------------------------------------------------------
;---------------------------------------------------------------------
(setq x1 (cadr endxf10) y1 (+ 8 (caddr endxf10)))
(setq pt1 (list x1 y1))
;**********************************************************************
(setq mydate "08.03.28" mydescr "ADDED CPC DRAWING NUMBER" myinit "DJ")
;**********************************************************************

(command "-layer" "s" "0" "")
(command "-insert" "TB_Rev_block" pt1 "1" "" "0" newrevno mydate mydescr myinit "")
(command "regenall")
;---------------------------------------------------------------------
;---------------------------------------------------------------------

(princ)
);END DEFUN.

;***************************************************************************************************************
;***************************************************************************************************************
;***************************************************************************************************************
(if (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "Ortho-Titleblock"))) (REVUP2) (REVUP1))

);end DEFUN