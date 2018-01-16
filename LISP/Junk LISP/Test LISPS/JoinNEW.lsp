;Join.LSP:  Joins two broken colinear lines.
;
;__________________________________________________________________________
;does not join co-linear lines, this routine erases the two existing lines and then redraws the line from the furthest two points.
;it should, filter what type of line entities it is seeing.
;it should, be able to end the program if they are NOT lining up.
;it should, be able to use a fence for multiple lines horizontally - - - or also vertically | | | |
;it should be looped to continue for multiple entities.

(defun c:jn (/ ss1 sslen count lin1 lin2)

;;;***********************************************************************************************
;;;GETS SELECTION SET
(setq ss1 (ssget '((0 . "LINE"))))

(setq sslen (sslength ss1))											;GETS number of entities.
(setq count sslen)													;SETS COUNT for extraction.
	(while (not (= count -1))										;evaluates until there are NO ENTITIES.
(setq varnum (itoa count))											;CONVERTS number to string.
	(set (read (strcat "a" (eval varnum)))							;CONCATENATES prefix "a" to COUNT.
	(ssname ss1 													;(SETQ A? ???) FOR entity dxf data.
	(setq count (1- count)))										;STEPS COUNT.
	)	
;does (setq a? ???) for each entity.
;RENAMES SETQ SYM with "a" prefix.
;COUNTS sslen down to -1.
	)
;;;WORKS BUT HOW DO I KNOW DECLARE THEM AS LOCAL VARIABLES AND HOW DO I EVALUATE THEM???	LAMBDA?
;;;***********************************************************************************************

;;;***********************************************************************************************



	
	
	
;;;***********************************************************************************************
;;;***********************************************************************************************	
;;;TEST ARGUMENTS	
	
(defun SUBARG (arg1 / sslen count) 
(setq count sslen)													;SETS COUNT for extraction.
	(while (not (= count -1))										;evaluates until there are NO ENTITIES.
(setq varnum (itoa count))											;CONVERTS number to string.
	(set (read (strcat "a" (eval varnum)))							;CONCATENATES prefix "a" to COUNT.
	(arg1)															;(SETQ A? ???) FOR entity dxf data.
	(setq count (1- count)))										;STEPS COUNT.
	)
)

(defun MAINARG ( / en endxf)
(setq en (SUBARG (ssname ss1 (setq count (1- count)))))				
(setq endxf (SUBARG (entget ss1 (setq count (1- count)))))	
)
	
;;;***********************************************************************************************
;;;***********************************************************************************************

							




 

(setq ss1 (car (entsel "\n Select lines: ")))(setq blkdxf (entget blk))		;get a selection set.	
(setq ss1 (car (entsel "\n Select block: ")))(setq blkdxf (entget blk))		;gets BLOCK info.	











                 
(defun mid (w z)
(LIST (/ (+ (CAR w) (CAR z))2) (/ (+ (CADR w) (CADR z))2))
)
  (setvar "cmdecho" 0)
  (setq a (cadr (entsel "\nSelect two lines to be joined: ")))		;get first line PICK COORDINATE.
  (setq b (cadr (entsel)))											;get second line PICK COORDINATE.
  (setq ai (mid a b))
  (SETQ va (ssget a))												;make selection set 1.
  (setq vb (ssget b))												;make selection set 2.
  (setq a1 (cdr (assoc 10 (entget (setq ent1 (ssname va 0))))))		;get dxf data 10 for ent1.
  (setq b1 (cdr (assoc 11 (entget (ssname va 0)))))					;get dxf data 11 for ent1.
  (setq a2 (cdr (assoc 10 (entget (setq ent2 (ssname vb 0))))))		;get dxf data 10 for ent2.
  (setq b2 (cdr (assoc 11 (entget (ssname vb 0)))))					;get dxf data 11 for ent2.
    (setq dst1 (distance ai a1))
    (setq dst2 (distance ai b1))
     (if (< dst1 dst2)(setq end1 b1)(setq end1 a1))
    (setq dst3 (distance ai a2))
    (setq dst4 (distance ai b2))
    (if (< dst3 dst4)(setq end2 b2)(setq end2 a2))
(setq oldlst (entget ent1))											;create old list for ent1.
(setq newlst (subst (cons 10 end1)(assoc 10 oldlst) oldlst))		;create new list data 10 for new line.
(setq newlst (subst (cons 11 end2)(assoc 11 newlst) newlst))		;create new list data 11 for new line.
(entdel ent2)														;delete ent2.
(entdel ent1)														;delete ent1.
(entmake (cdr newlst))												;MAKE NEW ENTITY with new info.
(princ)
)
