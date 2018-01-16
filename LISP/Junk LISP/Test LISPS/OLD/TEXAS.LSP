 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Texas - multiple text changer for everything.                         ³
 ; ³  Copyright 1994, 1999 by Rocket Software                               ³
 ; ³  This routine is dedicated to Carol, who used to live there.           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Lone - error handler.                                                 ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN LONE (shk /)
  (setq *error* esav)
  (if (/= shk "Function cancelled") (write-line shk))
  (setvar "snapmode" snapp)
  (if relst
      (while (setq next (car relst))
             (setq relst (cdr relst))
             (redraw next 4)))
 (princ))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Lone end.                                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Texas.                                                                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN C:TEXAS (/ texlst renam relst nent e1 enam next entt typ outer cc nn)
  (setvar "cmdecho" 0)
  (command "undo" "mark")
  (setq esav *error*)
  (setq *error* lone)
  (setq snapp (getvar "snapmode"))
  (setvar "snapmode" 0)
  (while (setq tex (nentsel "\nSelect pseudotext: "))
         (setq typ (cdr (assoc 0 (entget (car tex)))))
         (if (or (= "TEXT" typ) (= "ATTDEF" typ) (= "ATTRIB" typ))
             (progn
                  (princ (cdr (assoc 1 (setq e1 (entget (car tex))))))
                  (redraw (setq renam (cdr (assoc -1 e1))) 3)
                  (setq relst (cons renam relst))
                  (setq texlst (cons tex texlst)))))
  (if texlst
     (progn
         (setq cc (getstring t "\nNew text or <Return> to select: "))
         (if (= cc "")
             (progn
                  (setq nn (nentsel "\nSelect source text:\n"))
                  (if nn (setq cc (assoc 1 (entget (car nn)))))
                  (if cc (setq cc (cdr cc)))))
         (if (and cc (/= cc ""))
             (progn
                  (while (setq next (car relst))
                         (setq relst (cdr relst))
                         (redraw next 4))
                  (while (setq next (car texlst))
                         (setq texlst (cdr texlst))
                         (setq enam (car (setq nent next)))
                         (setq typ (cdr (assoc 0 (setq entt (entget enam)))))
                         (if (or (= "TEXT" typ) (= "ATTDEF" typ)
                                 (= "ATTRIB" typ))
                             (progn
                              (setq outer (car (reverse (car (reverse nent)))))
                              (entmod (subst (cons 1 cc) (assoc 1 entt) entt))
                              (entupd enam)
                              (if (= (type outer) 'ENAME) (entupd outer))))))))
     (write-line "\nNo suitable entities selected."))
  (setvar "snapmode" snapp)
  (setq *error* esav)
 (princ))