
;;;Creates new layer or sets layer to current if it already exists.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurR-01 ()
  
   	(if (= clayer R-01)
		(command "-layer" "m" "R-01" "c" "62" "" "")
		(setvar "clayer" "R-01")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurR-02 ()
  
   	(if (= clayer R-02)
		(command "-layer" "m" "R-02" "c" "105" "" "")
		(setvar "clayer" "R-02")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurR-03 ()
  
   	(if (= clayer R-03)
		(command "-layer" "m" "R-03" "c" "163" "" "")
		(setvar "clayer" "R-03")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur10000LB ()
  
   	(if (= clayer R-10000LB)
		(command "-layer" "m" "R-10000LB" "c" "111" "" "")
		(setvar "clayer" "R-10000LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur1500LB ()
  
   	(if (= clayer R-1500LB)
		(command "-layer" "m" "R-1500LB" "c" "142" "" "")
		(setvar "clayer" "R-1500LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur150LB ()
  
   	(if (= clayer R-150LB)
		(command "-layer" "m" "R-150LB" "c" "52" "" "")
		(setvar "clayer" "R-150LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur2000LB ()
  
   	(if (= clayer R-2000LB)
		(command "-layer" "m" "R-2000LB" "c" "56" "" "")
		(setvar "clayer" "R-2000LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur2500LB ()
  
   	(if (= clayer R-2500LB)
		(command "-layer" "m" "R-2500LB" "c" "130" "" "")
		(setvar "clayer" "R-2500LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur3000LB ()
  
   	(if (= clayer R-3000LB)
		(command "-layer" "m" "R-3000LB" "c" "53" "" "")
		(setvar "clayer" "R-3000LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur300LB ()
  
   	(if (= clayer R-300LB)
		(command "-layer" "m" "R-300LB" "c" "70" "" "")
		(setvar "clayer" "R-300LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur4000LB ()
  
   	(if (= clayer R-4000LB)
		(command "-layer" "m" "R-4000LB" "c" "131" "" "")
		(setvar "clayer" "R-4000LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur400LB ()
  
   	(if (= clayer R-400LB)
		(command "-layer" "m" "R-400LB" "c" "121" "" "")
		(setvar "clayer" "R-400LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur5000LB ()
  
   	(if (= clayer R-5000LB)
		(command "-layer" "m" "R-5000LB" "c" "101" "" "")
		(setvar "clayer" "R-5000LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur6000LB ()
  
   	(if (= clayer R-6000LB)
		(command "-layer" "m" "R-6000LB" "c" "61" "" "")
		(setvar "clayer" "R-6000LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur600LB ()
  
   	(if (= clayer R-600LB)
		(command "-layer" "m" "R-600LB" "c" "160" "" "")
		(setvar "clayer" "R-600LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcur900LB ()
  
   	(if (= clayer R-900LB)
		(command "-layer" "m" "R-900LB" "c" "200" "" "")
		(setvar "clayer" "R-900LB")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurAttrib ()
  
   	(if (= clayer R-Attrib)
		(command "-layer" "m" "R-Attrib" "c" "50" "" "")
		(setvar "clayer" "R-Attrib")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurBOM ()
  
   	(if (= clayer R-BOM)
		(command "-layer" "m" "R-BOM" "c" "55" "" "")
		(setvar "clayer" "R-BOM")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurBorder1 ()
  
   	(if (= clayer R-Border1)
		(command "-layer" "m" "R-Border1" "c" "74" "" "")
		(setvar "clayer" "R-Border1")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurBorder2 ()
  
   	(if (= clayer R-Border2)
		(command "-layer" "m" "R-Border2" "c" "63" "" "")
		(setvar "clayer" "R-Border2")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurBuilding1 ()
  
   	(if (= clayer R-Building1)
		(command "-layer" "m" "R-Building1" "c" "31" "" "")
		(setvar "clayer" "R-Building1")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurBuilding2 ()
  
   	(if (= clayer R-Building2)
		(command "-layer" "m" "R-Building2" "lt" "Phantom" ""  "c" "80" "" "")
		(setvar "clayer" "R-Building2")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurCenter ()
  
   	(if (= clayer R-Center)
		(command "-layer" "m" "R-Center" "lt" "Center" "" "c" "20" "" "")
		(setvar "clayer" "R-Center")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurConcrete ()
  
   	(if (= clayer R-Concrete)
		(command "-layer" "m" "R-Concrete" "c" "41" "" "")
		(setvar "clayer" "R-Concrete")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurConstr ()
  
   	(if (= clayer R-Constr)
		(command "-layer" "m" "R-Constr" "c" "123" "" "")
		(setvar "clayer" "R-Constr")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurContin ()
  
   	(if (= clayer R-Contin)
		(command "-layer" "m" "R-Contin" "c" "30" "" "")
		(setvar "clayer" "R-Contin")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurDash ()
  
   	(if (= clayer R-Dash)
		(command "-layer" "m" "R-Dash" "lt" "Dashed" "" "c" "23" "" "")
		(setvar "clayer" "R-Dash")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurDefpoints ()
  
   	(if (= clayer Defpoints)
		(command "-layer" "m" "Defpoints" "")
		(setvar "clayer" "Defpoints")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
(defun C:lyrcurDimension ()
  
   	(if (= clayer R-Dimension)
		(command "-layer" "m" "R-Dimension" "c" "40" "" "")
		(setvar "clayer" "R-Dimension")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurDot ()
  
   	(if (= clayer R-Dot)
		(command "-layer" "m" "R-Dot" "lt" "Dot" "" "c" "120" "" "")
		(setvar "clayer" "R-Dot")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurElec ()
  
   	(if (= clayer R-Elec)
		(command "-layer" "m" "R-Elec" "lt" "Hidden" "" "c" "22" "" "")
		(setvar "clayer" "R-Elec")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurEquip ()
  
   	(if (= clayer R-Equip)
		(command "-layer" "m" "R-Equip" "c" "54" "" "")
		(setvar "clayer" "R-Equip")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurFlanges ()
  
   	(if (= clayer R-Flanges)
		(command "-layer" "m" "R-Flanges" "c" "90" "" "")
		(setvar "clayer" "R-Flanges")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurGrid ()
  
   	(if (= clayer R-Grid)
		(command "-layer" "m" "R-Grid" "lt" "Phantom" "" "c" "24" "" "")
		(setvar "clayer" "R-Grid")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurHidden ()
  
   	(if (= clayer R-Hidden)
		(command "-layer" "m" "R-Hidden" "lt" "Hidden" "" "c" "33" "" "")
		(setvar "clayer" "R-Hidden")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurInstr ()
  
   	(if (= clayer R-Instr)
		(command "-layer" "m" "R-Instr" "c" "240" "" "")
		(setvar "clayer" "R-Instr")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurMisc ()
  
   	(if (= clayer R-Misc)
		(command "-layer" "m" "R-Misc" "c" "133" "" "")
		(setvar "clayer" "R-Misc")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurMTO-BAL ()
  
   	(if (= clayer R-MTO-BAL)
		(command "-layer" "m" "R-MTO-BAL" "c" "32" "" "")
		(setvar "clayer" "R-MTO-BAL")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurPhantom ()
  
   	(if (= clayer R-Phantom)
		(command "-layer" "m" "R-Phantom" "lt" "Phantom" "" "c" "150" "" "")
		(setvar "clayer" "R-Phantom")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurProcess ()
  
   	(if (= clayer R-Process)
		(command "-layer" "m" "R-Process" "c" "92" "" "")
		(setvar "clayer" "R-Process")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurRevCloud ()
  
   	(if (= clayer R-RevCloud)
		(command "-layer" "m" "R-RevCloud" "c" "91" "" "")
		(setvar "clayer" "R-RevCloud")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurSteel ()
  
   	(if (= clayer R-Steel)
		(command "-layer" "m" "R-Steel" "c" "140" "" "")
		(setvar "clayer" "Steel")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurSupts ()
  
   	(if (= clayer R-Supts)
		(command "-layer" "m" "R-Supts" "c" "35" "" "")
		(setvar "clayer" "R-Supts")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	     
  	
(defun C:lyrcurText1 ()
  
   	(if (= clayer R-Text1)
		(command "-layer" "m" "R-Text1" "c" "255" "" "")
		(setvar "clayer" "R-Text1")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	      
		     
(defun C:lyrcurText2 ()
  
   	(if (= clayer R-Text2)
		(command "-layer" "m" "R-Text2" "c" "100" "" "")
		(setvar "clayer" "R-Text2")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurUtility ()
  
   	(if (= clayer R-Utility)
		(command "-layer" "m" "R-Utility" "c" "51" "" "")
		(setvar "clayer" "R-Utility")
	)
(princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun C:lyrcurValves ()
  
   	(if (= clayer R-Valves)
		(command "-layer" "m" "R-Valves" "c" "210" "" "")
		(setvar "clayer" "R-Valves")
	)
(princ)
)





			    