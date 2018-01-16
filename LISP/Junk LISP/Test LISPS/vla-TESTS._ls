
(defun OBJPROP ( / )
(vlax-for for-item 
   (vla-get-modelspace
        (vla-get-activedocument (vlax-get-acad-object))
   )
  (vlax-dump-object for-item)        ; list object properties
)
)


;Draw a Circle.
RetVal = object.AddCircle(Center, Radius) 
(setq myCircle (vla-addCircle mSpace (vlax-3d-point '(3.0 3.0 0.0)) 2.0))

;Draw a Circle.
object.SysVarChanged(SysVarName, NewVal)
?????(setq mySysVar (vla-SysVarChanged APP ("ltscale" 33)))

;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
;DRAW A LINE.
;function using lisp for VLA-functions (needs pt1 pt2 arguments)
(defun addLine (pt1 pt2 / acadApp activeDoc mSpace)
  (setq acadApp (vlax-get-acad-object))
  (setq activeDoc  (vla-get-activeDocument acadApp))
  (setq mSpace  (vla-get-modelSpace activeDoc))
  (vla-addLine mSpace pt1 pt2)
)

(setq pt1 (vlax-3d-point (getpoint)))		;Sets point1 in ActiveX format.
(setq pt2 (vlax-3d-point (getpoint)))		;Sets point2 in ActiveX format.

(addLine pt1 pt2)     ;To draw a line.

;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
;DRAWS A CIRCLE.
;DRAWS A CIRCLE INSIDE THE PREVIOUS CIRCLE.

(setq acadApp (vlax-get-acad-object))
(setq activeDoc  (vla-get-activeDocument acadApp))
(setq mSpace  (vla-get-modelSpace activeDoc))


(setq myCircle (vla-addcircle mSpace (vlax-3d-point 
  (getpoint "\nPick the center point for a circle: ")) 2.0))
  
  (vla-addCircle mSpace (vla-get-center myCircle) 1.0)
  
;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************

(setq myCenter (vla-get-center myCircle)) 		;get center of previous circle.

(setq centerpt (vlax-safearray->list 			;make a list for center.
  (vlax-variant-value myCenter)))
  
  (setq newXaxis (- (car centerpt) 1)) 			;modify X coordinate.
  
  (setq newcenter (list newXaxis  (cadr centerpt) (caddr centerpt)))	;make new list for center.
  
  (vla-put-center myCircle (vlax-3d-point newcenter)) ;CHANGE CENTER OF CIRCLE.
  
;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
(vla-put-color myCircle acRed)  ;change object to RED.


;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
;my attempt at using VLA- to insert a block.

RetVal = object.InsertBlock(InsertionPoint, Name, Xscale, Yscale, ZScale, Rotation [, Password])

(setq acadApp (vlax-get-acad-object))
(setq activeDoc  (vla-get-activeDocument acadApp))
(setq mSpace  (vla-get-modelSpace activeDoc))

(setq inspt (vlax-3d-point (getpoint)))

(setq inspt (vlax-safearray->list (vlax-variant-value inspt)))

(setq inspt (vla-get-InsertionPoint (vlax-3d-point (getpoint))))

(setq blkname "C:/_Blocks/700 - ISO'S/SMART BALLOONS.dwg")

(setq myblock (vla-InsertBlock mSpace inspt blkname 1.0 1.0 1.0 0.0))

;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************
(defun ACTIVEDOC ( / acadApp activeDoc mSpace)
(vl-load-com)
(setq acadApp (vlax-get-acad-object))
(setq activeDoc  (vla-get-activeDocument acadApp))
(setq mSpace  (vla-get-modelSpace activeDoc))
)
;;;****************************************************************************
;;;****************************************************************************
;;;****************************************************************************