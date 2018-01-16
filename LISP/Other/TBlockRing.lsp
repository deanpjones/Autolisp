;Updates the titleblock info.
;Dean Jones, Jul.02, 2008

(defun C:TBLOCKRING ( / mypath DwgName mydate DwgDate mypath2 AreaName mystart1 myend1 FullLSD LSD DwgType3)

(setq mypath (GETVAR "DWGPREFIX"))

;Gets the file name.
(setq DwgName (vl-filename-base (getvar "dwgname")))
(terpri)(princ dwgname)

;Gets the date from the Julian Date (eg. 20080701.1200, Jul.01, 2008, 12:00o'clock).
(setq mydate (rtos (getvar "cdate")))
(setq DwgDate (strcat (substr mydate 3 2) "/" (substr mydate 5 2) "/" (substr mydate 7 2)))
(terpri)(princ DwgDate)

;Extract Area Name.
;*********************************************************************************
;*********************************************************************************
(setq mypath2 (substr mypath (+ 34 (acet-str-find "Gathering System" mypath))))
;*********************************************************************************
;*********************************************************************************
(setq AreaName (strcase (substr mypath2 1 (1- (acet-str-find "\\" mypath2)))))
(terpri)(princ AreaName)

;Extract full LSD.
(setq mystart1 (1+ (acet-str-find "\\" mypath2)))
(setq myend1 (- (acet-str-find "(CA" mypath2) mystart1 1))
(setq FullLSD (substr mypath2 mystart1 myend1))
(terpri)(princ FullLSD)

;Extract partial LSD.
(cond
((wcmatch FullLSD "#`-#`-*")(setq LSD (substr FullLSD 1 3)))		;For LSD.
((wcmatch FullLSD "#`-##`-*")(setq LSD (substr FullLSD 1 4)))		;For LSD.
((wcmatch FullLSD "##`-#`-*")(setq LSD (substr FullLSD 1 4)))		;For LSD.
((wcmatch FullLSD "##`-##`-*")(setq LSD (substr FullLSD 1 5)))		;For LSD.
((wcmatch FullLSD "@`-#`-@`-*")(setq LSD (substr FullLSD 1 5)))		;For NTS.
((wcmatch FullLSD "@`-##`-@`-*")(setq LSD (substr FullLSD 1 6)))	;For NTS.
((wcmatch FullLSD "@`-###`-@`-*")(setq LSD (substr FullLSD 1 7)))	;For NTS.
(T (setq LSD "XXXX"))
)


;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
(defun *error* (msg)
  (princ (strcat "\nThe titleblock cannot update.  Error: " msg))
  (princ)
)
;EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;NOTE, USE THE (MYBLK.LSP FILE USING THE FUNCTIONS, MYBLK AND MYATTRIB) FOR THE BELOW COMMANDS

;Change titleblock with drawing number.
(myattrib (myblk 2 "CPC_A1TBLK") "CPC_DWG_#" DwgName)
;Change titleblock with full LSD.
(myattrib (myblk 2 "CPC_A1TBLK") "LGL_DESC" FullLSD)
;Change titleblock with top title info.
(setq uFacilityType (strcase (getstring T "\nWhat type of facility? (eg. Compressor Station, Wellsite):  ")))
(setq uFacilityType2 (strcat AreaName "  " LSD "  " uFacilityType))
(myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#1" uFacilityType2)
(terpri)(princ uFacilityType2)(terpri)(terpri)
;Change titleblock with current date info.
(myattrib (myblk 2 "CPC_A1TBLK") "YY/MM/DD" DwgDate)
;Change titleblock scale to NTS for P&ID's.
(if (vl-string-search "PID" DwgName)
(myattrib (myblk 2 "CPC_A1TBLK") "SCALE" "NTS")
)
;Change titleblock scale to NTS for GGS's.
(if (vl-string-search "GTH" DwgName)
(myattrib (myblk 2 "CPC_A1TBLK") "SCALE" "NTS")
)
;Add Scale default 1:300
(if (vl-string-search "PLO-020" DwgName)
(myattrib (myblk 2 "CPC_A1TBLK") "SCALE" "1:300")
)
;-------------------------------------------------------------------
(cond
((vl-string-search "PFD" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PROCESS FLOW DIAGRAM"))
((vl-string-search "PID" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PIPING AND INSTRUMENTATION DIAGRAM"))
((vl-string-search "PLO-020" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#2" (strcat FullLSD " - SITE PLAN")))
((vl-string-search "PLO-030" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#2" "GRADING PLAN"))
((vl-string-search "FDN-010" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PILING KEY PLAN"))
((vl-string-search "FDN-020" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PILING LOCATION PLAN"))
((vl-string-search "FDN-030" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PILING SCHEDULE DETAILS AND NOTES"))
((vl-string-search "SUP-010" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PIPE SUPPORT KEY PLAN"))
((vl-string-search "SUP-020" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PIPE SUPPORT DETAILS"))
((vl-string-search "SUP-030" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "PIPE SUPPORT SCHEDULE"))
((vl-string-search "SUP-040" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#3" "STRUCTURAL STEEL"))
((vl-string-search "GTH" DwgName) (myattrib (myblk 2 "CPC_A1TBLK") "TITLE_#2" "GAS GATHERING SCHEMATIC"))
(T nil)
)
;-------------------------------------------------------------------

(command "regen")

;Draw a rectangle around the area being edited.
(setq ptA (list 693 73))
(setq ptB (list 863 73))
(setq ptC (list 863 -3))
(setq ptD (list 693 -3))

(command "zoom" "w" ptA ptC)
(command "zoom" "s" "0.8xp")

(grvecs '(-3 (693 73)(863 73)
          -3 (863 73) (863 -3)
          -3 (863 -3) (693 -3)
          -3 (693 -3) (693 73)
))

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
(princ)
)
