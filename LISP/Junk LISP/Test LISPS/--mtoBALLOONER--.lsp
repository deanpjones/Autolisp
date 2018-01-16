;;;mto Ballooner.
;;;Created xxxxxx, 2005 by Dean Jones
;;;For global variables in a routine, declare the variable where you want it available (eg. declare in C:FUN for global, declare in SUBFUN for more local.)


(defun C:BALLOONER ( / blkcoord)
(GETBLOCK)
(princ blkcoord)
(princ)
)

;************************************************************************************************
;************************************************************************************************
		(setq blk (ssname ss1 (setq count (1- count))))		;get BLOCK name.
(SUBBLOCKDXF blk)
(SUBATTDXF att)

;SEE BLOCK SUBROUTIN
(defun SUBBLOCKDXF ( blk / blkdxf blktyp blkhasatt blkfittyp blkcoord)
;NEED value for BLK to input for SUBROUTINE.
(setq blkdxf (entget blk))							;get BLOCK DXF data.
(setq blktyp (cdr (assoc 0 blkdxf)))				;get TYPE of entity.
(setq blkhasatt (cdr (assoc 66 blkdxf)))			;see if entity has ATTRIBUTES.
(setq blkfittyp (cdr (assoc 2 blkdxf)))				;get FITTING TYPE for entity.
(setq blkcoord (cdr (assoc 10 blkdxf)))				;get COORDINATES (X Y Z) of entity.
)
;************************************************************************************************
;************************************************************************************************
;GLOBAL VARIABLES  --> att blk blkdxf


