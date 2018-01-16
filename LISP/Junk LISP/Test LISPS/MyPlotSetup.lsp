;Set plotter name to "none"
(vlax-for layout (vla-get-layouts (vla-get-activedocument (vlax-get-acad-object))) (vla-put-configname layout "none"))

;Set plotter name to "\\\\cgyps3\\CGY2513"
(vlax-for layout (vla-get-layouts (vla-get-activedocument (vlax-get-acad-object))) (vla-put-configname layout "\\\\cgyps3\\CGY2513"))




;============================================
(defun putPagesetupAll ()
 (vlax-for
  layout
  (vla-get-layouts
   (vla-get-activedocument
    (vlax-get-acad-object)
   )
  )
  (putPagesetup layout "A3")
 )
)
;============================================
(defun putPagesetup (layout setup / layouts plots)
 (defun item-p (collection item)
  (if
   (not
    (vl-catch-all-error-p
     (vl-catch-all-apply
      '(lambda () (setq item (vla-item collection item)))
     )
    )
   )
   item
  )
 )
 (and
  (or *acad* (setq *acad* (vlax-get-acad-object)))
  (or *doc* (setq *doc* (vla-get-activedocument *acad*)))
  (setq layouts (vla-get-layouts *doc*))
  (setq plots   (vla-get-plotconfigurations *doc*))
  (setq layout (item-p layouts layout))
  (setq setup (item-p plots setup))
  (not (vla-copyfrom layout setup))
 )
)
;============================================