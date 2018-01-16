;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;-------------------------------------------------------------------------------------------------------------
;NOT SET UP FOR CONOCOPHILLIPS FOR PDF'S YET???
;Plots to PDF format in paper space.

(defun PDFPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "BroadGun pdfMachine" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "Center" "y" "monochrome.ctb" "y" "n" "n" "n" "n" "n" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots to PDF format in model space.

(defun PDFMODEL (/)

	(command "-plot" "y" "Model" "BroadGun pdfMachine" "11\" x 17\"" "Inches" "Landscape" "n"
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

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "Center" "y" "Vendor.ctb" "y" "n" "n" "n" "n" "n" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots VENDOR DRAWINGS in model space.

(defun PLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
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

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots FLOW DRAWINGS in model space.

(defun AFPLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots ORTHO DRAWINGS in paper space.

(defun AOPLOTPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots ORTHO DRAWINGS in model space.

(defun AOPLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "0.3,0.00" "y" "BRCL 2004.ctb" "y" "As displayed" "n" "y" "yes")
)

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Plots ISO DRAWINGS in paper space.

(defun AIPLOTPAPER (/)

	(command "-plot" "y" (getvar "CTAB") "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
	"Extents" "Fit" "0.00,0.10" "y" "BRCL 2004.ctb" "y" "n" "n" "n" "n" "y" "yes")
)

;-------------------------------------------------------------------------------------------------------------
;Plots ISO DRAWINGS in model space.

(defun AIPLOTMODEL (/)

	(command "-plot" "y" "Model" "\\\\cgyps3\\CGY2513" "11\" x 17\"" "Inches" "Landscape" "n"
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

