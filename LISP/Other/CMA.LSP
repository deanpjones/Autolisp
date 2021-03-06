 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  CMA: small flat cloud maker - works in either direction, allows undo, �
 ; �  snap and ortho toggle, and transparent Zoom and Pan, automatically    �
 ; �  subdivides segments longer than 9 x Dimscale (see line 48).           �
 ; �  Copyright 1993, 1995, 1996, 1998 by Rocket Software                   �
 ; �  They said it couldn't be done...no, sorry, they said it shouldn't.    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Herro - error handler.                                                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN HERRO (shk / pos entt enam sublst vall)
  (setq *error* esav)
  (if clay (setvar "clayer" clay))
  (setvar "plinewid" pwid)
  (setvar "blipmode" blip)
  (if (/= shk "Function cancelled") (write-line shk))
 (princ))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Herro end.                                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Subroutine Lenin - returns a list of points between two endpoints.    �
 ; �  Takes three arguments - two endpoints and a maximum distance to       �
 ; �  allow between points.                                                 �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN LENIN (pa pb maxd / angg dist ptlis)
  (setq angg (angle pa pb))
  (setq dist 1)
  (while (> (distance pa pb) maxd)
         (setq dist (marxs maxd))
         (setq pa (polar pa angg dist))
         (setq ptlis (append ptlis (list pa))))
 ptlis)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Lenin end.                                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Subroutine Marxs - pseudo-random number generator.                    �
 ; �  Takes one argument - the maximum number to return.                    �
 ; �  Returns a real between the maximum and one tenth thereof.             �
 ; �  Later - rehashed for smaller bulges.  Aside from this and the         �
 ; �  smaller bulge factor Cma is the same as CM.  (Also this routine       �
 ; �  has been renamed from Marx so that it won't screw up Cm.lsp.)         �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN MARXS (maxi / t1 dists)
(setq maxi (/ maxi 0.5))
;  (setq dists (list 1 0.1 0.75 0.35 0.65 0.25 0.5 0.1 0.7 0.5 0.25 0.65 0.35))
  (setq dists (list 0.35 0.1 0.45 0.35 0.15 0.25 0.15 0.1 0.27 0.35 0.2 0.15))
  (cond ((/= (type opops) 'int)
         (setq opops 0))
        ((> opops (- (length dists) 2))
         (setq opops 0))
        (t (setq opops (1+ opops))))
 (* maxi (nth opops dists)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Marxs end.                                                            �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  ChaCha - redraw a polyline so that no segment is over a set length.   �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN CHACHA (enam / dimscl maxd esav entt pasav pa pb ptlis ovlst)
  (setq dimscl (getvar "dimscale"))
  (setq maxd (* 9 dimscl))             ; maximum section length
  (setq esav enam)
  (while (/= (cdr (assoc 0 (setq entt (entget (setq enam (entnext enam))))))
             "SEQEND")
         (if pa (setq pb pa))
         (setq pa (cdr (assoc 10 entt)))
         (if (null pasav) (setq pasav pa))
         (if (and pa pb)
             (setq ptlis (lenin pb pa maxd))
             (setq ptlis ()))
         (if ptlis
             (setq ptlis (cons pb ptlis))
             (if pb (setq ptlis (list pb))))
         (if ptlis (setq ovlst (append ovlst ptlis))))
  (setq ptlis (lenin pa pasav maxd))
  (if ptlis
      (setq ptlis (cons pa ptlis))
      (if pa (setq ptlis (list pa))))
  (if ptlis (setq ovlst (append ovlst ptlis)))
  (command "erase" esav "")
  (command "pline")
  (while (setq pa (car ovlst))
         (setq ovlst (cdr ovlst))
         (command pa))
  (command "c")
 (princ))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  ChaCha end.                                                           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Subroutine Segtst - see if a polyline segment intersects a line       �
 ; �  drawn from a point.  Takes the point and segment ends as arguments    �
 ; �  and returns the intersection point (if any).                          �
 ; �  The line must be considered to be of infinite length so that it can   �
 ; �  hit any segment, but the intersection must be on the segment itself   �
 ; �  so that all tests of nonparallel lines don't produce an intersection. �
 ; �  Find the infinite length intersection, measure the distance between   �
 ; �  that and the start point, make the line that length and do an onseg   �
 ; �  test.                                                                 �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN SEGTST (pa segst segend / pb intrs dist)
  (setq pb (polar pa 0 100))
  (setq intrs (inters pa pb segst segend ()))
  (if intrs
     (progn
          (setq dist (1+ (distance pa intrs)))
          (setq pb (polar pa 0 dist))
          (setq intrs (inters pa pb segst segend))))
 intrs)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Segtst end.                                                           �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Subroutine CX - decide whether a point is inside or outside a pline.  �
 ; �  Takes the polyline ename and the test point as arguments, returns a   �
 ; �  string stating where it was.                                          �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN CX (pl pta / ints nn nname pasav pa intpt intlst pc)
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Have to check each segment to see if the test line intersects it,     �
 ; �  and keep a tally of the number of intersections.                      �
 ; �  A line exactly crossing a vertex will return an intersection for      � 
 ; �  both segments, so keep an intersection list and ignore duplicates.    �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq ints 0)
  (setq nn (entget (setq nname (entnext pl))))             ; first vertex
  (setq pasav (cdr (assoc 10 nn)))                         ; save location
  (while (/= (cdr (assoc 0 nn)) "SEQEND")
         (setq pa (cdr (assoc 10 nn)))
         (if (and pa pc (setq intpt (segtst pta pa pc)))   ; call inters finder
             (progn
                  (if (not (member intpt intlst))
                      (progn
                           (setq ints (1+ ints))
                           (setq intlst (cons intpt intlst))))))
         (setq pc pa)
         (setq nn (entget (setq nname (entnext nname)))))  ; next vertex
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Check the segment between the last vertex and the start point.        �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (if (and pasav pc)
      (if (segtst pta pasav pc)
          (setq ints (1+ ints))))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  If there are 0 or an odd number of intersections the point is         �
 ; �  outside the polyline (T), otherwise it is inside ().                  �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (if (= (/ ints 2) (/ ints 2.0)) T ()))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  CX end.                                                               �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  CMA - the vacuum tube.                                                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN C:CMA (/ bulge blip dimscl bapt pa plist p0 p1 pl seg nname pb angg
                                                         dist pta side nn)
  (setq bulge 0.5)
  (setvar "cmdecho" 0)
  (command "undo" "m")
  (setq blip (getvar "blipmode"))
  (setvar "blipmode" 0)
  (setq esav *error*)
  (setq *error* herro)
  (setq dimscl (getvar "dimscale"))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Save the current layer name, make Revision the new current one.       �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq clay (getvar "clayer"))
  (if (tblsearch "layer" "Border1")
      (setvar "clayer" "Border1")
      (command "-layer" "m" "Border1" "c" "10" "" ""))
  (if (setq plint (getvar "plinetype"))
      (setvar "plinetype" 0))
  (setq pwid (getvar "plinewid"))
  (setvar "plinewid" 0)
  (setq bapt "Select points, the narrow cloud will close after a <Return>: ")
  (command "pline")
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  The point acquisition/polyline draw/undo loop.                        �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (while (setq pa (getpoint bapt))
         (initget "U")                ; accept input of a U instead of a point
         (if (= pa "U")
             (if (> (length plist) 1)
                 (progn
                      (setq plist (cdr plist))
                      (command pa))
                 (prompt "No segments left to undo.\n"))
             (progn
                  (command pa)
                  (setq plist (cons pa plist))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  The next bit overwrites in red any segments which will be subdivided. �
 ; �  The progn/princ seems unneccessary, but without it the red marker     �
 ; �  doesn't appear the first time the routine is run.  Why this is and    �
 ; �  why this fix works I have no idea.                                    �
 ; �  Red grdraw lines disappear each time a new segment is added,          �
 ; �  presumably the whole pline is regenerated with each new segment.      �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
                  (if (and (> (length plist) 1)
                           (> (distance (setq p0 (car plist))
                                        (setq p1 (cadr plist))) (* 9 dimscl)))
                      (progn (princ) (grdraw p0 p1 1)))))
         (setq bapt (car plist)))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Loop end - polyline complete.                                         �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (command "c")                                            ; close polyline
  (setq pl (entlast))                                      ; Get pline ename
