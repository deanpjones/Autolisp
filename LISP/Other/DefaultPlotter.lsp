;***Make sure to set the default plotter in your Options-->Plot and Publish-->Default Output Device.
;Sets the active layout to the same plotter as specified in the default settings.
;Dean Jones, Aug. 08, 2006.
;Revised Nov. 16, 2007
;;;*******NEED TO CLEAN UP ALL THE VARIABLES, AND REDUNDANT setactivelayout.  Also, optimize how these are reached?

(defun C:MYSETDEFPLOT ( / )
;;;********************************************************************************
;;;********************************************************************************
;Gets the current plotter specified in the layout.
(setq curplotter (vlax-for layout (vla-get-layouts (vla-get-activedocument (vlax-get-acad-object)))
(vla-get-configname layout)
))
;;;********************************************************************************
;;;********************************************************************************
(defun SETDEFPLOT ( / defaultplotter setactivelayout)
;Gets default output device (DEFAULT PLOTTER)
(setq defaultplotter
(vla-get-defaultoutputdevice
	(vla-get-output
		(vla-get-preferences
			(vlax-get-acad-object)
))))
;Sets Active Layout to plot configuration.
(setq setactivelayout
(vla-get-ActiveLayout
	(vla-get-ActiveDocument
		(vlax-get-Acad-Object)
)))

(vla-put-ConfigName setactivelayout defaultplotter)				;Sets layout to match default plotter.

(princ)
)
;;;********************************************************************************
;;;********************************************************************************
(if (/= defaultplotter curplotter)
(SETDEFPLOT)
)
;;;********************************************************************************
;;;********************************************************************************
;;;********************************************************************************
;Sets Active Layout to plot configuration.
(setq setactivelayout
(vla-get-ActiveLayout
	(vla-get-ActiveDocument
		(vlax-get-Acad-Object)
)))
;;;********************************************************************************
;Gets current paper size for the layout.
(setq PaperSize (vla-get-CanonicalMediaName (vla-get-ActiveLayout
(vla-get-activedocument (vlax-get-acad-object)))))
;;;********************************************************************************
(if (/= "Tabloid" PaperSize)
(vla-put-CanonicalMediaName setactivelayout "Tabloid")
)
;;;********************************************************************************
;;;********************************************************************************
;;;********************************************************************************
;Gets current plot scale units. (0 = inches, 1 = millimeters)
(setq mypaperunits
(vla-get-paperunits (vla-get-activelayout (vla-get-activedocument (vlax-get-acad-object))))
)
;;;********************************************************************************
;Sets the current layout to inches.
(if (/= 0 mypaperunits)
(vla-put-paperunits setactivelayout 0)
)
;;;********************************************************************************
;;;********************************************************************************
;Sets Active Layout to plot configuration.
(setq setactivelayout
(vla-get-ActiveLayout
	(vla-get-ActiveDocument
		(vlax-get-Acad-Object)
)))
;;;********************************************************************************
;Get plot orientation for current layout. (0 = Landscape, 1 = Portrait)
(setq myorient (vla-get-plotrotation (vla-get-activelayout (vla-get-activedocument (vlax-get-acad-object)))))
;;;********************************************************************************
(if (/= 0 myorient)
(vla-put-plotrotation setactivelayout ac0degrees)
)
;;;********************************************************************************
;;;********************************************************************************
;Get plot origin for current layout.
(setq myorigin (vla-get-plotorigin (vla-get-activelayout (vla-get-activedocument (vlax-get-acad-object)))))
;;;********************************************************************************

(setq point (vlax-make-safearray vlax-vbDouble '(0 . 1)))		;Creates an array. (0 = ?, 1 = ?)
(vlax-safearray-fill point '(12.7 0.0))							;Adds numbers to the array. (0 = 12.7, 1 = 0.0)
(vlax-safearray->list point)									;Shows point as lisp.

(vla-put-plotorigin setactivelayout point)
;;;********************************************************************************
;;;********************************************************************************




(PRINC)
)

