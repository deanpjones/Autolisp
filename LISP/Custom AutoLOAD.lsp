;--------------------------------------------------------------------------------------------------------------------------
;Troubleshooting Tips

;1.0
;If a routine expected to run with changes does not change, see if there is a conflict with another identical *.lsp file.
;Possibly move the priority in the options dialog of the current *.lsp file to resolve.

;--------------------------------------------------------------------------------------------------------------------------

;Adds the revision to the properties of the drawing.
;See express tools for how this works.
(defun undefineQsave ()
(command "undefine" "QSAVE")
(princ)
)
(defun C:QSAVE ()
(command "propulate" "update" "current")
(command "SAVE" "")
(PRINC)
)

;Sets the DEFAULT PRINTER to whatever device is specified on each drawing.
;(command "-PLOT" "n" "" "" "\\\\cgyps2\\CGY0520" "n" "y" "n")

;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
(defun *error* (msg)
  (princ (strcat "\nRiseball Custom Autoload...  Error: " msg))
  (princ)
)
;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

;;;Convert old polylines into new ones.

;(if T (command "convert" "p" "all")(princ "\n***Polyline conversion failed!***"))


;;;Loads Rtext.arx

;(if 	(/= (ARX) "Rtext")
;	(ARXLOAD "C:/Program Files/AutoCAD 2005/Express/Rtext.arx")
;	(princ "\n** RTEXT.arx FILE NOT LOADED.  **")
;)

;;;Turns on the UCSICON
(setvar "ucsicon" 1)

;;;Load REL Commands menu bar.

;;;(if	(/= (menugroup "REL_Commands") "REL_Commands")
;;;	(menucmd "p16=+rel_commands.rel_commands")
;;;	(princ "\n** REL COMMANDS MENU NOT LOADED.  **")
;;;)

;;;Default System Variable Settings

;;;File Dialog fix.
(if (= (getvar "filedia") 0)(setvar "filedia" 1))

