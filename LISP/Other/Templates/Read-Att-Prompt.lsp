;Read Attribute Prompt inside entity.
;Reply From: Rudy Tovar
;Date: Jul/12/04 - 16:27 (MDT)

(defun read-prompts ( block_name / dat loop nxt)
(setq dat (tblsearch "block" block_name))
(if dat
(setq nxt (entget (cdr (assoc -2 dat)))
tag_list nil
)
)

(while nxt
(if nxt
(progn
(if (assoc 3 nxt)
(setq tag_list
(append tag_list
(list (list
(cdr (assoc 3 nxt))
(cdr (assoc 1 nxt))
(cdr (assoc 2 nxt))
))
)
)
)
)
)
(setq nxt (entnext (cdr (assoc -1 nxt))))
(if nxt (setq nxt (entget nxt)))
)
(reverse(reverse tag_list))
)