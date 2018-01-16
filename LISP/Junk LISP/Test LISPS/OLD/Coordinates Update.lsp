;;;Updates Coordinates within a block
        
(defun C:coordupdate (/ entlist xcor ycor gcod oldlst newlst enam)



(setq entList (entget (car (entsel))))



;;;Returns the X value from the insertion point of the block.
(setq xcor (car (cdr (assoc 10 entList))))

;;;Returns the Y value from the insertion point of the block.
(setq ycor (car (cdr (cdr (assoc 10 entList)))))

;;;Saves group code value.
(setq gcod 1)

;;;Saves oldlst value.
(setq oldlst (assoc 1 entList))


;;;User input for new string.
(setq newlst (getstring T "What is the new value:  "))


;;;Saves newlst value.
(setq newlst (assoc 1 entList))

;;;Changes text value from "close" to "open".
(setq entList (subst (cons gcod newlst) (assoc gcod entList) entList))

(entmod entlist)

;;;Obtains entity name from entList.
(setq enam (cdr (assoc -1 entList)))
;;;Updates screen image.
(entupd enam)


--------------------------------------------------------------------
;;;Updates the screen image of an object (entity)

(setq e1 (entnext))       ; Sets e1 to the polyline's entity name 
(setq e2 (entnext e1))    ; Sets e2 to its first vertex 
(setq ed (entget e2))     ; Sets ed to the vertex data 
(setq ed 
  (subst '(10 1.0 2.0)
    (assoc 10 ed)         ; Changes the vertex's location in ed 
    ed                    ; to point (1,2) 
  ) 
) 
(entmod ed)               ; Moves the vertex in the drawing 
(entupd e1)

--------------------------------------------------------------------


(assoc 40 entList)

(assoc 10 entList)

(assoc 8 entList)

(princ)

)

--------------------------------------------------------------------
;;;Coordblk block

((-1 . <Entity name: 4008ae70>) 
(0 . "INSERT") 
(330 . <Entity name: 4008acf8>) 
(5 . "56") 
(100 . "AcDbEntity") 
(67 . 0) 
(410 . "Model") 
(8 . "0") 
(100 . "AcDbBlockReference") 
(66 . 1) 
(2 . "coordblk") 
(10 7.0 12.0 0.0) 
(41 . 1.0) 
(42 . 1.0) 
(43 . 1.0) 
(50 . 0.0) 
(70 . 0) 
(71 . 0) 
(44 . 0.0) 
(45 . 0.0) 
(210 0.0 0.0 1.0))

--------------------------------------------------------------------
;;;Text String

((-1 . <Entity name: 400a85f8>) 
(0 . "TEXT") (330 . <Entity name: 400a6c10>) 
(5 . "137") 
(100 . "AcDbEntity") 
(67 . 0) 
(410 . "Model") 
(8 . "R-Text1") 
(100 . "AcDbText") 
(10 123.0 328.75 0.0) 
(40 . 2.5) 
(1 . "CLOSE") 
(50 . 0.0) 
(41 . 1.0) 
(51 . 0.0) 
(7 . "Standard") 
(71 . 0) 
(72 . 0) 
(11 123.0 330.0 0.0) 
(210 0.0 0.0 1.0) 
(100 . "AcDbText") 
(73 . 2))

--------------------------------------------------------------------
;;;Attribute Tag

((-1 . <Entity name: 4008aed0>) 
(0 . "ATTDEF") 
(330 . <Entity name: 4008acf8>) 
(5 . "62") 
(100 . "AcDbEntity") 
(67 . 0) 
(410 . "Model") 
(8 . "R-Attrib") 
(100 . "AcDbText") 
(10 17.0 13.75 0.0) 
(40 . 2.5) (1 . "-") 
(50 . 0.0) 
(41 . 1.0) 
(51 . 0.0) 
(7 . "Standard") 
(71 . 0) 
(72 . 0) 
(11 17.0 15.0 0.0) 
(210 0.0 0.0 1.0) 
(100 . "AcDbAttributeDefinition") 
(3 . "Easting/Westing") 
(2 . "X_COOR") 
(70 . 0) 
(73 . 0) 
(74 . 2))

--------------------------------------------------------------------
;;;Tie-in1 block

((-1 . <Entity name: 406ee0f0>) (0 . "INSERT") (330 . <Entity 
name: 406d5cf8>) (5 . "6114D940726") (100 . "AcDbEntity") (67 . 0) (410 . 
"Model") (8 . "R-Contin") (100 . "AcDbBlockReference") (66 . 1) (2 . "tie-in1") 
(10 540.0 380.0 0.0) (41 . 10.0) (42 . 10.0) (43 . 10.0) (50 . 0.0) (70 . 0) 
(71 . 0) (44 . 0.0) (45 . 0.0) (210 0.0 0.0 1.0))


--------------------------------------------------------------------

(setq entList(entget (car (entsel))))

If I selected a circle, this code would set entList to something like this:

((-1 . <Entity name: 3b40cf0>) (0 . "CIRCLE") (5 . "146") (100 . "AcDbEntity") (67 . 0) (8 . "HOL") (100 . "AcDbCircle") (10 163.135 367.479 0.0)            (40 . 2.56277) (210 0.0 0.0 1.0))

If I wanted to extract data from this group code list I would simply type:

(assoc 40 entList)  ;would return 2.56277

(assoc 0 entList)  ;would return "CIRCLE"

(assoc 10 entList)  ;would return (163.135 367.479 0.0)

(assoc 8 entList)  ;would return "HOL"

