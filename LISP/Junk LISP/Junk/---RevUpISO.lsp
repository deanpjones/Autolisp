(setq ss1 (ssget ":N:S"))
(entget (cadar (ssnamex ss1)))


(setq pt1 '(8.2747 16.1327))
(setq pt2 '(18.6383 16.1327))
(setq pt3 '(32.9993 16.1327))
(setq pt4 '(48.4974 16.1327))

(nentsel)
