;;--------------------------------------------------------------- -------------------------
(defun SetDimStyleMask (stylename / filt ds obj)
(vl-load-com)
(setq filt (BuildFilter '((1001 . "ACAD_DSTYLE_DIMTEXT_FILL") (1070 . 376) (1070 . 1))))
(setq ds (vla-get-dimstyles (vla-get-activedocument (vlax-get-acad-object))))
(setq obj (vla-item ds stylename))
(vla-setXData obj (car filt) (cadr filt))
(command "dimstyle" "save" stylename "y")
(princ)
)
;;------------------------------------------------------------------------ ----------------
(defun BuildFilter (filter)
(mapcar '(lambda (lst typ)
(vlax-make-variant
(vlax-safearray-fill (vlax-make-safearray typ (cons 0 (1- (length lst)))) lst)
)
)
(list (mapcar 'car filter) (mapcar 'cdr filter))
(list vlax-vbInteger vlax-vbVariant)
)
)

