;;;If Current Layer is loaded then load the approapriate layers.
;;;Created by Dean Jones Mar. 23, 2007.
;;;Revised as per PROFILES, and FILE PATHS, Jul. 16, 2007.
;;;Revised as per NO PROFILE, Nov.19, 2009.

;;;Modified with all layers on one script.

(defun C:CPClayers ()

(cond
(T (command "script" "S:\\BR-S\\gsGRP\\GROUP\\ENGCAD\\00.000 CAD Management\\700\\780 CAD Configuration Files\\CPC Customization (v2007)\\CPClayers.scr"))
(T (alert "NO LAYERS WERE CREATED."))
(T nil)
)

(princ)
)