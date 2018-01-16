(defun C:PDF ()

	(if (= (getvar "tilemode") 0)

;Plot hBRC drawing from paperspace.
(command "-plot" "y" "" "DWG To PDF.pc3" "ANSI D (34.00 x 22.00 Inches)" "m" "l" "n" "e" "f" "c" "y" "Monochrome.ctb" "y" "n" "n" "n" "" "y" "y")


;Plot from modelspace.
(command "-plot" "y" "" "DWG To PDF.pc3" "ANSI D (34.00 x 22.00 Inches)" "m" "l" "n" "e" "f" "c" "y" "Monochrome.ctb" "y" "a" "" "y" "y")

	)

(princ)
)
