;To automatically update the revision as specified below.
;Dean Jones Jun 10, 2008
;NEXTREV 08.03.28 ADDED CPC DRAWING NUMBER DJ
;**********************************************************************************************
;**********************************************************************************************
;**********************************************************************************************
(defun C:REVUP (/ myfilter mydate mydescr myinit att1 att1dxf tag1 val1 attxdxf tagx valx newrevno chknewrevno chkmydate chkmydescr chkmyinit)
(setq myfilter '((0 . "INSERT")(66 . 1)(2 . "TITLE_DRAWING_NO")))
;********************************
(defun MYBLK (myfilter /)
(ssname (ssget "X" myfilter) 0)
)
;**********************************************************************
(setq mydate "06.06.24" mydescr "ADDED CPC DRAWING NUMBER" myinit "DJ")
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
(command "regenall")
(princ)
);end DEFUN.
