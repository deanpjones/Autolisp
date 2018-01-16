Content-Type: text; name="tEdit.lsp"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline; filename="tEdit.lsp"

; Jason Piercey . May 29th, 2003
; similar command replacement for the Express Tool
; called TEDIT that was left out of AutoCAD 2004.

; edit any of the following in one operation.
; Text, Mtext, Attdef, Attributed Inserts,
; Dimensions, and ArcAlignedText

; briefly tested, if any trouble just say so.
(defun c:tEdit (/ echo ss i ename data)
 (setq echo (getvar "cmdecho"))
 (setvar "cmdecho" 0)
 
 (defun *error* (msg)
  (cond
   ((and
     msg
    (member (strcase msg)
            '("Function cancelled" "quit / exit abort")) )
    (princ (strcat "\ntEdit error: " msg))
    )
   (t (setvar "cmdecho" echo) (princ))
   )
  )
 
 (setq
  ss
  (ssget
   '((-4 . "<or")
     (0 . "TEXT,MTEXT,ATTDEF,ARCALIGNEDTEXT,DIMENSION")
     (-4 . "<and") (0 . "INSERT") (66 . 1) (-4 . "and>")
     (-4 . "or>")
     )
   )
  )
 (if ss
  (progn
   (setq i -1)
   (repeat (sslength ss)
    (setq ename (ssname ss (setq i (1+ i))))
    (setq data (cdr (assoc 0 (entget ename))))
    (cond
     ((or
       (= "TEXT" data)
       (= "ATTDEF" data)
       (= "MTEXT" data)
       (= "DIMENSION" data)
       )
      (command "._ddedit" ename "")
      )
     ((= "ARCALIGNEDTEXT" data) (command "._arctext" ename))
     
     ((= "INSERT" data) (command "._ddatte" ename))
     
     )
    (while (> (getvar "cmdactive") 0) (command pause))
    )   
   )
  )
 (setvar "cmdecho" echo)
 (princ "\ndone")
 (princ)
 )