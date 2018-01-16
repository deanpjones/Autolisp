;Block Edit Program where the user can define exactly what he wants to edit.
;Dean Jones, April 20, 2006

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;Select BLOCK ENTITY.
(defun SUBBLK ( / ss1 en)
(if (= nil (null (setq ss1 (ssget ":S" '((0 . "INSERT"))))))		;Test for BLOCK ENTITY
(setq en (cadar (ssnamex ss1 0)))
(princ "\n***Please try again.*** Select a Block:  ")
)
(princ)
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;Get DXF CODES for a BLOCK ENTITY.
(defun SUBBLKDXF (en / endxf typ lay blkname inspt att)
(setq endxf (entget en))											;get entity dxf properties

(setq typ (cdr (assoc 0 endxf)))									;get entity TYPE
(setq lay (cdr (assoc 8 endxf)))									;what LAYER is the BLOCK on.
(setq blkname (cdr (assoc 2 endxf)))								;get the NAME of the BLOCK.
(setq inspt (cdr (assoc 10 endxf)))									;get the INSERTION POINT of the BLOCK.
(setq att (cdr (assoc 66 endxf)))									;see if ATTRIBUTES are in the BLOCK.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;Print Info for selected block.	
(defun PRINTINFO ( / )
(terpri)
(princ (strcat "\n Type of Entity is: *** " typ " ***"))
(princ (strcat "\n Layer: *** " lay " ***"))
(princ (strcat "\n Block Name: *** " blkname " ***"))

(setq a (mapcar '(lambda (x) (rtos x)) inspt))
(apply 'strcat a)

(apply '(lambda (x) (strcat (car x) " " (cadr x) " " (caddr x))) a)


(princ (strcat "\n Insertion Point: *** " a " ***"))

	(if (= att 1)
(princ "\n The Block HAS Attributes. ")
(princ "\n The Block DOES NOT HAVE Attributes. ")
	)
(princ)
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	

(defun MAINBLK ( / )
(SUBBLKDXF (SUBBLK))
(PRINTINFO)
)


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Lists DXF CODES for BASIC ENTITIES.	
(defun printENT ( / en endxf count)
(setq en (car (entsel "\n Select entity: ")))		; Set ent to last entity.
(setq endxf (entget en))							; Set entl to association list of 
													; last entity.
(setq count 0)										; Set ct (a counter) to 0.

(terpri)											; Adds a line space.
(repeat (length endxf)								; Repeat for number of members in list:
(print (nth count endxf))							; Print a newline, then each list 
													; member.
(setq count (1+ count))								; Increments the counter by one.
)
(princ)												; Exit quietly.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;Lists DXF CODES for COMPLEX ENTITIES.
(defun printNENT ( / en endxf count)
(setq en (car (nentsel "\n Select entity: ")))		; Set ent to last entity.
(setq endxf (entget en))							; Set entl to association list of 
													; last entity.
(setq count 0)										; Set ct (a counter) to 0.

(terpri)											; Adds a line space.
(repeat (length endxf)								; Repeat for number of members in list:
(print (nth count endxf))							; Print a newline, then each list 
													; member.
(setq count (1+ count))								; Increments the counter by one.
)
(princ)												; Exit quietly.
)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~