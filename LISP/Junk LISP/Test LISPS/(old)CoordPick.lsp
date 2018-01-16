;;;Find fix for (11 . xxx) group code if text justificaation is different.
;;;Find fix for all rotations and if rotated text is slightly off rotation.
;;;Find fix for testtxt cond expression to make sure it follows thru.
	;;;What if text is 20 deg? 




;;;Changes TEXT string to COORDINATE by selection.
;;;Compliments of Dean Jones, Jan. 20, 2006. 


(defun C:tc ( / en txt txtdxf txtstring txtrot txtcrdX txtcrdY pi0 pi1 pi2 pi3 testN testS testE testW txttest txtcrd coord crdlen crddiff zerostring coordend coordmid coordfront north south east west newtxtstring)

(while											;LOOP to repeat multiple times
(setq en (nentsel "\n Select text entity: "))
(setq txt (car en))
(setq txtdxf (entget txt))

;;;************************************************************
;;;Troubleshoot different entities, ATTRIB, BLOCKS, MTEXT, ETC.
;;;************************************************************

(setq txtstring (cdr (assoc 1 txtdxf)))			;get STRING DXF
(setq txtrot (cdr (assoc 50 txtdxf)))			;get ROTATION (RADIANS) DXF
(setq txtcrdX (cadr (assoc 11 txtdxf)))			;get (X) INSERTION DXF
(setq txtcrdY (caddr (assoc 11 txtdxf)))		;get (Y) INSERTION DXF


;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------
;;;test ranges to check rotation if its' slightly off of zero.
(cond										;checks what orientation the text is in? (pi0 = 0deg, pi1 = 90deg, etc. CCW)
((or (and (< (* 1.95 PI) txtrot) (>= (* 2 PI) txtrot)) (and (<= 0 txtrot) (> (* 0.05 PI) txtrot))) "pi0")
((and (< (* 0.45 PI) txtrot) (> (* 0.55 PI) txtrot)) "pi1")
((and (< (* 0.95 PI) txtrot) (> (* 1.05 PI) txtrot)) "pi2")
((and (< (* 1.45 PI) txtrot) (> (* 1.55 PI) txtrot)) "pi3")	
(T nil)
)

;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------
;;;Test for proper COORDINATE and RETURN it.
(if (= txtrot nil)
(princ "\n I can't spin a gypsy counterclockwise!?")
(setq pi0 (= txtrot 0) pi1 (= txtrot (/ PI 2)) pi2 (= txtrot PI) pi3 (= txtrot (* PI 1.5)))
)

(setq txttest
	(cond														;TEST COORDINATE and RETURN the proper STRING.
((setq testN (and (or pi0 pi2) (not (minusp txtcrdY)))) "N")	;test if it's a NORTH COORDINATE
((setq testS (and (or pi0 pi2) (minusp txtcrdY))) "S")			;test if it's a SOUTH COORDINATE	
((setq testE (and (or pi1 pi3) (not (minusp txtcrdX)))) "E")	;test if it's an EAST COORDINATE
((setq testW (and (or pi1 pi3) (minusp txtcrdX))) "W")			;test if it's a WEST COORDINATE	
(T nil)
	)
)

;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------
;;;Set COORDINATE to 6 DIGITS or more if the number is larger.

	(if (or (= txttest "N") (= txttest "S"))			;TEST to pass the right COORD on.
(setq txtcrd txtcrdY)							;if it IS "N or S" then use TXTCRDY
(setq txtcrd txtcrdX)							;else it is "E or W" then use TXTCRDX
	)
	
(setq coord (rtos (abs txtcrd) 2 0))									;COORDINATE real to string.
(setq crdlen (strlen coord))											;To see how many DIGITS are in the COORDINATE.
(setq crddiff (abs (- 6 crdlen)))										;DIFFERENCE between TOTAL DIGITS and 6 DIGITS (default).

(setq zerostring "")													;start ZEROSTRING as EMPTY STRING.
(repeat crddiff (setq zerostring (strcat "0" zerostring)))				;LOOP to put "0" zeros together.

	(cond														
	((>= crdlen 6) coord)												;RETURN string if LENGTH is greater or equal to 6 DIGITS.
	((< crdlen 6) (setq coord (strcat zerostring coord)))				;RETURN string with ZEROS added if it's less than 6 DIGITS.
	(T nil)
	)
(setq crdlen (strlen coord))											;REPEAT crdlen for CBREAK FUNCTION.	

;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------
;;;Break up Coordinate. (N or S or E or W?)

(setq coordend (substr coord (- crdlen 2) crdlen))						;END OF COORDINATE.
(setq coordmid (substr coord (- crdlen 4) (- crdlen (- crdlen 2))))		;MIDDLE OF COORDINATE.
(setq coordfront (substr coord 1 (- crdlen 5)))							;FRONT OF COORDINATE.

;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------
;;;Put STRING FOR COORDINATE together.

(setq north (strcat "N." coordfront "+" coordmid "." coordend))	;STRING for NORTH.
(setq south (strcat "S." coordfront "+" coordmid "." coordend))	;STRING for SOUTH.
(setq east (strcat "E." coordfront "+" coordmid "." coordend))	;STRING for EAST.
(setq west (strcat "W." coordfront "+" coordmid "." coordend))	;STRING for WEST.

(setq newtxtstring
	(cond														;TEST COORDINATE and RETURN the proper STRING.
((eval testN) north)
((eval testS) south)
((eval testE) east)
((eval testW) west)
(T nil)
	)
)

;;;----------------------------------------------------------------------------------------------
;;;----------------------------------------------------------------------------------------------



;;;Determine if STRING is E/W or N/S
;;;Troubleshoot different UCS's
	

;;;Change STRING to COORDINATE.
(if (= (type newtxtstring) 'STR)
(setq txtdxf (subst (cons 1 newtxtstring) (assoc 1 txtdxf) txtdxf))		;DO THIS
(princ "\n I can't pick up what you are putting down!?")				;ELSE prog failed.
)
;;;------------------------------------------------------------------------------

(entmod txtdxf)
(entupd txt)
)
(princ)
)

