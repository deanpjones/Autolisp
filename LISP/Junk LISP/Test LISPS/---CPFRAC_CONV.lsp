;;;Swap TEXT strings with two selections.
;;;Conversion for CPFRAC.SHX files


(defun conv_to_cpfrac ( dim / numer pos denom )
 
; convert fraction string to CPFRAC style
;
;   usage (conv_to_cpfrac "2'-7 15/16\"")
;
;   converts 2'-7 15/16 to 2'-7[15\\16]
;   converts 4-1/8 to 4[1\\8]
;   converts 5/16\" to [5\\16]\"
 
  (if (setq pos (vl-string-search "/" dim))
    (progn
      (setq 
        pos   (1+ pos)
        numer (1- pos)
      )
      (while 
        (and 
          (> numer 0)
          (<= "0" (substr dim numer 1) "9")
        ) 
        (setq numer (1- numer))
      )
      (setq denom (1+ pos))
      (while (<= "0" (substr dim denom 1) "9") 
        (setq denom (1+ denom))
      )
      (strcat
        (substr dim 1 (max 0 (1- numer)))
        "["
        (substr dim (1+ numer) (- pos numer 1))
        "\\"
        (substr dim (1+ pos) (- denom pos 1))
        "]"
        (substr dim denom)
      )
    )
    (eval dim)
  )
)

