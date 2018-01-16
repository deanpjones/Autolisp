;;
;;;
;;;    REVCLOUD.LSP
;;;    Copyright © 1999 by Autodesk, Inc.
;;;
;;;    Your use of this software is governed by the terms and conditions of the
;;;    License Agreement you accepted prior to installation of this software.
;;;    Please note that pursuant to the License Agreement for this software,
;;;    "[c]opying of this computer program or its documentation except as
;;;    permitted by this License is copyright infringement under the laws of
;;;    your country.  If you copy this computer program without permission of
;;;    Autodesk, you are violating the law."
;;;
;;;    AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS.
;;;    AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
;;;    MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC.
;;;    DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
;;;    UNINTERRUPTED OR ERROR FREE.
;;;
;;;    Use, duplication, or disclosure by the U.S. Government is subject to
;;;    restrictions set forth in FAR 52.227-19 (Commercial Computer
;;;    Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
;;;    (Rights in Technical Data and Computer Software), as applicable.
;;;
;;;  ----------------------------------------------------------------
 
 
(Defun C:REVCLD (/
     DIM_SCALE    ; dimscale place holder
     ARC_LENGTH   ; chord length of included arc
     INC_ANGLE    ; included angle in degrees
     LAST_PT      ; the last point just entered/shown
     START_PT     ; where the cloud began
     NEXT_PT      ; where we are going next
     TMP          ; tempory holder for radius of bulge
     SAVED_EN
     READTYP
     READVAL
     ARC_STYLE
     LOOP
     OPTIONS
     )
 
   (acet-error-init
      (List
         (List "cmdecho" 0
               "blipmode" 0
               "osmode" 0
               "limcheck" 0
               "plinewid" 0
         )
         nil     ;flag. True means use undo for error clean up.
      ) ;list
   );acet-error-init
 
 
 
; ----------------------------------------------------------------
;                          MAIN PROGRAM
; ----------------------------------------------------------------
 
   (setq INC_ANGLE   110
         ARC_LENGTH  (getenv "ACET-REVCLOUD-BULGE")
         DIM_SCALE   (if (= (getvar "DIMSCALE") 0)
                       1
                       (getvar "DIMSCALE")
                     )
         ARC_STYLE   (getenv "ACET-REVCLOUD-STYLE")
         LOOP        T
   )
 
   (if (and ARC_LENGTH (/= (setq ARC_LENGTH (atof ARC_LENGTH)) 0))
     (setq ARC_LENGTH (* ARC_LENGTH DIM_SCALE))                               ; If default available use that
     (setq ARC_LENGTH (* DIM_SCALE (if (= (getvar "MEASUREMENT") 1) 15 0.5))) ; else set default based on current units
   );end if
 
   (if (not ARC_STYLE)
     (setq ARC_STYLE "Normal")
   )
 
   (setq OPTIONS (list ARC_LENGTH ARC_STYLE))
 
 
; -------------------------- Prompt User -------------------------
 
   (while LOOP
 
     (initget "Options Arc eXit _Options Arc eXit")                           ; leaving 'arc' option for backward compatibility
 
     (prompt (acet-str-format "\nArc length = %1, Arc style = %2" (ai_rtos ARC_LENGTH) ARC_STYLE))
     (setq LAST_PT (GetPoint "\nSpecify cloud starting point or [eXit/Options] <eXit>: "))
 
     (cond
       ((or (= LAST_PT "Arc") (= LAST_PT "Options"))
         (setq OPTIONS    (bns_rc_set_options OPTIONS)
               ARC_LENGTH (car OPTIONS)
               ARC_STYLE  (cadr OPTIONS)
         )
       )
       ((or (not LAST_PT)(= LAST_PT "eXit"))
         (setq LOOP    nil
               LAST_PT nil
         )
       )
       ((= (type LAST_PT) 'LIST)
         (setq ARC_LENGTH (car OPTIONS)
               ARC_STYLE  (cadr OPTIONS)
               LOOP       nil
         )
       )
     )
 
   )
 
   (setenv "ACET-REVCLOUD-BULGE" (rtos (/ (car OPTIONS) DIM_SCALE) 2))
   (setenv "ACET-REVCLOUD-STYLE" (cadr OPTIONS))
 
; ---------------------- Start Drawing Cloud ---------------------
 
   (if LAST_PT
     (progn
       (setq START_PT LAST_PT
             SAVED_EN (entlast))
       (Prompt "\nGuide crosshairs along cloud path...")
       (Command "_.pline" LAST_PT "_a" "_a" INC_ANGLE LAST_pt "_a" INC_ANGLE)
     )
   ) ;end IF LAST_PT
 
   (While LAST_PT                                      ; As long as we have a last point value,
      (Setq NEXT_PT (GrRead 1)                         ; real time read
            READTYP (car NEXT_PT)                      ; get type of read
            READVAL (cadr NEXT_PT)                     ; get value of read
      )
      (cond
        ((or (= 5 READTYP) (= 3 READTYP))              ; read a position or a pick?
          (setq NEXT_PT (cadr NEXT_PT))
          (if (or (> (distance LAST_PT NEXT_PT) ARC_LENGTH) (= READTYP 3)) ; if the user picked  point
            (Progn                                                         ; or the arc chord length has been reached
              (Command NEXT_PT "_a" INC_ANGLE)                             ; draw the arc
              (Setq LAST_PT NEXT_PT)
            )
            (Progn
              (command NEXT_PT "_u")
              (if (= ARC_STYLE "Calligraphy")
                (command "_w" "0" (* ARC_LENGTH 0.10))
              )
              (command "_a" INC_ANGLE)
            )
          )
          (if (>
                (Distance LAST_PT NEXT_PT)
                (Distance START_PT NEXT_PT)
              )
            (Progn
              (Command START_PT "_cl")
              (Setq LAST_PT Nil)
              (prompt "\nCloud finished.")
            )
          )
        )
        ((and (= 11 READTYP)                           ; Mouse click and
              (= 0 READVAL)                            ; Right button
         )
          (command LAST_PT "_u" "")
          (Setq LAST_PT Nil)                           ; then end the command
        )
        ((and (= 2 READTYP)                            ; Key was pressed
           (or
             (= 13 READVAL)                            ; and it was either the return
             (= 32 READVAL)                            ; or the space bar
           )
         )
          (command LAST_PT "_u" "")
          (Setq LAST_PT Nil)                           ; then end the command
        )
        (T
          (prompt "\nMove the pointer to draw the cloud")
        )
      )
   );End while
   (acet-error-restore)
   (Princ)
) ;end cloud.lsp
 
 
 
; ------------------- GET OPTIONS FUNCTION -----------------------
;  This function takes a list of the current settings (currently
;  arc chord length and arc style). It then launches the dialog.
;  If the dialog returns a value of 2, the user is prompted to
;  pick points for the arc chord length.
;
;  The function returns a list of the new values
; ----------------------------------------------------------------
 
 
(defun bns_rc_set_options (OPTIONS / ARC_LENGTH ARC_STYLE RETURN TMP)
 
  (setq ARC_LENGTH (car OPTIONS)
        ARC_STYLE  (cadr OPTIONS)
        RETURN     (show_rc_dialog)
  )
 
  (while (= RETURN 2)
    (initget 6)
    (setq TMP (getdist (acet-str-format "\nSpecify arc length <%1>: "  (ai_rtos ARC_LENGTH))))
    (if TMP
       (setq ARC_LENGTH TMP)
    )
    (setq RETURN (show_rc_dialog))
  )
  OPTIONS
)
 
 
; ----------------- OPTIONS DIALOG FUNCTION ---------------------
;  This function launches the options dialog.
; ----------------------------------------------------------------
 
(defun show_rc_dialog ( / set_style get_length dlg_exit DCL_IDX X Y RETURN )
 
   (if (> (setq DCL_IDX (load_dialog "REVCLOUD")) 0) ; Load dialog file
     (if (new_dialog "Revcloud" DCL_IDX)              ; Load dialog
       (progn
 
; ---------------------- CALLBACK set_style ----------------------
;  This function is called whenever the style radio buttons or
;  the style image button are selected
; ----------------------------------------------------------------
 
          (defun set_style (KEY / X Y ACTIVE)
            (setq X (dimx_tile "imgStyle")
                  Y (dimy_tile "imgStyle")
            )
 
            (cond
              ((= KEY "radNormal")
                (setq ACTIVE    "rev_norm"
                      ARC_STYLE "Normal"
                )
              )
              ((= KEY "radCalligraphy")
                (setq ACTIVE    "rev_clfy"
                      ARC_STYLE "Calligraphy"
                )
              )
              (T
                (if (= (get_tile "radNormal") "1")
                  (progn
                    (setq ACTIVE "rev_clfy"
                      ARC_STYLE  "Calligraphy"
                    )
                    (set_tile "radCalligraphy"  "1")
                  )
                  (progn
                    (setq ACTIVE "rev_norm"
                      ARC_STYLE  "Normal"
                    )
                    (set_tile "radNormal"  "1")
                  )
                )
              )
            )
 
            (start_image "imgStyle")
              (fill_image 0 0 X Y 0)
              (slide_image 0 0 X Y ACTIVE)
            (end_image)
          )
 
; --------------------- CALLBACK get_length ----------------------
;  This function is called whenever the length edit box is exited
; ----------------------------------------------------------------
 
          (defun get_length (VALUE / RVAL)
 
            (setq VALUE (strcase VALUE)
                   RVAL (distof VALUE)
            )
 
            (cond
              ((or (= VALUE "") (<= RVAL 0.0))
                (set_tile "error" "Arc length must positive and nonzero.")
              )
              (T
                (set_tile "error" "")
                (setq ARC_LENGTH (distof VALUE))
                (set_tile "edtLength" (ai_rtos ARC_LENGTH))
              )
            );cond
          );defun
 
 
; --------------------- CALLBACK exit dialog ---------------------
;  This function is called whenever the main dialog is exited.
; ----------------------------------------------------------------
 
          (defun dlg_exit ()
            (setq OPTIONS (list ARC_LENGTH ARC_STYLE))
            (done_dialog 1)
          )
 
; ---------------------- Dialog Tile Actions ---------------------
 
         (setq X (dimx_tile "imgStyle")
               Y (dimy_tile "imgStyle")
         )
 
         (if (= ARC_STYLE "Normal")
           (progn
             (start_image "imgStyle")
               (slide_image 0 0 X Y "rev_norm")
             (end_image)
             (set_tile "radNormal" "1")
           )
           (progn
             (start_image "imgStyle")
               (slide_image 0 0 X Y "rev_clfy")
             (end_image)
             (set_tile "radCalligraphy" "1")
           )
         )
 
         (setq X (dimx_tile "imgLength")
               Y (dimy_tile "imgLength")
         )
 
         (start_image "imgLength")
           (slide_image 0 0 X Y "rev_lgth")
         (end_image)
 
         (set_tile "edtLength" (ai_rtos ARC_LENGTH))
 
         (action_tile "radNormal" "(set_style $key)")
         (action_tile "radCalligraphy" "(set_style $key)")
         (action_tile "imgStyle" "(set_style $key)")
         (action_tile "edtLength" "(get_length $value)")
         (action_tile "btnPick" "(done_dialog 2)")
 
         (action_tile "accept" "(dlg_exit)")
         (action_tile "help" "(acet-help \"REVCLOUD\")")
 
         (setq RETURN (start_dialog))
 
       ) ; end progn
       (alert "Unable to display dialog box")
     ) ; end if new dialog
     (alert "Unable to load dialog box")
   ) ; end if load
   RETURN
)


(princ)
