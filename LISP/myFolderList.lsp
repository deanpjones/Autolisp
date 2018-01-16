;Lists all the (*.dwg) files that are in the files current directory.
;Dean Jones, Jul. 01, 2008 (Yes, I was working on Canada Day!)

(defun C:myFolderList ( / myList myList2)
(setq myList (acad_strlsort (mapcar 'vl-filename-base (vl-directory-files (getvar "dwgprefix") "*.*" 1))))

;----------------------------------------------------
(defun remove_doubles (lst)
(if lst
(cons (car lst) (remove_doubles (vl-remove (car lst) lst)))
)
)

(setq myList2 (vl-sort (remove_doubles myList) '<))
;----------------------------------------------------

(terpri)
(princ (getvar "dwgprefix"))
(terpri)
(foreach n myList2 (princ (strcat "\n" n)))

(princ)
)



;???????????????????????????????????????
;Trying to find a way to extract all the revision #'s from a folder with the file name listed
;(myattrib-test (myblk 2 "CPC_A1TBLK") "REV")
;(myattrib-test (myblk 2 "CPC_A1TBLK") "CPC_DWG_#")
;???????????????????????????????????????