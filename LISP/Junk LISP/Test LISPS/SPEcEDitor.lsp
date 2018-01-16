(vl-directory-files "C:/Program Files/PROCAD/2D DESIGNER V2004S/Specs/A5" "*")

(open x x )


;;;read to a file
(setq file (open "C:/_Configuration/2-AutoLisp/Proposed Lisp/C-SWAGE" "r"))
(setq ln1 (read-line file))
(setq ln2 (read-line file))
(setq ln3 (read-line file))
(setq ln4 (read-line file))
(setq ln5 (read-line file))

;;;OVERwriteS a file
(setq file (open "C:/_Configuration/2-AutoLisp/Proposed Lisp/C-SWAGE" "w"))
(write-line "To boldly go where nomad has gone before." file)
(close file)

;;;APPENDS to the bottom of a file
(setq file (open "C:/_Configuration/2-AutoLisp/Proposed Lisp/C-SWAGE" "a"))
(write-line "To boldly go where nomad has gone before." file)
(close file)
