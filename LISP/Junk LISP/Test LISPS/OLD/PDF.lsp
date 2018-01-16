

****************************************************************************
	
(defun C:PDFload (/ a b c)
	(setq a (arxload "C:/Program Files/Adobe/Acrobat 6.0/PDFMaker/AutoCAD/2002/pdfmacad.arx")
		(princ "\n**Adobe PDF Maker Loaded**")
		(princ)
	)
	(setq b (ARXUNLOAD "PDFMacad")
		(command "menuunload" "Rangeland")
		(command "menuload" "Rangeland")
		(princ "\n**Adobe PDF Maker UnLoaded**")
		(princ)
	)

****************************************************************************

	(setq c (list (command "arx" "?" "" "")))

	(if (assoc "pdfmacad" c) b a)
)
