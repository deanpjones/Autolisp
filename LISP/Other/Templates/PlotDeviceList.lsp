;GETS PLOT DEVICE NAMES

(setq acadApp (vlax-get-acad-object))
(setq activeDoc (vla-get-activeDocument acadApp))
(setq activeLayout (vla-get-ActiveLayout activeDoc))								;gets object to active layout

(setq plotdevices (vla-GetPlotDeviceNames activeLayout))							;gets plot devices (vb format)

(setq plotdeviceList (vlax-safearray->list (vlax-variant-value plotdevices)))		;lists plot devices (lisp format)
(foreach n plotdeviceList (princ n) (terpri))										;prints each to a line.

;**********************************************************************************************************************
(setq acadApp (vlax-get-acad-object))
;;(setq acadPref (vlax-get-preferences))

;;(setq defaultPlotDevice (vla-DefaultOutputDevice acadPref))