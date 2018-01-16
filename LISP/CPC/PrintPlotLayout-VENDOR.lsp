(defun C:PrintPlotLayout-VENDOR ()

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "Vendor.ctb" "y" "n" "n" "n" "n" "y" "y")

;Plot from modelspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "Vendor.ctb" "y" "a" "n" "y" "y")

	)

(princ)
)
