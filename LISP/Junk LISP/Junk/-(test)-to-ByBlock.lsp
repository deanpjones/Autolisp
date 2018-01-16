(defun C:CH_BLOCK_TO_BYBLOCK ()

(vl-load-com)

;;; (vlax-for CCD:EA_BLOCK (vla-get-Blocks *ACAD_DOCUMENT*)



;;; sort through all the blocks in the drawing. 

(vlax-for CCD:EA_BLOCK (vla-get-Blocks (vla-get-activedocument (vlax-get-acad-object)))

(vlax-for CCD:EA_BLOCK_OBJ CCD:EA_BLOCK

(if

(/= (vla-get-color CCD:EA_BLOCK_OBJ) acByBlock)

(progn

(cond

((and

(/= (vla-get-objectname CCD:EA_BLOCK_OBJ) "AcDbAttributeDefinition")

(/= (vla-get-objectname CCD:EA_BLOCK_OBJ) "AcDbBlockReference")

);_end and

;;; covert all object in the block to byblock

(_CCD:SET_TO_BYBLOCK))



;;; if it is a block then set it to bylayer

;;; right now there is no double check for block inside of a block

((= (vla-get-objectname CCD:EA_BLOCK_OBJ) "AcDbBlockReference")(_CCD:SET_TO_BYLAYER))

;;; run another routine to change attribute color

((= (vla-get-objectname CCD:EA_BLOCK_OBJ) "AcDbAttributeDefinition")(_CCD:SET_ATT_BYBLOCK))



);_end cond

);_end progn

);_end if

);_end vlax-for

);_end vlax-for

);_end defun



(defun _CCD:SET_TO_BYLAYER ()

(vla-put-color CCD:EA_BLOCK_OBJ acByLayer)

);_end defun



(defun _CCD:SET_TO_BYBLOCK ()

(vla-put-layer CCD:EA_BLOCK_OBJ "0")

(vla-put-color CCD:EA_BLOCK_OBJ acByBlock)

);_end defun



(defun _CCD:SET_ATT_BYBLOCK ()

(alert "this is an attribute that needs to have the color changed to ByBlock")

(vlax-dump-object CCD:EA_BLOCK_OBJ)

;;; put attribute on layer 0

(vla-put-layer CCD:EA_BLOCK_OBJ "0")

;;; Apply the byblock color to the attributes. 

(setq CCD:COLOR_INTERFACE_OBJ (vla-GetInterfaceObject (vlax-get-acad-object) "AutoCAD.AcCmColor.17"))

(setq CCD:COLOR_METHOD (vla-get-colormethod CCD:COLOR_INTERFACE_OBJ))

(setq CCD:COLOR_INDEX (vla-get-colorindex CCD:COLOR_INTERFACE_OBJ))

(setq CCD:COLOR_LIST (cons CCD:COLOR_METHOD CCD:COLOR_INDEX))



;;; I want the attribute object to be set to byblock

;;; I don't understand why I can't put the true color. I do not know what to put here.

(vla-put-truecolor CCD:EA_BLOCK_OBJ "?")

(vla-update CCD:EA_BLOCK_OBJ)

);_end defun