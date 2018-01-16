(vl-load-com)
;;-----------------------------------------------
;; CDNC5-02.LSP
;; Bill Kramer
;;
;; Find all intersections between objects in
;; the selection set SS.
;;
;; ---------------------------------------------- BEGIN LISTING 1
;;
(defun get_all_inters_in_SS (SS /
			     SSL ;length of SS
			     PTS ;returning list
			     aObj1 ;Object 1
			     aObj2 ;Object 2
			     N1  ;Loop counter
			     N2  ;Loop counter
			     iPts ;intersects
			     )
  (setq N1 0 ;index for outer loop
	SSL (sslength SS))
  ; Outer loop, first through second to last
  (while (< N1 (1- SSL))
    ; Get object 1, convert to VLA object type
    (setq aObj1 (ssname SS N1)
	  aObj1 (vlax-ename->vla-object aObj1)
	  N2 (1+ N1)) ;index for inner loop
    ; Inner loop, go through remaining objects
    (while (< N2 SSL)
      ; Get object 2, convert to VLA object
      (setq aObj2 (ssname SS N2)
	    aObj2 (vlax-ename->vla-object aObj2)
	    ; Find intersections of Objects
	    iPts (vla-intersectwith aObj1
		   aObj2 0)
	    ; variant result
	    iPts (vlax-variant-value iPts))
      ; Variant array has values?
      (if (> (vlax-safearray-get-u-bound iPts 1)
	     0)
	(progn ;array holds values, convert it
	  (setq iPts ;to a list.
		 (vlax-safearray->list iPts))
	  ;Loop through list constructing points
	  (while (> (length iPts) 0)
	    (setq Pts (cons (list (car iPts)
				  (cadr iPts)
				  (caddr iPts))
			    Pts)
		  iPts (cdddr iPts)))))
      (setq N2 (1+ N2))) ;inner loop end
    (setq N1 (1+ N1))) ;outer loop end
  Pts) ;return list of points found
;;-----------------------------------------------   END LISTING 1
;;
;; Remaining lines of code for download version, used to demonstrate and test the utility in Listing 1.
;;
;; Process - Create drawing with intersecting lines and lwpolylines.
;;           Load function set
;;           Run command function INTLINES
;;           Intersections are marked with POINT objects on current layer
;;
(defun C:INTLINES ()
  (prompt "\nINTLINES running to demonstrate GET_ALL_INTERS_IN_SS function.")
  (setq SS1 (get_all_lines_as_SS)
	PTS (get_all_inters_in_ss SS1)
        )
  (foreach PT PTS ;;Loop through list of points
    (command "_POINT" PT)) ;;Create point object
  (setvar "PDMODE" 34) ;;display points so you can see them
  (command "_REGEN")
)
;;
;;-----------------------------------------------
;;  Get all lines and lwpolyline objects in the
;;  drawing and return as a selection set.
;;
(defun get_all_Lines_as_SS ()
  (ssget "X" '((0 . "LINE,LWPOLYLINE"))))
;;
