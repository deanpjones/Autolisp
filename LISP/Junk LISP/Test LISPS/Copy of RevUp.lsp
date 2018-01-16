(defun C:RevUp (myfunc / ss1 en att)

(defun FINDREVBLK ()
(setq ss1 (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "TITLE_DRAWING_NO"))))
(if (/= 1 (sslength ss1)) (princ "/nThere is more than one "TITLE_DRAWING_NO" block in the drawing."))
(setq en (ssname ss1 0))
(setq endxf (entget en))

(setq count 0)
	(while (/= (cdr (assoc 0 attdxf)) "SEQEND")
(setq att (entnext en))
(ssname att 0)
	)



;***********************************************************************
;junk
	((= tagx "REVISION_NO_1") (setq revno (cons valx (list "myrevs"))))
((= tagx "REVISION_NO_2") (setq revno (cons valx revno)))
((= tagx "REVISION_NO_3") (setq revno (cons valx revno)))
((= tagx "REVISION_NO_4") (setq revno (cons valx revno)))
((= tagx "REVISION_NO_5") (setq revno (cons valx revno)))
;**********************************************************************************************
;**********************************************************************************************
;**********************************************************************************************
(defun C:DEF ()
(setq myfilter '((0 . "INSERT")(66 . 1)(2 . "TITLE_DRAWING_NO")))
;********************************
(defun MYBLK (myfilter /)
(ssname (ssget "X" myfilter) 0)
)
;********************************
(setq mydate "08.03.28" mydescr "ADDED CPC DRAWING NUMBER (NET# 10182681) (BY CPC)" myinit "DJ")
;********************************
(setq att1 (entnext (MYBLK myfilter))) ;ATTRIB TAG ENTITY
(setq att1dxf (entget att1)) ;ATTRIB TAG DXF

;-------------------------------------------------------------------
;Must set first ATTRIB info here.
(setq tag1 (cdr (assoc 2 att1dxf)))(setq val1 (cdr (assoc 1 att1dxf)))
(if (= tag1 "PLANT_NUMBER") (setq plantno val1))
;-------------------------------------------------------------------
;-------------------------------------------------------------------
	(while (/= (cdr (assoc 0 att1dxf)) "SEQEND")

;------------------------------------------------------
(setq att1 (entnext att1))(setq attxdxf (entget att1));scroll thru attribs.(NOTE THIS LINE MUST SAVE OVER ITSELF TO REACH THE NEXT ENTITY WHILE LOOPING)
(setq tagx (cdr (assoc 2 attxdxf)))(setq valx (cdr (assoc 1 attxdxf)));return tag and values.
;------------------------------------------------------

	(cond
((= tagx "DRAWING_NUMBER") (setq dwgno valx))
((= tagx "DRAWING_REVISION_NO") (setq dwgrevno valx))

((= tagx "REVISION_NO_1") (setq revno1 valx))
((= tagx "REVISION_NO_2") (setq revno2 valx))
((= tagx "REVISION_NO_3") (setq revno3 valx))
((= tagx "REVISION_NO_4") (setq revno4 valx))
((= tagx "REVISION_NO_5") (setq revno5 valx))

((= tagx "REVISION_DATE_1") (setq date1 valx))
((= tagx "REVISION_DATE_2") (setq date2 valx))
((= tagx "REVISION_DATE_3") (setq date3 valx))
((= tagx "REVISION_DATE_4") (setq date4 valx))
((= tagx "REVISION_DATE_5") (setq date5 valx))

((= tagx "REVISION_DESCRIPTION_1") (setq descr1 valx))
((= tagx "REVISION_DESCRIPTION_2") (setq descr2 valx))
((= tagx "REVISION_DESCRIPTION_3") (setq descr3 valx))
((= tagx "REVISION_DESCRIPTION_4") (setq descr4 valx))
((= tagx "REVISION_DESCRIPTION_5") (setq descr5 valx))

((= tagx "REVISED_BY_1") (setq init1 valx))
((= tagx "REVISED_BY_2") (setq init2 valx))
((= tagx "REVISED_BY_3") (setq init3 valx))
((= tagx "REVISED_BY_4") (setq init4 valx))
((= tagx "REVISED_BY_5") (setq init5 valx))

(T nil)
	);end COND.
;------------------------------------------------------
	);end WHILE.
;------------------------------------------------------
;------------------------------------------------------

(princ)
);end DEFUN.

