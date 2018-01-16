;;;Re-Defines Blocks
;;;Dean Jones Jan. 26, 2006.
P:\ProCAD 2004S\AutoFLOW

;;;CANNOT -INSERT TO GET IT TO ASK FOR ""RE-DEFINE THE BLOCK""

(setq path "P:/ProCAD 2004S/AutoFLOW/")
(setq blk "lg-arrw.dwg")

(setq cpath (strcat path blk))

(command "-insert" cpath ins sca rot)




;;;----------------------------------------------------------------------
(setq ss1 (ssget "X" '((2 . "fchr-va"))))

;;;??? (and (2 . "fchr-va") (2 . "chr-va"))

(2 . "fchr-va")