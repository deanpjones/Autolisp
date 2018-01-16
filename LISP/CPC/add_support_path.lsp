(defun addSupportPath (dir pos / tmp c lst)
 (setq tmp "" c -1)
 (if (not (member (strcase dir)
 (setq lst (mapcar 'strcase (strParse (getenv "ACAD") ";")))))
  (progn
   (if (not pos) (setq tmp (strcat (getenv "ACAD") ";" dir))
     (mapcar '(lambda (x)
      (setq tmp (if (= (setq c (1+ c)) pos)
      (strcat tmp ";" dir ";" x)
      (strcat tmp ";" x)
     )
    )
   )
   lst
  )
 )
 (setenv "ACAD" tmp)
 )
 )
 (princ)
); end function


(defun strParse	(Str Delimiter / SearchStr StringLen return n char)
	(setq SearchStr Str)
	(setq StringLen (strlen SearchStr))
	(setq return '())

	(while (> StringLen 0)
		(setq n 1)
		(setq char (substr SearchStr 1 1))
		(while (and (/= char Delimiter) (/= char ""))
			(setq n (1+ n))
			(setq char (substr SearchStr n 1))
		) ;_ end of while
		(setq return (cons (substr SearchStr 1 (1- n)) return))
		(setq SearchStr (substr SearchStr (1+ n) StringLen))
		(setq StringLen (strlen SearchStr))
	) ; end of while
	(reverse return)
) ; end of defun

;;
;; Typical call: to add a Support Path..IF not there..
;;
;;   (addSupportPath "C:\\_BLOCKS" nil)

(princ)

