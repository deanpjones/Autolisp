
;;;Loads Rtext.arx
 
(if 	(/= (ARX) "Rtext")
	(ARXLOAD "C:/Program Files/AutoCAD 2005/Express/Rtext.arx")
	(princ "\n** RTEXT.arx FILE NOT LOADED.  **")
)

;;;Load REL Commands menu bar.

;;;(if	(/= (menugroup "REL_Commands") "REL_Commands")
;;;	(menucmd "p16=+rel_commands.rel_commands")
;;;	(princ "\n** REL COMMANDS MENU NOT LOADED.  **")
;;;)

;;;Default System Variable Settings

;;;File Dialog fix.
(if (= (getvar "filedia") 0)(setvar "filedia" 1))

;;;Dimensions are intelligent, except for Iso.
(if (= (getvar "cprofile") "2D DESIGNER V2004S - AutoISO") (setvar "dimassoc" 0) (setvar "dimassoc" 1))

	(setvar "pickbox" 5)				;Sets PICKBOX select cursor to five(5).
	(setvar "plinewid" 0)				;Sets the polyline width to ZERO(0).
	(setvar "cursorsize" 100)			;Sets the crosshairs to 100%.
	(setvar "textfill" 1)				;Fills True Type fonts IN.
	(setvar "visretain" 1)				;Retain changes to xref layers.
	(setvar "layoutregenctl" 2)			;Cache Regen for paperspace tabs.
	(setvar "demandload" 3)				;Object detect or command invoke ARX applications.
;;;	(setvar "rememberfolders" 1)		;Stays at last navigated folder.
	(setvar "pdmode" 0)					;Display a point as a default point.				
	(setvar "mirrtext" 0) 				;Text mirrored stays normal.
 	(setvar "hpname" "solid") 			;Setting default hatch to solid.
	(setvar "offsetdist" (/ (getvar "ltscale") 10))		;Setting default offset distance.
;;;	(setvar "offsetgaptype" 0) 			;Setting default offset style.
  	(setvar "pickfirst" 1) 				;Noun/Verb selecting forced on.
  	(setvar "filletrad" 0) 				;Resetting fillet radius.
  	(setvar "chamfera" 0) 				;Resetting chamfer distance1.
  	(setvar "chamferb" 0) 				;Resetting chamfer distance2.
  	(setvar "chamferc" 0) 				;Resetting chamfer distance3.
  	(setvar "donutid" 0) 				;Donut ID.
  	(setvar "donutod" (/ (getvar "ltscale") 10)) 	;Donut OD.
  	(setq #bns_tcircle_offset 0.50) 				;Setting default TCIRCLE variables.
  	(setq #bns_tcircle_ent "Rectangles") 			;Setting default TCIRCLE variables.




;;;Load all lisp routines

	(vl-load-com)

;;;Reactor for a change in a system variable.
;;;	(vl-load-all "ReactorsTestSysVarChange.lsp")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	(vl-load-all "TextJustify.lsp")
	(vl-load-all "auditpurgeall.lsp")
	(vl-load-all "wf.lsp")
	(vl-load-all "dimtxtor.lsp")
	(vl-load-all "SnapToggle.lsp")
	(vl-load-all "StyleCG.lsp")
;;;	(vl-load-all "SnapStyle.lsp")
	(vl-load-all "CoordPick.lsp")
	(vl-load-all "DimNotes.lsp")

	(vl-load-all "SelectionSetClear.lsp")
	(vl-load-all "StretchXP.lsp")

	(vl-load-all "TextRotate.lsp")
	(vl-load-all "TextSwap.lsp")
	(vl-load-all "TextUnderline.lsp")
	(vl-load-all "TextMatch.lsp")

;;;	(vl-load-all "TextConvertPressure.lsp")

	(vl-load-all "Gray.lsp")
	(vl-load-all "autoPDF.lsp")
	(vl-load-all "revcloud.lsp")
	(vl-load-all "AngleConvert.lsp")
	(vl-load-all "TEdit.lsp")

	(vl-load-all "SetLTS.lsp")
	(vl-load-all "Blocks.lsp")

	(vl-load-all "TxtMP.lsp")
	(vl-load-all "Break.lsp")
	(vl-load-all "Midpoint.lsp")

;;;	(vl-load-all "CDGPurge30.vlx")
	
	(vl-load-all "Sti.lsp")
	(vl-load-all "Stm.lsp")
	(vl-load-all "Join.lsp")
	(vl-load-all "XTSwitch.lsp")
	(vl-load-all "PDFunload.lsp")

	(vl-load-all "TCOPY.lsp")
;;;	(vl-load-all "LyrCur.lsp")
	(vl-load-all "FLAT.lsp")
	(vl-load-all "ENO.lsp")
	(vl-load-all "XXX.lsp")
	(vl-load-all "CMA.lsp")
	(vl-load-all "TEXAS.lsp")
	(vl-load-all "WM.lsp")


;;;Display Message on AutoCAD Start-up.

(princ "\n ")
(princ "\n*****************************************************************")
(princ "\n*****************************************************************")
(princ "\n**     CUSTOM menu utilities and lisp routines LOADED.         **")
(princ "\n*****************************************************************")
(princ "\n*****************************************************************")
(princ "\n ")
(princ)

	
	
	