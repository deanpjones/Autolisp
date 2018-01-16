(defun C:DEF ( / myfilter att1 att1dxf tag1 val1 attxdxf tagx valx ss1 ss1len count x en endxf endxf10 enN endxfN endxf10N x1 y1 pt1 newrevno mydate mydescr myinit)

;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------
(setq myfilter '((0 . "INSERT")(66 . 1)(2 . "Ortho-Titleblock")))
;********************************
(defun MYBLK (myfilter /)
(ssname (ssget "X" myfilter) 0)
)
;-------------------------------------------------------------------
(setq att1 (entnext (MYBLK myfilter)))(setq att1dxf (entget att1)) ;ATTRIB TAG DXF
(setq tag1 (cdr (assoc 2 att1dxf)))(setq val1 (cdr (assoc 1 att1dxf)))
;-------------------------------------------------------------------
;------------------------------------------------------

(while (and (/= (cdr (assoc 0 att1dxf)) "SEQEND")(= (cdr (assoc 0 att1dxf)) "ATTRIB"))

;------------------------------------------------------
(setq att1 (entnext att1))(setq attxdxf (entget att1));scroll thru attribs.(NOTE THIS LINE MUST SAVE OVER ITSELF TO REACH THE NEXT ENTITY WHILE LOOPING)
(setq tagx (cdr (assoc 2 attxdxf)))(setq valx (cdr (assoc 1 attxdxf)));return tag and values.
;------------------------------------------------------
	(cond
		((= tagx "DWG_REV_NO")
	(progn
(setq newrevno (itoa (1+ (atoi valx))))
	(if (wcmatch valx "#*")
(entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))
(entmod (subst (cons 1 newrevno) (assoc 1 attxdxf) attxdxf))
	);end IF.
	);end PROGN.
		)
(T nil)
	);end COND.
;------------------------------------------------------
	);end WHILE.

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
(setq newrevno "33" mydate "08.03.28" mydescr "ADDED CPC DRAWING NUMBER" myinit "DJ")
;**********************************************************************

(command "-layer" "s" "0" "")
(command "-insert" "TB_Rev_block" pt1 "1" "" "0" newrevno mydate mydescr myinit "")
(command "regenall")
;---------------------------------------------------------------------
;---------------------------------------------------------------------

(princ)
);END DEFUN.
