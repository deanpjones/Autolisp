
;Command to convert units at the command prompt.
;Created Jul 19, 2007, compliments of Dean Jones.


;Converts "mm" to "in".
(defun IN-MM (val1)
(cvunit val1 "in" "mm")
)

;Converts "in" to "mm".
(defun MM-IN (val1)
(cvunit val1 "mm" "in")
)

;CAN I HANDLE FT-IN to MM?

;DO FOR FARENHEIT TO CELCIUS

;DO FOR PSI TO KPA