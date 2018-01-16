;one setting to recognize if the text is rotated 0deg or 90deg use East versus Northings.
;UCS orientation to world?
;N/S 0+00.000?? how to change the prefix?
;if ycoord is positive or negative?
;if north or south is more than 100 meters? "N. 1+"?

;--------------------------------------------------------------------------------------------

(defun c:northing (/ ent entdxf enty ymeter ystrngcon newystring y1 y2 ystring)


(setq ent (car (entsel "\n Select Northing/Southing: ")))	;select entity and get name
(setq entdxf (entget ent))					;get entity dxf properties

(setq enty (cadr (cdr (assoc 11 entdxf))))			;get Y coordinate of object


(setq ymeter (/ enty 1000))					;convert number to meters
(setq ystrngcon (rtos ymeter 2 3))				;convert coordinate to string

								;adds a "0" prefix if it is less than "100000.0"
(if 	(< enty 100000.0)
	(progn
		(setq newystring					
		(strcat "0" ystrngcon)
		)
	)
	(setq newystring ystrngcon)
)


(setq y1 (substr newystring 1 1))
(setq y2 (substr newystring 2))
(setq ystring (strcat "N. " y1 "+" y2))				;add prefix "N. " and "+" to middle of string	

;--------------------------------------------------------------------------------------------
(setq entdxf (subst (cons 1 ystring) (assoc 1 entdxf) entdxf))	;**OVERWRITES 'CONTENTS' with 'COORDINATE' data

(entmod entdxf)							;updates ENTITY dxf data
(entupd ent)							;updates SCREEN of update





;--------------------------------------------------------------------------------------------
(princ)		
)

;--------------------------------------------------------------------------------------------

