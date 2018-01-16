
;Sets the viewport up automatically.
;Courtesy Dean Jones, Nov.20, 2008.



(defun c:myVP ()

;Sets zoom extents in modelspace prior.
(command "TILEMODE" "1")
(command "zoom" "e")
(command "TILEMODE" "0")

;Presets the scale of new viewports created.
(command "PSVPSCALE" "1/300")

;Creates and locks the viewport.
(command "clayer" "viewport")
(command "mview" "0,70" "860,575")
(command "mview" "lock" "on" "l" "")
(command "clayer" "0")

(princ)
)


