;for user defined RIGHT CLICK MENU.




(defun c:what (/ qaz)
(initget 1 "C L S")
(setq qaz (getkword "Draw what: [Circle/Line/Rectang]:"))
;
(cond 
((= qaz "L") (command "line" pause pause ""))
((= qaz "C") (command "circle" pause pause ""))
((= qaz "R") (command "rectang" pause pause ""))
))
