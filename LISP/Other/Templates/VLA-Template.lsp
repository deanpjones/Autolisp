

;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
;Function to more easily add VLA commands.

(defun VLA-TEMPLATE ( vla-arg1 / acadApp activeDoc mSpace myfunction )

(vl-load-com)
(setq acadApp (vlax-get-acad-object))
(setq activeDoc  (vla-get-activeDocument acadApp))
(setq mSpace  (vla-get-modelSpace activeDoc))
(vla-arg1)															;VLA Function to execute.

)

;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
;EXAMPLE FUNCTION for drawing a line.
(defun ADDLINE ( / pt1 pt2 )

(setq pt1 (vlax-3d-point (getpoint "\nPick a point:  ")))			;Sets point1 in ActiveX format.
(setq pt2 (vlax-3d-point (getpoint "\nPick a point:  ")))			;Sets point2 in ActiveX format.
(vla-addLine mSpace pt1 pt2)										;Draws a line from pt1 to pt2.

)

;TO EXECUTE TWO FUNCTIONS TOGETHER.
(defun C:DEF ( / )
(VLA-TEMPLATE (ADDLINE))
)

