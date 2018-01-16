
;;;CODING STARTS HERE

;|To customise this to suit your plotters, you need to do 3 things :

Create a PC3 plot configuration file and replace the value of the
variable "pltyp" with the name of your PC3 file.
eg. Replace  "RW-470 PLOTBASE.pc3" with "YOURPLOTTER.pc3"

Create a CTB plot style and replace the value of the variable "plstyle"
with the name of your CTB file.
eg. Replace "acad.ctb" with "your.ctb"

Replace all the "plsize" variables with your sheet sizes.

==============================================|;

(defun C:Q-PLOT ( / userclick userclick1 pltyp plstyle plsize
                              oldblip oldecho oldsnap dcl_id)

     ;preset the flags
     (setq userclick T)
     (setq userclick1 T)

     ;store system settings
     (setq oldblip (getvar "BLIPMODE")
              oldecho (getvar "CMDECHO")
              oldsnap (getvar "OSMODE"))

     ;set system variables
     (setvar "BLIPMODE" 0)
     (setvar "CMDECHO" 0)
     (setvar "OSMODE" 32)

     ;store the default plotter, plot style and plot size

     ;replace this with your pc3 file
     (setq pltyp "RW-470 PLOTBASE.pc3")
     ;replace this with your ctb file
     (setq plstyle "acad.ctb")
     ;replace this with your default sheet size
     (setq plsize "ISO A0 (1189.00 x 841.00 MM)")

     ;get the plotting area
     (setq pt1 (getpoint "\nSelect Lower Left Hand Corner
                 of Plotting Area: "))
     (setq pt2 (getcorner pt1 "\nSelect Upper Right Hand
                 Corner of Plotting Area: "))

     ;remember your manners
     (prompt "\nThanks.......")
     
     ;load the dialog
     (setq dcl_id (load_dialog "q-plot.dcl"))
     (if (not (new_dialog "qplot" dcl_id) ) (exit))
     (set_tile "rb1" "1")
     (set_tile "rb5" "1")

      ; set the tiles

      ;replace this with your first pc3 file
      (action_tile "rb1"
         "(setq pltyp \"RW-470.pc3\")")

     ;replace this with your second pc3 file
     (action_tile "rb2"
         "(setq pltyp \"DesignJet 700.pc3\")")

     ;replace all sheet sizes to match yours
     (action_tile "rb5"
         "(setq plsize \"ISO A0 (1189.00 x 841.00 MM)\")")
     (action_tile "rb6"
         "(setq plsize \"ISO A1 (841.00 x 594.00 MM)\")")
     (action_tile "rb7"
         "(setq plsize \"ISO A2 (594.00 x 420.00 MM)\")")
     (action_tile "rb8"
         "(setq plsize \"ISO A3 (420.00 x 297.00 MM)\")")
     (action_tile "rb9"
         "(setq plsize \"ISO A4 (297.00 x 210.00 MM)\")")
      (action_tile "cancel"
         "(done_dialog)(setq userclick nil)")
     (action_tile "accept"
         "(done_dialog) (setq userclick T)")

     ;start the dialog
     (start_dialog)

     ;unload the dialog
     (unload_dialog dcl_id)

  ;if OK is selected
  (if userclick

    ;do the following
    (progn

        ;preview the plot
        (command "Preview")

            ;load the "Continue" dialog
            (setq dcl_id (load_dialog "q-plot.dcl"))
            (if (not (new_dialog "choose" dcl_id) ) (exit))

            ;set up the tiles
            (action_tile "cancel"
            "(done_dialog)(setq userclick1 nil)")
            (action_tile "accept"
            "(done_dialog) (setq userclick1 T)")
            (start_dialog)
            (unload_dialog dcl_id)

       ;if it's OK to continue
       (if userclick1

       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Modelspace
(command "-plot" "y" "Model" Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" ctbFile "y" "As displayed" "n" "n" "yes")
;Paperspace
(command "-plot" "y" (getvar "CTAB") Plotter "11x17" "Inches" "Landscape" "n" 
	"Extents" "Fit" "Center" "y" ctbFile "y" "n" "n" "n" "n" "n" "yes")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       
        ;plot the drawing
        (command "-plot" "Yes" "Model" pltyp plsize "Millimeters"
                 "Landscape" "No" "Window" pt1 pt2 "Fit" "Center" 
                 "Yes" plstyle "Yes" "No" "No" "Yes" "Yes")

        ;the plot was Cancelled
        ;return to the main dialog
        (c:autoplot)

       );if userclick1
                  
       );progn

  );if userclick

     ;reset system variables
     (setvar "BLIPMODE" oldblip)
     (setvar "CMDECHO" oldecho)
     (setvar "OSMODE" oldsnap)

 (princ)

);defun c:q-plot

;;;*======================================================
(princ)

;CODING ENDS HERE
 
