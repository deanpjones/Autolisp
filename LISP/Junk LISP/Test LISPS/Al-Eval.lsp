(defun c:al-eval ()

(vl-load-com)

(setq applic (vlax-get-acad-object))

(vla-eval applic (strcat "MsgBox \"Hello Everybody\"" ", "
 "vbInformation" ", " "\"AfraLisp\""))

(vla-eval applic (strcat "MsgBox \"Are You Fine?\"" ", "
"vbQuestion" ", " "\"CAD Encoding\""))

(vla-eval applic (strcat "MsgBox \"Or, are you not Well?\"" ", "
"vbCritical" ", " "\"VBA Expresso\""))

(alert "\nAnd this is the boring\nAutoCAD message box!!")

(princ)

);defun

