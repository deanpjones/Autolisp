(defun C:PrintPlotLayout-E-CPC ()

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "E-CPC.ctb" "y" "n" "n" "n" "n" "y" "y")

;Plot from modelspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "11\" x 17\"" "m" "l" "n" "e" "f" "c" "y" "E-CPC.ctb" "y" "a" "n" "y" "y")

	)

(princ)
)

;**************************************************************************************
(defun C:PrintPlotLayout-E-CPC-Letter ()

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "Letter (8.5\" x 11\")" "i" "p" "n" "e" "f" "0.17,0.00" "y" "E-CPC.ctb" "y" "n" "n" "n" "n" "y" "y")

;Plot from modelspace.
(command "-plot" "y" "" "\\\\cgyps2\\CGY0520" "Letter (8.5\" x 11\")" "i" "p" "n" "e" "f" "0.17,0.00" "y" "E-CPC.ctb" "y" "a" "n" "y" "y")

	)

(princ)
)
;**************************************************************************************
