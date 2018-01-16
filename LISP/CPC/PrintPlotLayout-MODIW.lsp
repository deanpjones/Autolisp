(defun C:PrintPlotLayout-MODIW ( / myDwgNo)

(command "-insert" "S:\\BR-S\\gsGRP\\GROUP\\ENGCAD\\00.000 CAD Management\\700\\702 Blocks\\General Blocks\\CPC No Block.dwg" "758,70" "1" "" "0")

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;NOTE, USE THE (MYBLK.LSP FILE USING THE FUNCTIONS, MYBLK AND MYATTRIB) FOR THE BELOW COMMANDS

(setq myDwgNo (getstring "Enter the drawing number: "))

;Change titleblock with drawing number.
(myattrib (myblk 2 "CPC No Block") "CPC_DWG_NO" myDwgNo)

(command "regen")
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "Microsoft Office Document Image Writer" "Tabloid" "m" "P" "n" "w" "757,69" "859,91" "f" "c" "y" "DWG to PDF.CTB" "y" "n" "n" "n" "n" "y" "y")

;Plot from modelspace.
(command "-plot" "y" "" "Micros
oft Office Document Image Writer" "Tabloid" "m" "P" "n" "w" "757,69" "859,91" "f" "c" "y" "DWG to PDF.CTB" "y" "a" "n" "y" "y")

	);end IF.

(princ)

;Remove block after plotting.
(setq ss1 nil)
(setq ss1 (ssget "X" '((0 . "INSERT")(66 . 1)(2 . "CPC No Block"))))
(command "pselect" "p" "" "erase")

)
