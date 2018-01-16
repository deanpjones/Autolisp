;; Written by: Lee Ambrosius
;; Created on: 4/7/2004

;; This program allows you to add Background Mask to several Mtext objects
;; at one time instead of using the Mtext editor for each object or the Properties Palette.

;; The Properties Palette in 2005 doesn't allow you to set Background Color or Border Offset.

(prompt "\nMTEXTMASK.lsp loaded...  Enter MTM to run  ")
(defun c:MTM ( / kWordBackgroundMaskCurrent dOffsetCurrent ssMtext dxf90 dxf63 dxf45 dxf441)
  (prompt "\nApply Mtext Mask")

  (if (= kWordBackgroundMask nil)
    (setq kWordBackgroundMask "Background" kWordBackgroundMaskCurrent "Background")
    (setq kWordBackgroundMaskCurrent kWordBackgroundMask)
  )

  (initget "None Background Color")
  (setq kWordBackgroundMask (getkword (strcat "\nSpecify Background Mask: [None/Background/Color] <" kWordBackgroundMask ">: ")))

  (if (= kWordBackgroundMask nil)
    (setq kWordBackgroundMask kWordBackgroundMaskCurrent)
  )

  (cond ((= kWordBackgroundMask "Color")
            (if (or (= maskClr nil) (/= (type maskClr) 'LIST))
               (setq maskClr (acad_truecolorcli 1))
               (if (= (assoc 420 maskClr) nil)
                 (setq maskClr (acad_truecolorcli (cdr (assoc 62 maskClr))))
                 (setq maskClr (acad_truecolorcli (assoc 420 maskClr)))
               )
            )
        )
        ((= kWordBackgroundMask "Background")(setq maskClr 256))
        ((= kWordBackgroundMask "None")(setq maskClr 0 dOffset 1.25))
  )

  (if (/= maskClr nil)
    (progn
      (if (/= kWordBackgroundMask "None")
        (progn
          (setq dOffsetCurrent dOffset)

          (if (= dOffsetCurrent nil)
            (setq dOffset 1.25 dOffsetCurrent 1.25)
            (setq dOffsetCurrent dOffset)
          )

          (setq dOffset (getreal (strcat "\nSpecify border offset factor: <" (rtos dOffsetCurrent 2 3) ">: ")))
    
          (if (= dOffset nil)
            (setq dOffset dOffsetCurrent)
          )

          (if (> dOffset 5)(setq dOffset nil))
          (if (< dOffset 1)(setq dOffset nil))

          (while (= dOffset nil)
            (setq dOffset (getreal (strcat "\nSpecify border offset factor: <" (rtos dOffsetCurrent 2 3) ">: ")))
 
            (if (> dOffset 5)(setq dOffset nil))
            (if (< dOffset 1)(setq dOffset nil))
          )
        )
        (if (= dOffset nil)
          (setq dOffset 1.25)
        )
      )

      (if (setq ssMtext (ssget (list (cons 0 "MTEXT"))))
        (progn
          (cond ((= kWordBackgroundMask "None")
                    (setq mask_list (list (cons 90 2)(cons 63 0)(cons 45 dOffset)(cons 441 0))
                          dxf90 2
                          dxf63 nil
                          dxf45 nil
                          dxf441 nil
                    )
                )
                ((and (= kWordBackgroundMask "Color")(/= (assoc 420 maskClr) nil))
                    (setq mask_list (list (cons 90 1)(cons 63 1)(cons 421 (cdr (assoc 420 maskClr)))(cons 45 dOffset)(cons 441 (cdr (assoc 420 maskClr))))
                          dxf90 1
                          dxf63 2
                          dxf45 dOffset
                          dxf441 (cdr (assoc 420 maskClr))
                    )
                )
                ((and (= kWordBackgroundMask "Color")(= (assoc 420 maskClr) nil))
                    (setq mask_list (list (cons 90 1)(cons 63 (cdr (assoc 62 maskClr)))(cons 45 dOffset)(cons 441 2146608))
                          dxf90 1
                          dxf63 (cdr (assoc 62 maskClr))
                          dxf45 dOffset
                          dxf441 nil
                    )
                )
                ((= kWordBackgroundMask "Background")
                    (setq mask_list (list (cons 90 3)(cons 63 3)(cons 45 dOffset)(cons 441 0))
                          dxf90 3
                          dxf63 256
                          dxf45 dOffset
                          dxf441 0
                    )
                )
          )

          (setq emax (sslength ssMtext)
                sscount 0
          )

          (while (< sscount emax)
            (setq EN (entget (ssname ssMtext sscount))
		  tempEN nil)

            (if (/= dxf90 nil)
              (progn
                (if (/= (assoc 90 EN) nil)
                  (setq EN (subst (cons 90 dxf90) (assoc 90 EN) EN))
                  (setq EN (append EN (list (cons 90 dxf90))))
                )
              )
              (progn
                (setq CNT 0
                      nMembers (member (assoc 90 EN) EN))

                (if (= nMembers nil)
                  (setq nMembers 0)
		  (setq nMembers (length nMembers))
		)
                (repeat (- (length EN) nMembers)
                  (setq tempEN (append tempEN (list (nth cnt EN))))
                  (setq CNT (1+ CNT))
                )

		(if (> nMembers 0)
		  (progn
		    (setq CNT 1)
                    (repeat (- nMembers 1)
                      (setq tempEN (append tempEN (list (nth cnt (member (assoc 90 EN) EN)))))
                      (setq CNT (1+ CNT))
		    )
		  )
                )
                (setq EN tempEN
		      tempEN nil)
              )
            )

	    
            (if (/= dxf63 nil)
              (progn
                (if (/= (assoc 63 EN) nil)
                  (setq EN (subst (cons 63 dxf63) (assoc 63 EN) EN))
                  (setq EN (append EN (list (cons 63 dxf63))))
                )
              )
              (progn
                (setq CNT 0
                      nMembers (member (assoc 63 EN) EN))

                (if (= nMembers nil)
                  (setq nMembers 0)
		  (setq nMembers (length nMembers))
		)
                (repeat (- (length EN) nMembers)
                  (setq tempEN (append tempEN (list (nth cnt EN))))
                  (setq CNT (1+ CNT))
                )

		(if (> nMembers 0)
		  (progn
		    (setq CNT 1)
                    (repeat (- nMembers 1)
                      (setq tempEN (append tempEN (list (nth cnt (member (assoc 63 EN) EN)))))
                      (setq CNT (1+ CNT))
		    )
		  )
                )
                (setq EN tempEN
		      tempEN nil)
              )
            )

            (if (/= dxf45 nil)
              (progn
                (if (/= (assoc 45 EN) nil)
                  (setq EN (subst (cons 45 dxf45) (assoc 45 EN) EN))
                  (setq EN (append EN (list (cons 45 dxf45))))
                )
              )
              (progn
                (setq CNT 0
                      nMembers (member (assoc 45 EN) EN))

                (if (= nMembers nil)
                  (setq nMembers 0)
		  (setq nMembers (length nMembers))
		)
                (repeat (- (length EN) nMembers)
                  (setq tempEN (append tempEN (list (nth cnt EN))))
                  (setq CNT (1+ CNT))
                )

		(if (> nMembers 0)
		  (progn
		    (setq CNT 1)
                    (repeat (- nMembers 1)
                      (setq tempEN (append tempEN (list (nth cnt (member (assoc 45 EN) EN)))))
                      (setq CNT (1+ CNT))
		    )
		  )
                )
                (setq EN tempEN
		      tempEN nil)
              )
            )

            (if (/= dxf441 nil)
              (progn
                (if (/= (assoc 441 EN) nil)
                  (setq EN (subst (cons 441 dxf441) (assoc 441 EN) EN))
                  (setq EN (append EN (list (cons 441 dxf441))))
                )
              )
              (progn
                (setq CNT 0
                      nMembers (member (assoc 441 EN) EN))

                (if (= nMembers nil)
                  (setq nMembers 0)
		  (setq nMembers (length nMembers))
		)
                (repeat (- (length EN) nMembers)
                  (setq tempEN (append tempEN (list (nth cnt EN))))
                  (setq CNT (1+ CNT))
                )

		(if (> nMembers 0)
		  (progn
		    (setq CNT 1)
                    (repeat (- nMembers 1)
                      (setq tempEN (append tempEN (list (nth cnt (member (assoc 441 EN) EN)))))
                      (setq CNT (1+ CNT))
		    )
		  )
                )
                (setq EN tempEN)
              )
	      
            )

            (entmod EN)
            (setq sscount (1+ sscount))
          )
        )
      )
    )
  )
 (princ)
)
(princ)