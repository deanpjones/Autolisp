;Join.LSP:  Joins two broken colinear lines.
;
;__________________________________________________________________________


(defun c:jo (/ a b ai va vb dst1 dst2 a1 b1 a2 b2 ent1 ent2
                 end1 end2 dst3 dst4 oldlst newlst)

(defun mid (w z)
(LIST (/ (+ (CAR w) (CAR z))2) (/ (+ (CADR w) (CADR z))2))
)
  (setvar "cmdecho" 0)
  (setq a (cadr (entsel "\nSelect two lines to be joined: ")))
  (setq b (cadr (entsel)))
  (setq ai (mid a b))
  (SETQ va (ssget a))
  (setq vb (ssget b))
  (setq a1 (cdr (assoc 10 (entget (setq ent1 (ssname va 0))))))
  (setq b1 (cdr (assoc 11 (entget (ssname va 0)))))
  (setq a2 (cdr (assoc 10 (entget (setq ent2 (ssname vb 0))))))
  (setq b2 (cdr (assoc 11 (entget (ssname vb 0)))))
    (setq dst1 (distance ai a1))
    (setq dst2 (distance ai b1))
     (if (< dst1 dst2)(setq end1 b1)(setq end1 a1))
    (setq dst3 (distance ai a2))
    (setq dst4 (distance ai b2))
    (if (< dst3 dst4)(setq end2 b2)(setq end2 a2))
(setq oldlst (entget ent1))
(setq newlst (subst (cons 10 end1)(assoc 10 oldlst) oldlst))
(setq newlst (subst (cons 11 end2)(assoc 11 newlst) newlst))
(entdel ent2)
(entdel ent1)
(entmake (cdr newlst))
(princ)
)
