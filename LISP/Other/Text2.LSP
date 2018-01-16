;;;;
;;;;Beginning of the AutoLISP routine
;;;
(defun add-record (/ Xrec Xname)
(setq Xrec '((0 . "XRECORD")
(100 . "AcDbXrecord")
(1 . "DWGPROPS COOKIE")
(9 . "")
)
)
(setq Xname (entmakex Xrec))
(dictadd (namedobjdict) "DWGPROPS" Xname)
)

(prompt "\nType in UPDREV to start this routine")
(defun c:updRev (/ xlist rev)
(setq Rev (getstring "\nEnter drawing Revision Number: "))
(setq xlist (dictsearch (namedobjdict) "DWGPROPS"))
(if Xlist
(progn
(dictremove (namedobjdict) "DWGPROPS")
(dictadd (namedobjdict) "DWGPROPS" (entmakex (subst (cons 9 Rev)
(assoc 9 xlist) xlist)))
)


(progn
(add-record)
(setq xlist (dictsearch (namedobjdict) "DWGPROPS"))
(dictremove (namedobjdict) "DWGPROPS")
(dictadd (namedobjdict) "DWGPROPS" (entmakex (subst (cons 9 Rev)(assoc
9 xlist) xlist)))
;(entmod (subst (cons 9 Rev) (assoc 9 xlist) xlist))
)
)
(princ)
)
;;;;
;;;;End of the AutoLISP routine
;;;

And it came from :
Victor Delgado


And, believe it or not, hot of the press.......
"I created a routine in 2002 for setting DwgProps...

<--- Start Of Lisp --->
;----------------------------------
; 2 Title
; 3 Subject
; 4 Author
; 6 Comments
; 7 Keywords
; 1 Hyperlink
; 8 Last saved by
; 9 Revision
; 40 Editing time
; 41 Creation time
; 42 Last modified time
; 90 Number of custom properties
; 300-309 Custom properties
;----------------------------------
(defun add-record (NUMBER / Xrec Xname)
(setq Xrec '((0 . "XRECORD")
(100 . "AcDbXrecord")
(1 . "DWGPROPS COOKIE")
(NUMBER . "")
))
(setq Xname (entmakex Xrec))
(dictadd (namedobjdict) "DWGPROPS" Xname)
)
(defun upddwgp (NUMBER STRING)
;(defun upddwgp (NUMBER / xlist STRING)
(setq xlist (dictsearch (namedobjdict) "DWGPROPS"))
(if Xlist
(progn
(dictremove (namedobjdict) "DWGPROPS")
(dictadd (namedobjdict) "DWGPROPS" (entmakex (subst (cons NUMBER STRING)
(assoc NUMBER xlist) xlist)))
)
(progn
(add-record NUMBER)
(setq xlist (dictsearch (namedobjdict) "DWGPROPS"))
(dictremove (namedobjdict) "DWGPROPS")
(dictadd (namedobjdict) "DWGPROPS" (entmakex (subst (cons NUMBER STRING)(assoc NUMBER xlist) xlist)))
;(entmod (subst (cons NUMBER STRING) (assoc NUMBER xlist) xlist))
)
)
(princ)
)

