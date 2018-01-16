;**********************************************************************************************
;Display current settings & ask user for settings.
(DEFUN PLOTSETTINGS ( / userSettings)
(princ (strcat "\nCurrent plot settings:  " Plotter " & " CTB ))
(setq userSettings (strcase (getstring "\nPlot Settings press (S) or Enter to continue:  ") T))
(if (= userSettings "s")
(PLOTSETUP)
)
)
;**********************************************************************************************
;Sets up the Plotter and CTB file from the user.
(defun PLOTSETUP ( / userPlotter userCTB)
;**********************************************************************************************

(princ "\n(1) \\\\cgyp19ns\\CGY-HP8150-1537")
(princ "\n(2) \\\\cgyp19ns\\CGY-HP8150-1507")
(setq userPlotter (strcase (getstring "\nPick a number(#) for the printer to select: ") T))
 
(setq Plotter 
	(cond
((wcmatch userPlotter "1") "\\\\cgyp19ns\\CGY-HP8150-1537")
((wcmatch userPlotter "2") "\\\\cgyp19ns\\CGY-HP8150-1507")
(T nil)
	)
)
;**********************************************************************************************

(princ "\n(1) BRCL 2004.ctb")
(princ "\n(2) Vendor.ctb")
(setq userCTB (strcase (getstring "\nPick a number(#) for the ctb file to use: ") T))
 
(setq CTB 
	(cond
((wcmatch userCTB "1") "BRCL 2004.ctb")
((wcmatch userCTB "2") "Vendor.ctb")
(T nil)
	)
)
;**********************************************************************************************
;;??????????VARIABLE ERROR???????????????/

(defun DISPLAYCURRENTSETTINGS ( Plotter CTB / )
(princ "\nYour current print settings are: ")
(princ (strcat "\nPrinter:  \"" Plotter "\""))
(princ (strcat "\nCTB File:  \"" CTB "\""))
(princ)
)
;**********************************************************************************************
) ; end DEFUN
;**********************************************************************************************

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;-------------------------------------------------------------------------------------------------------------
;NOT SET UP FOR CONOCOPHILLIPS FOR PDF'S YET???
;Plots to PDF format in paper space.

(defun PDFPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "BroadGun pdfMachine" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" "monochrome.ctb" "y" "n" "n" "n" "n" "n" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots to PDF format in model space.

(defun PDFMODEL (/)

	(command "-plot" "y" "Model" "BroadGun pdfMachine" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" "monochrome.ctb" "y" "As displayed" "n" "n" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;Automated PDF lisp
;;;Created Apr.06, 2005 by Dean Jones

(defun c:autoPDF (/)

(if 	(= (getvar "CTAB") "Model")
	(PDFMODEL)
	(PDFPAPER)	
)

(princ)
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;-------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------

;Plots VENDOR DRAWINGS in paper space.

(defun PLOTPAPER (Plotter CTB /)

	(command "-plot" "y" (getvar "CTAB") Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" CTB "y" "n" "n" "n" "n" "n" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots VENDOR DRAWINGS in model space.

(defun PLOTMODEL (Plotter CTB /)

	(command "-plot" "y" "Model" Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" CTB "y" "As displayed" "n" "n" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;Automated PLOT lisp
;;;Created Apr.12, 2005 by Dean Jones

(defun c:autoPLOT (/)

(if 	(= (getvar "CTAB") "Model")
	(progn (PLOTSETTINGS) (PLOTMODEL))
	(progn (PLOTSETTINGS) (PLOTPAPER))	
)

(princ)
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots FLOW DRAWINGS in paper space.

(defun AFPLOTPAPER (Plotter CTB /)

	(command "-plot" "y" (getvar "CTAB") Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" CTB "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots FLOW DRAWINGS in model space.

(defun AFPLOTMODEL (Plotter CTB /)

	(command "-plot" "y" "Model" Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" CTB "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots ORTHO DRAWINGS in paper space.

(defun AOPLOTPAPER (Plotter CTB /)

	(command "-plot" "y" (getvar "CTAB") Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" CTB "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots ORTHO DRAWINGS in model space.

(defun AOPLOTMODEL (Plotter CTB /)

	(command "-plot" "y" "Model" Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" CTB "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots ISO DRAWINGS in paper space.

(defun AIPLOTPAPER (Plotter CTB /)

	(command "-plot" "y" (getvar "CTAB") Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.00,0.10" "y" CTB "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots ISO DRAWINGS in model space.

(defun AIPLOTMODEL (Plotter CTB /)

	(command "-plot" "y" "Model" Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.00,0.10" "y" CTB "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;Automated PLOT lisp
;;;Created Aug. 24, 2005 by Dean Jones

(defun c:PROCADautoPLOT (/)

(if (= (getvar "CTAB") "Model")
(progn (cond
	 ((= (getvar "cprofile") "2D DESIGNER V2004S - AutoFLOW") (AFPLOTMODEL))
	 ((= (getvar "cprofile") "2D DESIGNER V2004S - AutoORTHO") (AOPLOTMODEL))
	 ((= (getvar "cprofile") "2D DESIGNER V2004S - AutoISO") (AIPLOTMODEL))
	)
)
(progn (cond
	 ((= (getvar "cprofile") "2D DESIGNER V2004S - AutoFLOW") (AFPLOTPAPER))
	 ((= (getvar "cprofile") "2D DESIGNER V2004S - AutoORTHO") (AOPLOTPAPER))
	 ((= (getvar "cprofile") "2D DESIGNER V2004S - AutoISO") (AIPLOTPAPER))
	)
)
)	 
  
(princ)
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