;;;Turn ON snap for P&ID's.
(if (= (getvar "cprofile") "2D DESIGNER V2007 - AutoFLOW")
(progn
(setvar "snapmode" 1)
(setvar "osmode" 0)
(if (= (getvar "snapstyl") 0) (setvar "snapunit" '(1 1)))
)
)

;;;Dimensions are intelligent, except for Iso.
(if (= (getvar "cprofile") "2D DESIGNER V2007 - AutoISO") (setvar "dimassoc" 0) (setvar "dimassoc" 1))

	(setvar "fontalt" "romans.shx")			;Sets the alternative FONT to ROMANS.SHX.
	(setvar "isavebak" 0)				;Turns OFF the save backup file option.(Use /.snapshot for backups)
	(setvar "acadlspasdoc" 1)			;Loads lsp into all open files.
	(setvar "pickstyle" 1)				;Turns GROUPS "ON".
	(setenv "ShowFullPathInTitle" "0")		;Suppresses file path at top of AutoCAD window.

	;If ScriptPro halts, these need to be reset.
	(setvar "logfilepath" "C:\\documents and settings\\jonesdp\\local settings\\application data\\autodesk\\autocad 2007\\r17.0\\enu\\")
	(setvar "logfilemode" 0)

	(setvar "fielddisplay" 1)			;Turns FIELD background display to gray.
	(setvar "legacyctrlpick" 1)			;Sets OBJECT CYCLING back to the old method.
	(setvar "luprec" 8)				;Sets the linear units precision to 8 decimal places.
	(setvar "auprec" 8)				;Sets the angular units precision to 8 decimal places.
	(setvar "regenmode" 1)				;Turns ON automatic regeneration.
;;;	(setvar "plinetype" 2)				;Updates old polylines upon opening a drawing.
	(setvar "gripobjlimit" 32767)			;Sets the limit for the amount of grips to be displayed.
	(setvar "pickfirst" 1)				;Select objects first option ON.
	(setvar "highlight" 1)				;Sets HIGHLIGHT to (1) for object selection highlighting to ON.
	(setvar "pickbox" 5)				;Sets PICKBOX select cursor to five(5).
	(setvar "plinewid" 0)				;Sets the polyline width to ZERO(0).
	
	;Sets the crosshairs to 100%.
	(if (= (getvar "cprofile") "2D DESIGNER V2007 - AutoISO")
	(setvar "cursorsize" 99)
	(setvar "cursorsize" 100)
	)
	
	(setvar "textfill" 1)				;Fills True Type fonts IN.
	(setvar "visretain" 1)				;Retain changes to xref layers.
	(setvar "layoutregenctl" 2)			;Cache Regen for paperspace tabs.
	(setvar "demandload" 3)				;Object detect or command invoke ARX applications.
;;;	(setvar "rememberfolders" 1)			;Stays at last navigated folder.
	(setvar "pdmode" 0)				;Display a point as a default point.
	(setvar "mirrtext" 0) 				;Text mirrored stays normal.
 	(setvar "hpname" "solid") 			;Setting default hatch to solid.
	(setvar "offsetdist" (/ (getvar "ltscale") 10))	;Setting default offset distance.
;;;	(setvar "offsetgaptype" 0) 			;Setting default offset style.
 	(setvar "pickfirst" 1) 				;Noun/Verb selecting forced on.
  	(setvar "filletrad" 0) 				;Resetting fillet radius.
  	(setvar "chamfera" 0) 				;Resetting chamfer distance1.
  	(setvar "chamferb" 0) 				;Resetting chamfer distance2.
  	(setvar "chamferc" 0) 				;Resetting chamfer distance3.
  	(setvar "donutid" 0) 				;Donut ID.
  	(setvar "donutod" (/ (getvar "ltscale") 10)) 	;Donut OD.
  	(setq #bns_tcircle_offset 0.50) 		;Setting default TCIRCLE variables.
  	(setq #bns_tcircle_ent "Rectangles") 		;Setting default TCIRCLE variables.




;;;Load all lisp routines

(vl-load-com)

;;;Reactor for a change in a system variable.
;;;	(vl-load-all "ReactorsTestSysVarChange.lsp")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq loadlist '(

"BlockBySelect.lsp"
"myFind.lsp"
"TextRemoveSuffixCharacter.lsp"
"myVP.lsp"
"MyRingRev.lsp"
"Break_3.lsp"
"add_support_path.lsp"

;"UnitConvert.lsp"
;"Convert(in-mm).lsp"

"TDwgNo.lsp"
"TBlockRing.lsp"
"TBlock.lsp"
"myFolderList.lsp"

"MyPOLYLINE.lsp"
"MyBLK.lsp"
"MyBLK-Y.lsp"

"Plot-Vendor.lsp"

"RevUp.lsp"
"RevUp2.lsp"
;"RevUpISO.lsp"
;"RevUp2ISO.lsp"

"ExpField.lsp"
"ExpFieldISO.lsp"

"SetPlotLayout.lsp"
"FixText - New CPC dwg#'s.lsp"
"mySaveAs-NewDwgNo.lsp"
"Field-Convert2Text.lsp"

"FixPageConnector.lsp"
;"MySSetFilter.lsp"
"DefaultPlotter.lsp"

"BlockChange.lsp"

;"MyBlockUpdate.lsp"
;"MyAttSync.lsp"

"MyUpdate.lsp"
"MyDist.lsp"

"SnapT.lsp"
"DPJ-Counter.lsp"
"MyIF.lsp"
"MyDXFlister.lsp"
"filterDXF.lsp"
"EN.lsp"
"MyUpdate.lsp"

"RevChange.lsp"

"DefaultPlotter.lsp"

"TextBlank.lsp"
"TextRemoveSuffix.lsp"
"TextRemovePrefix.lsp"
"TextAddPrefixSuffix.lsp"
"TextNumberIncrement.lsp"

"StampChange.lsp"

"TEdit.lsp"
"TextMatch.lsp"
"TextJustify.lsp"
;"TextRotate.lsp"
"TextSwap.lsp"
"TextUnderline.lsp"

"AutoPrint.lsp"

"TCopy.lsp"
"Join.lsp"
"Midpoint.lsp"
"Break.lsp"

"AuditPurgeAll.lsp"
"WipeoutFrames.lsp"
"SelectionSetClear.lsp"

"StyleCenturyGothic.lsp"
"Gray.lsp"
"RevCloud.lsp"
"CMA.lsp"
"SetLTS.lsp"

"ENO.lsp"
"WM.lsp"

"DimTxtOr.lsp"
"DimNotes.lsp"
"DimXTLswitch.lsp"

"StretchXP.lsp"
"SnapToggle.lsp"

"Sti.lsp"
"Stm.lsp"
"AngleConvert.lsp"

))

;;;Loading LISP files function.
(mapcar '(lambda (x) (load x (strcat "\n" x " not loaded"))) loadlist)

(setq oldlist '(

"CDGPurge30.vlx"
"SnapStyle.lsp"
"LyrCur.lsp"
"PDFunload.lsp"
"FLAT.lsp"
"XXX.lsp"
"TEXAS.lsp"
"CoordPick.lsp"
"TextConvertPressure.lsp"
"TxtMP.lsp"
"Blocks.lsp"

))

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


;Reinitialize Custom *.PGP file if profile changes.
(setvar "re-init" 16)

;Set Prints to default plots.
;(MYSETDEFPLOT)

;;;Display Message on AutoCAD Start-up.

(terpri)
(princ "\n********************************************************************")
(princ "\n***         124875 - CustomAutoLOAD.lsp LOADED. - 578421         ***")
(princ "\n********************************************************************")
(terpri)

(princ)



