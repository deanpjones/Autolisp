;*********************************************************************
;*********************************************************************
;Create fast loading file.
;RUN FROM VLISP EDITOR.
;***SEE CPC.MNL file for path to Automatically LOAD CPC AUTOLOAD.FAS
;THIS WORKS AS CPC.CUI IS LOADED SO WILL THE CPC.MNL FILE.
;(vlisp-compile 'st "c:/CPC Autoload.lsp" "c:/CPC Autoload.fas")
;*********************************************************************
;*********************************************************************

;Add support file to Options.
;(addSupportPath "Z:\\780 CAD Configuration Files\\CPC Customization (v2007)\\CPC Tool Pallettes" nil)
;(addSupportPath "Z:\\780 CAD Configuration Files\\Scripts" nil)

;;;Loads CPC Menu.

(vl-load-com)
;;;*********************************************************************************
;;;*********************************************************************************
;These are Custom AutoCAD lisp files

(setq loadlist '(


"LineProgram.lsp"
;"VERSION.lsp"

;"CurrentLayer(Reactor).lsp"

"SetLTS.lsp"

"Sti.lsp"
"Stm.lsp"

"TEdit.lsp"
"TextAddPrefixSuffix.lsp"
"TextBlank.lsp"
"TextMatch.lsp"
"TextNumberIncrement.lsp"
"TextRemovePrefix.lsp"
"TextRemoveSuffix.lsp"
"TextRotate.lsp"
"TextSwap.lsp"
"TextUnderline.lsp"

"ETBLOCK.lsp"
"tblock.lsp"
"TDwgNo.lsp"
"TREV.lsp"

"AuditPurgeAll.lsp"
"MYBLK.lsp"
"MYBLK-Y.lsp"

;"add_support_path.lsp"
"BeaverStamp.lsp"

"PrintPlotLayout-E-CPC.lsp"
"PrintPlotLayout-CPC.lsp"
"PrintPlotLayout-VENDOR.lsp"
"PrintPlotLayout-MODIW.lsp"
"SetPlotLayout-E-CPC.lsp"
"SetPlotLayout-CPC.lsp"
"SetPlotLayout-VENDOR.lsp"

"MySSetFilter.lsp"

"TogglePageConnector.lsp"

"MyBlockUpdate.lsp"
"MyAttSync.lsp"

"CPClayers"
"ELECLAYERS"
"CPCbylayers"
"attheight"
"attwidth"
"autonumb"
"contex"
"dbreak"
"et"
"join"
"LDO"
"Lfd"
"mddatte"
"mddedit"
"nuke"
"Pw"
"respace"
"SA"
;"ScaleBlk"
"weld"
"xtswitch"
"xyl"
"zfix"
"FD"
"CPC Custom"

))

;;;Loading LISP files function.
(mapcar '(lambda (x) (load x (strcat "\n" x " not loaded"))) loadlist)

;;;*********************************************************************************
;;;*********************************************************************************
;;;System Variable settings.

(setvar "fontalt" "romans.shx")	;Sets the alternative FONT to ROMANS.SHX.
(setvar "mirrtext" 0)			;When mirroring does not flip text.
(setvar "offsetgaptype" 1)		;Sets offset to rounded rectangles (for site plan 100m clearances)
(setvar "edgemode" 0)			;Sets TRIM command to trim touching objects (when using ALL function)
(setvar "luprec" 4)				;Sets the units precision to 4 decimal places.
(setvar "auprec" 4)				;Sets the units precision to 4 decimal places.
(setvar "fielddisplay" 1)		;Turns FIELD background display to gray.
;(setvar "cursorsize" 100)		;Crosshair size.

(setvar "ROLLOVERTIPS" 0)		;Turns OFF tips, as several performance issues.
(setvar "hpquickpreview" 0)  	;Hatch preview display OFF.
(setvar "WHIPTHREAD" 3)			;Optimizes processors for zoom and regen.
(setvar "donutID" 0)			;Sets default donut inside diameter.
(setvar "DRAWORDERCTL" 0)		;Sets the draworder display default.
;(setvar "NAVVCUBEDISPLAY" 3) 	;Display viewcube ON.
;(setvar "NAVBARDISPLAY" 1)		;Display navigation bar ON.
;(setvar "ucsicon" 0)			;UCSICON off.

(setvar "GRIDDISPLAY" 0)		;Grid not limited by LIMITS.
(setvar "GRIDMAJOR" 5)			;(default)
;(setvar "GRIDMODE" 1)			;Turns Grid ON.
(setvar "GRIDSTYLE" 7)			;Sets Grid to classic DOTS.
;(setvar "GRIDUNIT" (list 10.0 10.0))

;--------------------------------------------------------------
;Close VIEWCUBE AND NAVBAR for following users.
(if
(or (= (getvar "LOGINNAME") "ferchg")
	(= (getvar "LOGINNAME") "binteas")
	(= (getvar "LOGINNAME") "janetph")
	(= (getvar "LOGINNAME") "harladh")
	(= (getvar "LOGINNAME") "rrob")
);END OR
(progn
;Turn off viewcube from OPTIONS-->3D MODEL-->
;(setvar "TILEMODE" 1)(setvar "NAVVCUBEDISPLAY" 0) 	;Display viewcube OFF.
(setvar "NAVBARDISPLAY" 0)		;Display navigation bar OFF.
(PRINC)
);END PROGN
);END IF

;--------------------------------------------------------------
;----------Andrew Binter------------
(if (= (getvar "LOGINNAME") "binteas")
(progn
(setvar "OSMODE" 247)			;Running OSNAP settings.
(setvar "cursorsize" 29)		;Crosshair size.
(command "zoom" "e")			;Zoom extents on loading.
(command "zoom" "0.95x")
(PRINC)
);END PROGN
);END IF

;----------Dean Jones------------
(if (= (getvar "LOGINNAME") "jonesdp")
(progn
(setvar "PICKBOX" 6)			;Select Objects pickbox size.
(setvar "donutID" 0)			;Sets default donut inside diameter.
(setvar "DRAWORDERCTL" 0)		;Sets the draworder display default.
(setvar "OSMODE" 0)				;Running OSNAP settings.
(setvar "cursorsize" 100)		;Crosshair size.
(setvar "luprec" 8)				;Sets the units precision to 8 decimal places.
(setvar "auprec" 8)				;Sets the units precision to 8 decimal places.
(command "zoom" "e")			;Zoom extents on loading.
(command "zoom" "0.95x")
(PRINC)
);END PROGN
);END IF

;-----------------------------------
;;;*********************************************************************************
;;;*********************************************************************************

;;;Zoom extents on loading.
;(command "zoom" "e")
;(command "zoom" "0.95x")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Maximize window on startup.
(defun winMax ( / acadApp activeDoc winMaximize)
(setq acadApp (vlax-get-acad-object))
(setq activeDoc  (vla-get-activeDocument acadApp))

(setq winMaximize (vla-put-WindowState activeDoc acMax))

(princ)
)
(winMax)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(princ "\n")
(princ "\nConocoPhillips Settings & Lisp loaded. v2011")

(princ)





