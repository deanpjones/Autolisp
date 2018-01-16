;;;Adds or Removes a file extension *.txt to all files in a specified folder.

;;;The purpose is to print CPC SPEC files in Procad 2004 using notepad in batch.
;;;  -first change page setup in Notepad to the proper spec name.
;;;  -next rename files in folder using this lisp routine.
;;;  -then highlight all the files in the folder and right-click-->print.
;;;  -finally rename the files back removing the *.txt extension.

;;;Compliments of Dean Jones, May 09, 2007.

;Adds a "*.dpj" file extension to the files.
(defun myTXTextAdded ( / lst1)
(setq lst1 (vl-directory-files mypath "*.*" 1))
(foreach n lst1 (vl-file-rename (strcat mypath n) (strcat mypath n ".txt")))
)

;Removes a "*.dpj" file extension to the files.
(defun myTXTextRemoved ( / lst1)
(setq lst1 (vl-directory-files mypath "*.*" 1))
(foreach n lst1 (vl-file-rename (strcat mypath n) (strcat mypath (vl-string-subst "" ".txt" n))))
)

;;;**********************************************************************************************
;;;**********************************************************************************************
(defun myFileExt ( folder extOpt / mypath )

;Sets working directory path.
(setq mypath
(strcat "S:/BR-S/gsGRP/GROUP/ENGCAD/00.000 CAD Management/700/780 CAD Configuration Files/PROCAD v2004S/Specs/" folder "/")
)

;Execute with option to delete or to add extension.
(cond
((= 1 extOpt) (apply 'myTXTextAdded nil)(princ (strcat "\n*.txt extension has been ADDED to all files in " folder " folder.")))
((= 0 extOpt) (apply 'myTXTextRemoved nil)(princ (strcat "\n*.txt extension has been REMOVED from all files in " folder " folder.")))
(T (alert "There is an error with this function, please try again."))
)

(princ)
)
;;;**********************************************************************************************
;;;**********************************************************************************************

;(myFileExt "01PK" 0) ...to remove extensions from files in folder.
;(myFileExt "01PK" 1) ...to add extensions to files in folder.
