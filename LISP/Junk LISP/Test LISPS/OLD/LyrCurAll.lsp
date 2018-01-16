
;;;Creates new layer or sets layer to current if it already exists.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurAll (/ x y)
	
	(setq lyrs '(
lyrcur10000LB
lyrcur1500LB
lyrcur150LB
lyrcur2000LB
lyrcur2500LB
lyrcur3000LB
lyrcur300LB
lyrcur4000LB
lyrcur400LB
lyrcur5000LB
lyrcur6000LB
lyrcur600LB
lyrcur900LB
lyrcurAttrib
lyrcurBOM
lyrcurBorder1
lyrcurBorder2
lyrcurBuilding
lyrcurBuilding1
lyrcurBuilding2
lyrcurCenter
lyrcurConcrete
lyrcurConstr
lyrcurContin
lyrcurDash
lyrcurDefpoints
lyrcurDimension
lyrcurDot
lyrcurElec
lyrcurEquip
lyrcurFlanges
lyrcurGrid
lyrcurHidden
lyrcurInstr
lyrcurMisc
lyrcurMTO-BAL
lyrcurPhantom
lyrcurProcess
lyrcurSteel
lyrcurSupts
lyrcurText1
lyrcurText2
lyrcurUtility
lyrcurValves
))
	(setq y (length lyrs))
	(setq x 1)
 
	(while 	(>= y x)
		(command "(nth y lyrs)")
		(setq y (1- y))
	)
		
(princ)
)
	    