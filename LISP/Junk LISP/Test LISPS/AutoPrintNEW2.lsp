;;;********************************************************************************
;;;********************************************************************************
;PLOT TO PAPERSPACE FUNCTION. (Needs arguments)
(defun PLOTPAPER ( userPlotter userCTB / )
(command "-plot" "y" (getvar "CTAB") userPlotter "11x17" "Inches" "Landscape" "n" 
"Extents" "Fit" "Center" "y" userCTB "y" "n" "n" "n" "n" "n" "yes")
)
;;;********************************************************************************
;PLOT TO MODELSPACE FUNCTION. (Needs arguments)
(defun PLOTMODEL ( userPlotter userCTB / )
(command "-plot" "y" "Model" userPlotter "11x17" "Inches" "Landscape" "n" 
"Extents" "Fit" "Center" "y" userCTB "y" "As displayed" "n" "n" "yes")
)
;;;********************************************************************************
;;;********************************************************************************
;To get PLOTTER LIST...
(defun GETPLOTTERS ( / plotterlist userNum testPlotter userPlotter)

;Gets available plotters to choose from.
(setq plotterlist
(vlax-safearray->list
	(vlax-variant-value
		(vla-getplotdevicenames
			(vla-item (vla-get-layouts
				(vla-get-activedocument (vlax-get-acad-object))) "Model"
			)
		)
	)
)
)

;Formats and numbers plot list.
(foreach n plotterlist (princ (strcat (itoa (1+ (vl-position n plotterlist))) " - " n )) (terpri))

;Get user input for which default plotter to use.
;????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
;Trying to loop for correct user input.
	(while (= T testPlotter)	
;????????????????????????????????????????????????????????????????????????????????????????????????????????????????????													;Test until it reaches NIL.
(setq userNum (getint (princ (strcat "\nPlease choose a default plotter (1-" (itoa (length plotterlist)) "):"))))

	(setq testPlotter 
	(if (and (>= userNum 1) (<= userNum (length plotterlist)))						;Test to see if number is within limits.
(setq userPlotter (nth (1- userNum) plotterlist))
(progn (princ "\nInvalid input, please try again...\n") nil)
	)																				;end if...
	)																			
	)																				;end while...
																			
(princ)
;????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
)

;;;********************************************************************************
;Get user to select which PLOTTER.
(defun USERPICKPLOTTER ( plotterlist / userNum )
(setq userNum (getint (strcat "Please choose a number (1-" (itoa (length plotterlist)) ") for which plotter to use:  ")))
(setq userPlotter (nth (1- userNum) plotterlist))
)
;;;********************************************************************************
;;;********************************************************************************
;Sets DEFAULT PLOTTER.
(defun DEFAULTPLOTTER ( userPlotter / setactivelayout)

;Sets Active Layout to plot configuration.
(setq setactivelayout 
(vla-get-ActiveLayout 
	(vla-get-ActiveDocument 
		(vlax-get-Acad-Object)
	)
)
)

(vla-put-ConfigName setactivelayout userPlotter)				;Sets layout to match default plotter.

(princ)
)
;;;********************************************************************************
;;;********************************************************************************






;???????????????????????????????????????????????????????????????????????????????????????????????
;Sets Active Layout to plot.
(setq actdoc (vla-get-ActiveDocument (vlax-get-Acad-Object))
actlay (vla-get-ActiveLayout actdoc)
)
(vla-put-ConfigName actlay "None")
;;;********************************************************************************
;;;********************************************************************************
;gets default output device (default plotter)
(vla-get-defaultoutputdevice
(vla-get-output
(vla-get-preferences
(vlax-get-acad-object))))
;???????????????????????????????????????????????????????????????????????????????????????????????
;Test for current plotter.>???????????
(if (= T (boundp 'userPlotter))																					;test if PREFIX already exists.
	(progn
(setq s (getstring (strcat "\nPlot using \"" userPlotter "\" and \"" userCTB "\" or [Settings]:  ")))		;if YES continue, or P for new PREFIX.
	(cond
((= (strcase p) "P") (setq txtprefix (getstring T "\nEnter a PREFIX to add:  "))) 
(T (eval txtprefix))  
(T nil)
	)	
	)
(setq txtprefix (getstring T "\nEnter a PREFIX to add:  "))
)

(vl-propagate 'txtprefix)																	;SETS VARIABLE ACROSS EVERY DRAWING IN AUTOCAD.
;???????????????????????????????????????????????????????????????????????????????????????????????
;To get the default:
(vla-get-defaultoutputdevice (vla-get-output (vla-get-preferences (vlax-get-acad-object))))




Re: Default Printer
Martin, this should work:
(vla-put-configname (vla-get-activelayout (vla-get-activedocument (vlax-get-acad-object))) "None")
but it doesn't, but this one does:
(vla-put-configname (vla-get-activelayout (vla-get-activedocument (vlax-get-acad-object))) "Bluebeam PDF Printer.pc3")
why? I don't know. Maybee anyone else can tell how to set it to "None". I've tried nil and :vlax-null also.

To get the default:
(vla-get-defaultoutputdevice (vla-get-output (vla-get-preferences (vlax-get-acad-object))))

To set/put it:
(vla-put-defaultoutputdevice (vla-get-output (vla-get-preferences (vlax-get-acad-object))) "TK2_HP5000-A3.pc3")


















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

(defun PLOTPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" "Vendor.ctb" "y" "n" "n" "n" "n" "n" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots VENDOR DRAWINGS in model space.

(defun PLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" "Vendor.ctb" "y" "As displayed" "n" "n" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;Automated PLOT lisp
;;;Created Apr.12, 2005 by Dean Jones

(defun c:autoPLOT (/)

(if 	(= (getvar "CTAB") "Model")
	(PLOTMODEL)
	(PLOTPAPER)	
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

(defun AFPLOTPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots FLOW DRAWINGS in model space.

(defun AFPLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots ORTHO DRAWINGS in paper space.

(defun AOPLOTPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots ORTHO DRAWINGS in model space.

(defun AOPLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots ISO DRAWINGS in paper space.

(defun AIPLOTPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.00,0.10" "y" "BRCL 2004.ctb" "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots ISO DRAWINGS in model space.

(defun AIPLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyp19ns\\CGY-HP8150-1507" "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "0.00,0.10" "y" "BRCL 2004.ctb" "y" "As displayed" "n" "y" "yes")
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

