;Creates a toggle of similar functions.
;User can press SHIFT to invoke another command. (eg. an opposite of the first)
;User can press CTRL to invoke another command. (eg. a global command rather than an individual command)
;***NOTE: EXPRESS TOOLS MUST BE INSTALLED FOR THE ACET-SYS-* FUNCTIONS TO WORK.***

;Dean Jones, Aug.10, 2006.



;Add to the beginning of a *.lsp file with the corresponding functions.

;**********************************************************************************
;**********************************************************************************
(defun SHIFT-CTRL-TOGGLE ( function1 function2 function3 / )

(cond
((= T (acet-sys-shift-down)) function2)
((= T (acet-sys-control-down)) function3)
(T function1)
(T nil)
)

)
;**********************************************************************************
;**********************************************************************************
(defun SHIFT-CTRL-TOGGLE ( function1 function2 / )

(cond
((= T (acet-sys-shift-down)) function2)
(T function1)
(T nil)
)

)
;**********************************************************************************
;**********************************************************************************