(defun C:SetPlotLayout-CPC ()

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "CPC.ctb" "y" "n" "n" "n" "n" "y" "n")

;Plot from modelspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "CPC.ctb" "y" "a" "n" "y" "n")

	)

(princ)
)

