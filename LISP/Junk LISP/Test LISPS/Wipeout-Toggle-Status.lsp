
 

(defun massoc (key alist / x nlist)
  (foreach x alist
    (if (eq key (car x))
      (setq nlist (cons (cdr x) nlist))
    )
  )
  (reverse nlist)
)
(defun listdictionaries ()
  (massoc 3 (entget (namedobjdict)))
)
(defun getdict (dictName)
  (dictsearch (namedobjdict) dictName)
)
 
You can check the status....
 
(SETQ wpframesDict (getdict "ACAD_WIPEOUT_VARS"))
(SETQ wpframes (cdr (ASSOC 70 wpframesDict )))
(if (= wpframes 1)
  (alert "WipeOout Frames are on!")
  (alert "WipeOout Frames are off!")
)
 
Or change the status....
 
(SETQ wpframesDict (getdict "ACAD_WIPEOUT_VARS"))
(SETQ wpframes (ASSOC 70 wpframesDict ))
(SETQ wpframesVAL (cdr wpframes))
(if (= 1 wpframesVAL )
  (progn
    (setq wpframes0 (subst '(70 . 0) wpframes wpframesDict ))
    (entmod wpframes0 )
  )
  (progn
    (setq wpframes1 (subst '(70 . 1) wpframes wpframesDict ))
    (entmod wpframes1 )
  )
)
(command "regen") 