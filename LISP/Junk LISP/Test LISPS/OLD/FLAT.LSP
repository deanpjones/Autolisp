 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Flat - move entities back to ground level.                            ³
 ; ³  Copyright 1993, 1999 by Rocket Software                               ³
 ; ³  There's no bottom in information space - you just keep falling.       ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Note: if this routine is used on a Polyline it will move the entity   ³
 ; ³  down to ground level but the vertex definitions will claim to be      ³
 ; ³  untouched. If (entmod (subst (list 10 1 2 0) (10 3 4 1000) entt))     ³
 ; ³  the result will be (10 1 2 1000) - the X and Y are changed but not    ³
 ; ³  the Z.  Even modifying a single vertex with Chgx can't get around     ³
 ; ³  this. If, on the other hand, one performs the same operation on a     ³
 ; ³  polyline made with the 3dpoly command everything will work fine.      ³
 ; ³  Both entities are (0 . "POLYLINE"), although the 70 code for the 3D   ³
 ; ³  one is 8 as opposed to 0. If either is exploded after Flattening the  ³
 ; ³  resulting lines appear at zero elevation.  Inserts appear to move     ³
 ; ³  with no trouble.                                                      ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Subroutine Iron: does the actual work.                                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN IRON (enam / entt ten elev twelve thirt cfort)
  (setq entt (entget enam))
  (setq ten (cdr (assoc 10 entt)))
  (setq ten (list (car ten) (cadr ten) 0))
  (setq entt (subst (cons 10 ten) (assoc 10 entt) entt))
  (if (setq elev (cdr (assoc 11 entt)))
      (progn
          (setq elev (list (car elev) (cadr elev) 0))
          (setq entt (subst (cons 11 elev) (assoc 11 entt) entt))))
  (if (setq twelve (cdr (assoc 12 entt)))
      (progn
          (setq twelve (list (car twelve) (cadr twelve) 0))
          (setq entt (subst (cons 12 twelve) (assoc 12 entt) entt))))
  (if (setq thirt (cdr (assoc 13 entt)))
      (progn
          (setq thirt (list (car thirt) (cadr thirt) 0))
          (setq entt (subst (cons 13 thirt) (assoc 13 entt) entt))))
  (if (setq cfort (cdr (assoc 14 entt)))
      (progn
          (setq cfort (list (car cfort) (cadr cfort) 0))
          (setq entt (subst (cons 14 cfort) (assoc 14 entt) entt))))
  (if (setq fift (cdr (assoc 15 entt)))
      (progn
          (setq fift (list (car fift) (cadr fift) 0))
          (setq entt (subst (cons 15 fift) (assoc 15 entt) entt))))
  (if (setq sixt (cdr (assoc 16 entt)))
      (progn
          (setq sixt (list (car sixt) (cadr sixt) 0))
          (setq entt (subst (cons 16 sixt) (assoc 16 entt) entt))))
  (entmod entt))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Subroutine Iron end.                                                  ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Flat - the CNS.  Decides what needs to be done and does it.  No       ³
 ; ³  messing around.  Not one of your wishy-washy programs.  We're         ³
 ; ³  talking a major improvement over programs with no clear idea of       ³
 ; ³  what to do (generally written for Windows).                           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN C:FLAT ( / num ss len enam entt)
  (setvar "cmdecho" 0)
  (command "undo" "m")
  (setq num 0)
  (write-line "Select entities: ")
  (setq ss (ssget))
  (if ss
     (progn
          (setq len (strcat "/" (itoa (sslength ss))))
          (while (setq enam (ssname ss num))
                 (setq num (1+ num))
                 (grtext -2 (strcat (itoa num) len))
                 (setq entt (entget enam))
                 (if (setq asoc38 (assoc 38 entt))
                     (progn
                          (entmod (subst (cons 38 0) asoc38 entt))
                          (setq entt (entget enam))))
                 (if (assoc 66 entt)
                     (progn
                         (iron enam)
                         (while (/= (cdr (assoc 0 entt)) "SEQEND")
                                (setq entt (entget (setq enam (entnext enam))))
                                (iron enam)))
                     (iron enam)))))
  (if (/= (setq otis (getvar "elevation")) 0)
      (write-line (strcat "Caution: Elevation is currently set to "
                           (rtos otis 2 2))))
 (PRINC))