;**********************************************************************************
;**********************************************************************************
;Gets the points for the line.
(defun SUB-LINE1 ( en lindxf / userpt dxf10 dxf11)
(setq userpt (cadr en))										;get the USER PICK POINT.
(setq dxf10 (cdr (assoc 10 lindxf)))						;get LINE PT1.
(setq dxf11 (cdr (assoc 11 lindxf)))						;get LINE PT2.
)
;**********************************************************************************
;Calculate XYZ of each POINT.	
(defun SUB-LINE2 (userpt dxf10 dxf11 / xUser yUser zUser x10 y10 z10 x11 y11 z11)
(setq xUser (car userpt))
(setq yUser (cadr userpt))
(setq zUser (caddr userpt))
(setq x10 (car dxf10))
(setq y10 (cadr dxf10))
(setq z10 (caddr dxf10))
(setq x11 (car dxf11))
(setq y11 (cadr dxf11))
(setq z11 (caddr dxf11))
)
;**********************************************************************************
;Calculate which point is closest to the user.
(defun USERLINE ( / )
	(cond


(x10 - x11)
(y10 - y11)
)
;**********************************************************************************
(defun LENGTH-LINE ( / en lin lindxf typ )

(setq en (nentsel "\n Select text entity: "))				;select entity
(setq lin (car en))											;get entity name
(setq lindxf (entget lin))									;get entity dxf properties
(setq typ (cdr (assoc 0 lindxf)))							;get entity TYPE

(if
(= "LINE" typ)												;test statement to see if it's a LINE.
	(progn
(get firstpick)
(get dxf10) (get dxf11)
(calc line)
	

)
;**********************************************************************************
;**********************************************************************************