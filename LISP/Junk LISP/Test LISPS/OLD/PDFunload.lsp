;;;Unloads Adobe PDF

(defun C:PDFunload ()

	(ARXUNLOAD "PDFMacad")
	(command "menuunload" "Rangeland")
	(command "menuload" "Rangeland")

(princ)
)

;;;Reloads Adobe PDF

(defun C:PDFreload ()

	(ARXLOAD "C:/Program Files/Adobe/Acrobat 6.0/PDFMaker/AutoCAD/2002/PDFMacad.arx")

(princ)
)
