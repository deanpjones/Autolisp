
(defun C:mycloud ()

(setq ss nil ss1 nil)
(setq ss1 (ssadd))

(princ "\nSelect size of cloud maker: ")
(command "circle" pause pause)
(command "region" "l" "")
(setq ss (ssget "L"))
(setq ss1 (ssadd (ssname ss 0) ss1))

;*******************************
;Repeat until done.
(command "copy" "l" "" PAUSE)
(setq ss nil ss (ssget "L"))
(setq ss1 (ssadd (ssname ss 0) ss1))
;*******************************
(setq ss2 (ssget "l"))


(princ)
)

;(ssget "L")

;******************************
(defun C:aaxx ()

;?????
;Predefine circle as a block exploded and only set the scale as an option.
(command "circle" (setq ctr (getpoint)) (setq dia (getpoint)))
(command "region" "l" "")
(command "copybase" ctr "l" "")



(repeat 10
(progn
(command "pasteclip" pause)
(command "union" "l" "p" "")
))
)
;******************************

;******************************************************
;******************************
;******************************
;******************************
(defun C:abc ()

;?????
;Predefine circle as a block exploded and only set the scale as an option.
(defun aaa ()
(command "circle" (setq ctr (getpoint)) (setq dia (getpoint)))
(command "region" "l" "")
(command "copybase" ctr "l" "")
)

;*************************
;Condition to be changed with pressing shift.
(defun rew ()
(while T
(command "pasteclip" pause)
(command "union" "l" "p" "")
)
)
;*************************
(aaa)
(rew)
)
;******************************
;******************************
;******************************

(defun C:myRevCloud ( / ss)

;*************************
(setq ss nil ss (ssadd))	;Resets ss to nil, then creates emtpy selectionset.
;??Predefine circle as a block exploded and only set the scale as an option.??
;*************************
(defun myInsert ()
;Insert as....
(command "-insert" "*P:/_ConocoPhillips/General/Cloud-Atom.dwg" pause "1" "") 	;?Can "1" be adjusted?
(setq ss (ssadd (entlast) ss))
)
;*************************
;*************************
;Union inserted blocks.
(defun myUnion ()
(command "union" ss "")
)
;*************************
;(if (= T (acet-sys-lmouse-down)) (while T (command (myInsert))) (myUnion))
(while (= T (acet-sys-lmouse-down))
(myInsert)
)
(myUnion)

(princ)
)
;******************************
;******************************
;******************************
;?(grread T) to track mouse movement?
;?MPEDIT - to join existing revcloud.
;?REGION - to turn existing revcloud into region for editing.
;?BOUNDARY, UNION - to use from existing hatches
