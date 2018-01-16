(defun C:SetPlotLayout-E-CPC ()

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "E-CPC.ctb" "y" "n" "n" "n" "n" "y" "n")

;Plot from modelspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "E-CPC.ctb" "y" "a" "n" "y" "n")

	)

(princ)
)

;----------------------------------------
;For Color Dependent STB files
;*********NOTE: MUST USE "CONVERTCTB" COMMAND TO CREATE STB FIRST.*********

(defun C:SetPlotLayout-E-CPC-STB ()

(command "convertpstyles" "vendor.stb")
(command "-layer" "set" "0" "")

(princ)
)