(print (entget pl))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Establish a test point beside the first segment.                      �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq seg (entget (setq nname (entnext pl))))            ; first vertex
  (setq pa (cdr (assoc 10 seg)))                           ; save location
  (setq seg (entget (entnext nname)))                      ; second vertex
  (setq pb (cdr (assoc 10 seg)))                           ; save location
  (setq angg (angle pa pb))                                ; segment angle
  (setq dist (distance pa pb))                             ; segment length
  (setq pta (polar pa angg (/ dist 2)))                    ; midpoint
  (setq pta (polar pta (+ angg (/ pi 2)) (/ dist 100)))    ; test point
  (setq side (cx pl pta))                                  ; outside = T
  (if side (setq bulge (* bulge -1)))                      ; t = reverse bulges
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Now insert extra vertices if any of the existing ones are too far     �
 ; �  apart.                                                                �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (chacha pl)
  (setq pl (entlast))                                      ; get pline ename
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Apply the bulges to the segments.                                     �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
  (setq nname pl)                                          ; save pline ename
  (setq nn (entget pl))                                    ; same entity
  (while (/= (cdr (assoc 0 nn)) "SEQEND")                  ; for each vertex
         (entmod (subst (cons 42 bulge) (assoc 42 nn) nn)) ; apply bulge
         (setq nn (entget (setq pl (entnext pl)))))        ; next vertex
  (entupd nname)                                           ; regen polyline
  (setvar "clayer" clay)
  (setvar "plinewid" pwid)
  (if plint (setvar "plinetype" plint))
  (setq *error* esav)
 (princ))