(defun SUBATTDXF ( att / attdxf)
;NEED value for ATT to input for SUBROUTINE.
;SEE FIRST ATTRIBUTE		
			(setq att (entnext blk))						;get ATTRIBUTE name.
			(setq attdxf (entget att))						;get ATTRIBUTE DXF data.
			
				(if (= (cdr (assoc 2 attdxf)) "BOM_NO")		;TEST for "BOM_NO" attribute.
				(progn
			(setq BOM_NO (cdr (assoc 1 attdxf))) 			;RETURN "BOM_NO" value.
			(setq FIT_TYP (cdr (assoc 2 blkdxf)))			;RETURN the type of fitting.
			(princ (strcat "\n The fitting \"" FIT_TYP "\" BOM value is \"" BOM_NO "\"."))		;PRINT INFO.
			(princ)
				)											;END PROGN.
				)											;END IF.
;SEE REMAINING ATTRIBUTES		
			(while (/= (cdr (assoc 0 attdxf)) "SEQEND")  	;TEST until there are NO MORE ATTRIBUTES.
			(setq att (entnext att))						;get NEXT ATTRIBUTE name.
			(setq attdxf (entget att))						;get NEXT ATTRIBUTE DXF data.
			
				(if (= (cdr (assoc 2 attdxf)) "DESC_1")		;TEST for "BOM_NO" attribute.
				(progn
			(setq DESC_1 (cdr (assoc 1 attdxf))) 			;RETURN "BOM_NO" value.
			(setq FIT_TYP (cdr (assoc 2 blkdxf)))			;RETURN the type of fitting.
			(princ (strcat "\n The fitting \"" FIT_TYP "\" description is \"" DESC_1 "\"."))		;PRINT INFO.
			(princ)
				)											;END PROGN.
				)											;END IF.
			)												;END WHILE.
;************************************************************************************************
;************************************************************************************************
;************************************************************************************************
;************************************************************************************************


;how to handle hierchy of blocks and attributes.
(SUBALLBLKS)
(organize into groups)
(getallflgblks)
(getallgskblks)
(getallbltblks)
	(SUBBLKDXF)
	(any other specific data)
	(blkname)
	(blkcoord)
	(blktype)
	(if blk has attributes?)
		(SUBATTDXF)
		(any other specific data)
		(attBOM_NO)
		(attBOM_NOnum)
	

(blkname (getallblks
(count (getblkdxf (getblkcoord) (loop [getatt1] [getatt2] [getatt3])))
))
	
;;;for each BLOCK get (<Entity name: 7ef8a678>) (0 . "INSERT") (66 . 1) (2 . "ftg_blk") (10 99.0 99.0 0.0)
;;;for each ATTRIBUTE get (<Entity name: 7ef8a624>) (0 . "ATTRIB") (66 . 1) (2 . "BOM_NO") (1 . 23)

;;;use the BLKCOORD for ZOOM LOCATION.
;;;use the BLKCOORD for start of DRAWING A LEADER

(organizeblklist)
;DO ALL (FLANGES, GASKETS, BOLTS, ISOLATION KITS, SPEC BLINDS), WELD FITTINGS, THR'D FITTINGS, VALVES, MISC, and PIPE LAST.

(zoomlocation)
;ZOOM to location of BLOCK with appropriate ZOOM FACTOR.

(balloondraw)
;DRAW a BALLOON with leader (unless "right-click" for no-leader).

(balloonFIELD)
;enter a FIELD associated to the BALLOON just drawn.

;************************************************************************************************
;************************************************************************************************

(defun GETBLOCK ( / ss1 sslen count blk blkdxf blktyp att attdxf BOM_NO FIT_TYP DESC_1)

(setq ss1 (ssget "X" 
 '(
    (-4 . "<OR")
(2 . "flg_blk")
(2 . "gsk_blk")
(2 . "blt_blk")

(2 . "ftg_blk")

(2 . "scr_blk")
(2 . "nip_blk")

(2 . "val_blk")
(2 . "mis_blk")

(2 . "pip_blk")

(2 . "sup_blk")
    (-4 . "OR>")
  )
)
)

;DO ALL (FLANGES, GASKETS, BOLTS, ISOLATION KITS, SPEC BLINDS), WELD FITTINGS, THR'D FITTINGS, VALVES, MISC, and PIPE LAST.

(setq sslen (sslength ss1))												;GETS the # OF BLOCKS.
(princ (strcat "\n There are " (itoa sslen) " number of BOM items."))	;PRINT INFO.
(princ)

(setq count sslen)													;SETS COUNT for extraction.
	(while (not (= count 0))										;WHILE, until there are NO BLOCKS.

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;HOW DO I EXTRACT INFO THAT PERTAINS TO EACH BLOCK OR ATTRIBUTE? (eg. BLK1-ATT1,ATT2,ATT3 BLK2-ATT1,ATT2,ATT3 BLK3-ATT1,ATT2,ETC.)

;SEE BLOCK
		(setq blk (ssname ss1 (setq count (1- count))))		;get BLOCK name.
		(setq blkdxf (entget blk))							;get BLOCK DXF data.
		(setq blktyp (cdr (assoc 0 blkdxf)))				;get TYPE of entity.
		(setq blkcoord (cdr (assoc 10 blkdxf)))				;get COORDINATES (X Y Z) of entity.
		;HOW DO I GET THE blkcoord TO ANOTHER FUNCTION???
																
;SEE FIRST ATTRIBUTE		
			(setq att (entnext blk))						;get ATTRIBUTE name.
			(setq attdxf (entget att))						;get ATTRIBUTE DXF data.
			
				(if (= (cdr (assoc 2 attdxf)) "BOM_NO")		;TEST for "BOM_NO" attribute.
				(progn
			(setq BOM_NO (cdr (assoc 1 attdxf))) 			;RETURN "BOM_NO" value.
			(setq FIT_TYP (cdr (assoc 2 blkdxf)))			;RETURN the type of fitting.
			(princ (strcat "\n The fitting \"" FIT_TYP "\" BOM value is \"" BOM_NO "\"."))		;PRINT INFO.
			(princ)
				)											;END PROGN.
				)											;END IF.
;SEE REMAINING ATTRIBUTES		
			(while (/= (cdr (assoc 0 attdxf)) "SEQEND")  	;TEST until there are NO MORE ATTRIBUTES.
			(setq att (entnext att))						;get NEXT ATTRIBUTE name.
			(setq attdxf (entget att))						;get NEXT ATTRIBUTE DXF data.
			
				(if (= (cdr (assoc 2 attdxf)) "DESC_1")		;TEST for "BOM_NO" attribute.
				(progn
			(setq DESC_1 (cdr (assoc 1 attdxf))) 			;RETURN "BOM_NO" value.
			(setq FIT_TYP (cdr (assoc 2 blkdxf)))			;RETURN the type of fitting.
			(princ (strcat "\n The fitting \"" FIT_TYP "\" description is \"" DESC_1 "\"."))		;PRINT INFO.
			(princ)
				)											;END PROGN.
				)											;END IF.
			)												;END WHILE.
			
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
			
	)														;END WHILE for blocks.
(princ)
)
;************************************************************************************************
;************************************************************************************************
(defun ORGMTO ( / )

;MAKE ASSOCIATION LIST for all components and organize them.
;DO ALL (FLANGES, GASKETS, BOLTS, ISOLATION KITS, SPEC BLINDS), WELD FITTINGS, THR'D FITTINGS, VALVES, MISC, and PIPE LAST.

(princ)
)
;************************************************************************************************
;************************************************************************************************
;ZOOM near to attribute that needs to be placed.
(vl-cmdf "zoom" "o" pause "")
(vl-cmdf "zoom" "s" "1/30xp")

(defun zss (/ ss)
(setq ss (cadr (ssgetfirst)))
(if (not ss)(setq ss (ssget)))
(if ss
(progn
(command "zoom")
(mapcar 'command (acet-geom-ss-extents ss 1))				;must have Express Tools.
)
)
(princ)
)
;************************************************************************************************
;************************************************************************************************
(defun BALPLACE ( / )






;insert balloon with leader from user based on COORDINATE of each attribute.
(vl-cmdf "line" pt1 
(vl-cmdf "-insert" "C:/_Blocks/700 - ISO'S/SMART BALLOONS.dwg" (setq pt2 (getpoint "Place balloon: ")) "" "1" "0")

(princ)
)
;************************************************************************************************
;************************************************************************************************
(defun BALINFO (sslen / )
(princ (strcat "\n The fitting \"" sslen))
;insert field into EACH BALLOON.

(princ)
)
;************************************************************************************************
;************************************************************************************************
;************************************************************************************************
;************************************************************************************************




