;Attribute Updater for individual blocks. 
;Note, uses (ACET-ATTSYNC) function from autodesk express tools utilities ver1.38.
;Dean Jones, Jul 04, 2007


(defun C:MYATTSYNC ( / en blk blkdxf typ blkname )

(setq en (entsel "\n Select block: "))						;Select entity
(setq blk (car en))											;Get entity name
(setq blkdxf (entget blk))									;Get entity dxf properties
(setq typ (cdr (assoc 0 blkdxf)))							;Get entity TYPE

(if (and (= typ "INSERT") (= (cdr (assoc 66 blkdxf)) 1))	;Test, a block, with attributes.

		(progn
		(setq blkname (cdr (assoc 2 blkdxf)))				;Get block name.	
		
;*************************************************************************************************************************
		(arxload "battman")(acet-attsync blkname)			;loads "battman" and sync's the attributes for selected block.
;*************************************************************************************************************************

(princ "\nAttribute Syncronization completed successfully.")
		);end progn.
		
(alert "\nThe object selected does not have attributes, please try again.")

);end if
		
(princ)
)

