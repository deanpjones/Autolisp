

(defun Fib (/ mylength fib a b c d)

)

;**************************
;Enter length of Fibinochi sequence.
(setq mylength (getint "\nEnter an integer: ")) 

(setq fib (list 2 1 1 0))
;-------------------------
(repeat (- mylength 4)

(setq a (nth 1 fib))
(setq b (nth 0 fib))

(setq c (+ a b))
(setq fib (cons c fib))
)
;-------------------------
;**************************

;**************************
;Draw blocks using sequence.
(defun c:listDXF2 ()
(setq en (entsel "\nSelect block to spiral: "))(setq txt (car en))(setq txtdxf (entget txt))

;block (0 . "INSERT")
(setq block (cdr (assoc 0 txtdxf)))
;layer (8 . "0")
(setq layer (cdr (assoc 8 txtdxf)))
;blockname(2 . "Square-4")
(setq blockname (cdr (assoc 2 txtdxf)))
;xyz (10 110.0 112.0 0.0)
(setq blockX (nth 0 (cdr (assoc 10 txtdxf))))
(setq blockY (nth 1 (cdr (assoc 10 txtdxf))))
(setq blockZ (nth 2 (cdr (assoc 10 txtdxf))))
;scaleX (41 . 1.0) 
(setq scaleX (cdr (assoc 41 txtdxf)))
;scaleY (42 . 1.0) 
(setq scaleY (cdr (assoc 42 txtdxf)))
;scaleZ (43 . 1.0)
(setq scaleZ (cdr (assoc 43 txtdxf)))
;rotation(in Radians) (50 . 0.0)
(setq rotation (cdr (assoc 50 txtdxf)))

;???????????????
blockX=?
blockY=?
blockZ=?

scaleX=C
scaleY=C
scaleZ=C

rotation(in Radians)=?
;???????????????





)
;**************************


