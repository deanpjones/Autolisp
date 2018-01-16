
;Maximize windows on open.
;Courtesy of Dean Jones, June 23, 2006.


;ThisDrawing.Application.WindowState = acMax

(defun winMax ( / acadApp activeDoc winMaximize)
(setq acadApp (vlax-get-acad-object))			
(setq activeDoc  (vla-get-activeDocument acadApp))

(setq winMaximize (vla-put-WindowState activeDoc acMax))

(princ)
)

(winMax)