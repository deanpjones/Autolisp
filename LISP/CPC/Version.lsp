;;Acad version printout
;;Open ONE DWG FILE in a folder and run VERSION.LSP for a complete list of which AutoCAD file format.
;;Dean Jones, April 24, 2012.

;*************************************************************************
(defun fGetFile ()
(setq f (getfiled "Select a file and click OPEN to get DWG version format." "" "dwg" 16))
(setq pathPrefix (strcat (vl-filename-directory f) "\\")) ;Get DWG folder path.
);END DEFUN.

;*************************************************************************
;OPEN DWG file and grab version.
(defun MYOPEN-R (f)
  (setq		File		(open f "R")
			dwgVersion	(substr (read-line file) 1 6)
  );END SETQ.
;(print dwgVersion)
(close file)
(princ)
(setq dwgVersion dwgVersion)
);END DEFUN.
;*************************************************************************
;Returns DWG list (myList)
(defun fDWGList ()
;(setq myList (acad_strlsort (vl-directory-files (getvar "dwgprefix") "*.dwg" 1)))
(setq myList (acad_strlsort (vl-directory-files pathPrefix "*.dwg" 1)))
;("ver2000.dwg" "ver2004.dwg" "ver2007.dwg" "ver2010.dwg" "verR14.dwg")
;(terpri)(princ "DRAWING LIST")(terpri)
;(mapcar '(lambda (x) (princ x)(terpri)) myList)
;(terpri)
(princ)
);END DEFUN.
;USE myList TO PASS ON.
;*************************************************************************
;Returns Version list (verList)
;(MYOPEN-R (strcat pathPrefix "ver2000.dwg"))
(defun fVerList ()
(setq verList (mapcar '(lambda (x) (MYOPEN-R (strcat pathPrefix x))) myList))
);END DEFUN.
;*************************************************************************
;Returns Version list WITH DESCRIPTION (verListDESC)
(defun fVerListDESC ()
(setq verListDESC
(mapcar '(lambda (n)
(cond
((= n "AC1.50") "AutoCAD vRel.2.0, AC1.50")
((= n "AC2.10") "AutoCAD vRel.2.10, AC2.10")
((= n "AC1002") "AutoCAD vRel.2.5, AC1002")
((= n "AC1003") "AutoCAD vRel.2.6, AC1003")
((= n "AC1004") "AutoCAD vRel.09, AC1004")
((= n "AC1006") "AutoCAD vRel.10, AC1006")
((= n "AC1009") "AutoCAD vRel.11/12, AC1009")
((= n "AC1012") "AutoCAD vRel.13, AC1012")
((= n "AC1014") "AutoCAD vRel.14, AC1014")
((= n "AC1015") "AutoCAD v2000, AC1015")
((= n "AC1018") "AutoCAD v2004, AC1018")
((= n "AC1021") "AutoCAD v2007, AC1021")
((= n "AC1024") "AutoCAD v2010, AC1024")
((= n "AC1027") "AutoCAD v2013, AC1027")
(T "???")
);END COND.
);END LAMBDA.
verList);END MAPCAR.
);END SETQ.
);END DEFUN.
;*************************************************************************
;Prints DWG and Version list.
(defun C:ACVER ()
(fGetFile)
(fDWGList)
(fVerList)
(fVerListDESC)
(terpri)(princ "DRAWING(*.DWG) FORMAT LIST")
(terpri)(princ pathPrefix)
(terpri)(terpri)
(setq dwg-verList (mapcar '(lambda (x y) (princ (strcat x " - " y))(terpri)) myList verListDESC))
(textscr)
(princ)
);END DEFUN.
;*************************************************************************

