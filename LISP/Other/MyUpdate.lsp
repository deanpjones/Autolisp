
;Fix for entities that cannot be selected but are visible.
;Happens after using revcld routines, etc.
;Compliments of Dean Jones, Dec 18, 2006.


(defun C:MYUPDATE ( / myss1 mysslen count)

(command "regen")						;Regenerate drawing.

(setq myss1 (ssget "X"))				;Get selection of ALL entities.

(setq mysslen (sslength myss1))			;Get NUMBER OF ENTITIES in selection.

(setq count mysslen)					;Set COUNT to the number of entities.
	(while (> count 0)					;While COUNT is greater or equal to zero(0)...

(setq count (1- count))					;COUNT down...

;*********************************************************************************
(entupd (ssname myss1 count))		;Update each entity name, one at a time!!!
;*********************************************************************************

	)
(princ "\nAll entities have been updated.")
(princ)
)