(if (= (ascii "a") (read-char)) (alert "this works") (alert "this DOESN'T work"))

(if (= (ascii "^I") (read-char)) (alert "this works") (alert "this DOESN'T work"))
;;trying to get a ctrl+I working or to use SHIFT for eg.

;??????????????
(while (car (setq pt3 (grread 'T 1 0)))(princ pt3)))

;???????????
(acet-sys-control-down)

(acet-sys-shift-down)

;**********************************************************************************
;**********************************************************************************
(defun SHIFTTEST ( / )

(cond
((= T (acet-sys-shift-down)) (alert "SHIFT works"))
((= T (acet-sys-control-down)) (alert "CTRL works"))
(T (alert "NORMAL works"))
(T nil)
)

)
;**********************************************************************************
;**********************************************************************************