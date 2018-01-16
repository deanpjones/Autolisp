;;;Changes a FLOW valve tag from INVISIBLE TO VISIBLE.
;;;THIS ROUTINE IS NOT FINISHED.




(setq blk (car (entsel "\n Select block: ")))(setq blkdxf (entget blk))

(setq att (entnext blk))(setq attdxf (entget att))


;;;Add TAG HERE if not already there.


(setq attdxf (subst (cons 70 0) (assoc 70 attdxf) attdxf))

(entmod attdxf)
(entupd att)


;;;Set up LOOP to scroll through a list of attributes.

