

;;;Converts current layer back after a routine.
;;;Compliments of Dean Jones, Mar. 14, 2007. 

;********************************************************************
;Insert at beginning of macro.

(defun layerback1 (nlay / )

(setq olay (getvar "clayer"))			;get current layer.
(setq nlay (setvar "clayer" nlay))		;change to new layer.

(princ)
)
;********************************************************************


;********************************************************************
;Insert at end of macro.

(defun layerback2 ( / )

(setvar "clayer" olay)				;reset current layer.

(setq olay nil)					;reset any old variables.
(setq nlay nil)					;reset any old variables.

(princ)
)
;********************************************************************