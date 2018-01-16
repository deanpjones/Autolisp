;;;BREAK VERTICAL LINE by ONE PICK.
;;;Dean Jones, April 27, 2006.


(for "POLYLINE" do SSET then (entnext PL for Vertex1) then (entnext Vertex1 for Vertex2) until "SEQEND")
(GET (10 . (x1 y1 z1)) (10 . (x2 y2 z2)) for each vertex for points of line.


;Need to ADD FOR POLYLINES.
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;GET SELECTION SET.
(defun mySS ( / oldosmode pt1 pt2 pt3 ss1 sslen )
(setq oldosmode (getvar "OSMODE"))							;Save old OSMODE for snaps.
(setvar "OSMODE" 2080)										;Set OSMODE to INT, APPINT
(setq pt1 (getpoint))										;Get Point
(setq pt2 (list (car pt1) (+ (cadr pt1) 2) (caddr pt1)))	;Set break point.
(setq pt3 (list (car pt1) (- (cadr pt1) 2) (caddr pt1)))	;Set break point.
(setq ss1 (ssget "C" pt1 pt1 '((0 . "LINE")))) 				;Get SELECTION SET.

(setq sslen	(sslength ss1))									;Get NUMBER OF ENTITIES in selection.
)
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;CREATE SELECTION SET LIST.
(defun mySSLIST ( sslen / sslist )
(setq sslist (list (1- sslen)))								;Create a COUNTER LIST from the number of entities.
(while (/= (car sslist) 0)
(setq sslist (cons (1- (car sslist)) sslist))
)
)
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;EXTRACTS SPECIFIC DXF CODE AND GIVES EACH ENTITY A CUSTOM NAME.
(defun myDXFeXtractor ( ss1 sslist / endxf enPT1 enPT2 )									

;(mapcar '(lambda (x) (setvarname (setvalue)) list))		;Use COUNTER LIST to get DXF CODES for each entity.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun myvarnamefunc (x) (strcat "var" (itoa x)))			;Use to save Custom Variable Naming Function.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(mapcar '(lambda (x)
	(progn
(setq endxf (entget (ssname ss1 x)))						;Get DXF CODES for each entity.
(setq enPT1 (assoc 10 endxf))								;Get entity start point of line.
(setq enPT2 (assoc 11 endxf))								;Get entity end point of line.

(foreach n 
(set (read (myvarnamefunc x)) (list (myvarnamefunc x) enPT1 enPT2))			;Create a list to return.
(princ n) (terpri))
	)														;End PROGN.
	
) sslist)													;End MAPCAR.
)															;End DEFUN.


(setvar "OSMODE" oldosmode)									;RESET "OSMODE" to original condition.
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;(for "LINE" (10 . ( x1 y1 z1)) and (11 . (x2 y2 z2)) if x1 = x2 then "Vertical", if y1 = y2 then Horizontal.)
;SCROLL THRU SELECTION SET,
;and DETERMINE WHICH LINE IS VERTICAL.
(defun VERTICALTEST ( varQ / vX1 vX2 vY1 vY2)

(setq vX1 (cadr (cadr varQ)))								;Define Variables to test.
(setq vX2 (cadr (caddr varQ)))
(setq vY1 (caddr (cadr varQ)))
(setq vY2 (caddr (caddr varQ)))

(setq test (cond											;Tests for line type.
((= vX1 vX2) "Vertical")
((= vY1 vY2) "Horizontal")
(T "Abstract")
))
;;;----------------------------------------------------------------------------------------------------------
;GET ENTITIES THAT ARE VERTICAL???
(defun ()
(if (test = "Vertical")
(then (setq varQ 
)

(mapcar '(lambda (x) (strcat "\nThe line is " x)) (list test))  ;Print statement.
)
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
(defun NEWBREAKCOMMAND ( / en endxf pt10 pt11 x10 x11 y10 y11 Npt10 Npt11 Nen)
(setq en (car (entsel "\n Select line: ")))(setq endxf (entget en))			;gets ENTITY info.	

(setq pt10 (cdr (assoc 10 endxf)))											;get START POINT dxf property
(setq pt11 (cdr (assoc 11 endxf)))											;get END POINT dxf property

;(save (10 x1 y1 z1) (11 x2 y2 z2))
(setq X10 (car pt10))														;Define Variables to test.
(setq X11 (car pt11))
(setq Y10 (cadr pt10))
(setq Y11 (cadr pt11))

;------------------------------------------------
(TEST VARIABLES)
(setq test1 (cond											;Tests for line type.
((= X10 X11) "Vertical")
((= Y10 Y11) "Horizontal")
(T "Abstract")
))
;------------------------------------------------
(test variables)
(is X10 = X11?)(or is X10 larger) (or X11 larger)(what about negative numbers?)
(setq maxX (cond
((= X10 X11) "Xequal")
((= X10 (max X10 X11)) "X10max"))
((= X11 (max X10 X11)) "X11max"))
(T nil))
)
(setq maxY (cond
((= Y10 (max Y10 Y11)) "Y10"))
((= Y11 (max Y10 Y11)) "Y11"))
(T nil))
)
((= Y10 Y11) "Horizontal")
(T "Abstract")
))
;------------------------------------------------
(setq Npt10 (CREATE NEW POINTS FOR (10 X Y Z)))
(setq Npt11 (CREATE NEW POINTS FOR (11 X Y Z)))
(setq Npt10 '(185.0 105.0 0.0))
(setq Npt11 '(185.0 180.0 0.0))


(setq en (subst (cons 10 Npt10) (assoc 10 endxf) endxf))
(entmod en)

(setq en (subst (cons 11 Npt11) (assoc 11 endxf) endxf)) 

(entdel en)	
(entmakex Nen)
(entmake Nen)														;DELETE old LINE.

(entupd Nen)

	(setq txtdxf2 (subst (cons 1 txtstring) (assoc 1 txtdxf2) txtdxf2))	;**match TXT1 with TXT2 property

	(entmod txtdxf2)							;updates ENTITY dxf data
	(entupd txt2)								;updates SCREEN of update
	



(entmake (0 . "LINE") (8 . "LAYER") (10 x1 y1 z1) (11 x2 (+ int 2) z2) ;note which ever CODE 10, OR 11 HAS THE HIGHER VALUE IS PLUSED.
(entmake (0 . "LINE") (8 . "LAYER") (10 x1 y1 z1) (11 x2 (- int 2) z2) ;note which ever CODE 10, OR 11 HAS THE LESSER VALUE IS MINUSED.
(ENTUPD)
)
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;BREAK VERTICAL LINE ROUTINE.
(defun myBREAKLINE ( pt2 pt3 / )
 
)
;result from (entsel)
(<Entity name: 7eb9f060> (187.0 193.0 0.0))
;need SSGET to filter VERTICAL LINE.
;then I can take the PT2 and create '(enY pt2) 
(setq ss2 (ssname ss1 0))
(setq enY (cons ss2 (list pt2)))

(command "break" enY pt3)

;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------------------

;
;
;
;

;
;;
;
;
;

;






;;;//////////////////////////----------------------//////////////////////////////////////////////////////////
;;;**********************************************************************************************************
(defun MyDXFeXtractor ( varname ss1 dxfNO sslist / endxf cusdxf )
(mapcar '(lambda (x)
(set (read (strcat varname (itoa x)))							;Set CUSTOM VARIABLE NAME.
	(progn
(setq endxf (entget (ssname ss1 x)))							;Get DXF CODES for each entity.
(setq cusdxf (cdr (assoc dxfNO endxf)))							;Set DXF CODE number to extract.
	)
)
) sslist)
)
;;;----------------------------------------------------------------------------------------------------------
(defun ( sslen ss1 sslist / )
(princ (strcat "\nThere are " (itoa sslen) " entities in the selection."))(princ)
(MyDXFeXtractor "myPT1" ss1 10 sslist)
(MyDXFeXtractor "myPT2" ss1 11 sslist)
(MyDXFeXtractor "myLA" ss1 8 sslist)
)
;;;//////////////////////////----------------------//////////////////////////////////////////////////////////
;;;**********************************************************************************************************


