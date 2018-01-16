;;;Sets TEXT STYLES to Century Gothic
;;;Courtesy of Dean Jones Dec.21, 2005

(defun C:stylecg ( / )

(command "-style" "ISO-L" "Century Gothic" "0" "1" "30" "n" "n" )

(command "-style" "ISO-R" "Century Gothic" "0" "1" "-30" "n" "n" )

(command "-style" "STD-70" "Century Gothic" "0" "1" "0" "n" "n" )

(command "-style" "STD70" "Century Gothic" "0" "1" "0" "n" "n" )

(command "-style" "STD-80" "Century Gothic" "0" "1" "0" "n" "n" )

(command "-style" "Standard" "Century Gothic" "0" "1" "0" "n" "n" )

(command "regen")

(princ)
)