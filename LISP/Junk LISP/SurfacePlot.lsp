;http://www.cadstudio.cz/en/apps/3dplot/
;3dplot.vlx
;(3DPlot functionName startU endU stepU startV endV stepV)

;The core application contains functionality required to 
;generate 3D objects from results of math expressions of
;the type f(X,Y) -- or even in a more general format [X,Y,Z] = f(U,V). 
;You need to specify a user defined function for "f", plus a definition interval 
;of U and V values (starting value, end value, step size). 

(defun fXY(u v)(list (* u v) u (* v v)))
;(3DPlot fXY -1.0 1.0 (/ (- 1.0 -1.0) 20) -1.0 1.0 (/ (- 1.0 -1.0) 20))

(defun fXYApple (u v)
 (list
  (* (cos u) (+ 4.0 (* 3.8 (cos v))))
  (* (sin u) (+ 4.0 (* 3.8 (cos v))))
  (+ (* (+ (cos v) (sin v) -1.0) (+ 1.0 (sin v))
   (log (- 1.0 (* pi (/ v 10.0))))) (* 7.5 (sin v)))
))
;(3DPlot fXYApple -1.0 1.0 (/ (- 1.0 -1.0) 20) -1.0 1.0 (/ (- 1.0 -1.0) 20))

(defun fXYKranz (u v)
 (list
 (/(cos (+ u 4)) 3)
 (+(*(cos u)(sin v)(cos v)(sin u)(cos v))(* 0.5 (cos u)))
 (*(cos v)(sin u)(cos u)(sin v))
))

;(3DPlot fXYKranz -1.0 1.0 (/ (- 1.0 -1.0) 20) -1.0 1.0 (/ (- 1.0 -1.0) 20))
;(3DPlot fXYKranz -10 10 1 -10 10 1)
;------------------------------
(defun fXYEnneper (u v)
 (list
  (+ u (/ (* u u u) -3.0) (* u v v))
  (+ v (/ (* v v v) -3.0) (* v u u))
  (- (* u u) (* v v))
))
 
;This plot is invoked by:
;(3DPlot fXYEnneper -2.0 2.0 0.1 -2.0 2.0 0.1)

 
;Or a non-intersecting version of Enneper:
;(3DPlot fXYEnneper -1.6 1.6 0.1 -1.6 1.6 0.1)
;------------------------------
(defun fXYBreather (u v / b r w denom)
 (defun sinh (x) (/ (1- (exp (* 2.0 x))) (* 2.0 (exp x))))
 (defun cosh (x) (/ (1+ (exp (* 2.0 x))) (* 2.0 (exp x))))
 (defun sqr (x) (* x x))
 (setq b 0.4  r (- 1.0 (sqr b))  w (sqrt r)); 0.4 = density
 (setq denom (* b (+ (sqr (* r (cosh (* b u)))) (sqr (* b (sin (* w v)))))))
 (list
  (+ (- u) (/ (* 2.0 r (cosh (* b u)) (sinh (* b u))) denom))
  (/ (* 2.0 w (cosh (* b u)) (- (- (* w (cos v) (cos (* w v)))) (* (sin v) (sin (* w v))))) denom)
  (/ (* 2.0 w (cosh (* b u)) (+ (- (* w (sin v) (cos (* w v)))) (* (cos v) (sin (* w v))))) denom)
))
;(3Dplot fXYbreather -13.2 13.2 (/ 26.4 60) -37.4 37.4 (/ 74.8 150))
;------------------------------

