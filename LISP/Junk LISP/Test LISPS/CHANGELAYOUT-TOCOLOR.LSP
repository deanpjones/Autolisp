(setq layouts (vla-get-layouts
(vla-get-activedocument
(vlax-get-acad-object))))

(setq layout1 (vla-item layouts "layout1"))

(vla-put-showplotstyles layout1 :vlax-true)
(command "regenall")


or

(vla-put-showplotstyles layout1 :vlax-false)
(command "regenall")