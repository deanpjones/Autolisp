;Created to updated the OLD hBRC DWG#'S with the new hCPC DWG#'S.
;Courtesy of Dean Jones Feb.06, 2008.

(defun C:fixCPCpageconnector (/ dwglst en txt txtdxf typ txtstring )

;Current list from RBR-000-LST-010-0001 as of Feb.06, 2008.
(setq dwglst (list
"03.061.0001.01"  "ABA-001-GTH-000-0001"
"03.061.1000.01"  "ABA-001-GTH-000-0002"
"03.061.1001.01"  "ABA-001-GTH-000-0003"


"03.045.0001.01"  "ABA-002-GTH-000-0001"
"03.045.1000.01"  "ABA-002-GTH-000-0002"
"03.045.1001.01"  "ABA-002-GTH-000-0003"
"03.045.1001.02"  "ABA-002-GTH-000-0004"
"03.045.1001.03"  "ABA-002-GTH-000-0005"
"03.045.1002.01"  "ABA-002-GTH-000-0006"


"03.003.0001.01"  "PGE-001-GTH-000-0001"
"03.003.1000.01"  "PGE-001-GTH-000-0002"


"03.060.0001.01"  "TNG-001-GTH-000-0001"
"03.060.1000.01"  "TNG-001-GTH-000-0002"
"03.060.1001.01"  "TNG-001-GTH-000-0003"
"03.060.1001.02"  "TNG-001-GTH-000-0004"
"03.060.1002.01"  "TNG-001-GTH-000-0005"


"03.063.0001.01"  "TNG-002-GTH-000-0001"
"03.063.1000.01"  "TNG-002-GTH-000-0002"
"03.063.1001.01"  "TNG-002-GTH-000-0003"
"03.063.1002.01"  "TNG-002-GTH-000-0004"


"03.059.0001.01"  "BCU-001-GTH-000-0001"
"03.059.0001.02"  "BCU-001-GTH-000-0002"
"03.059.1000.01"  "BCU-001-GTH-000-0003"
"03.059.1001.01"  "BCU-001-GTH-000-0004"
"03.059.1002.01"  "BCU-001-GTH-000-0005"
"03.059.1003.01"  "BCU-001-GTH-000-0006"


"02.023.0001.01"  "BCU-002-GTH-000-0001"
"02.023.1000.01"  "BCU-002-GTH-000-0002"
"02.023.1001.01"  "BCU-002-GTH-000-0003"
"02.023.1002.01"  "BCU-002-GTH-000-0004"
"02.023.1002.02"  "BCU-002-GTH-000-0005"
"02.023.1003.01"  "BCU-002-GTH-000-0006"
"02.023.1004.01"  "BCU-002-GTH-000-0007"


"02.080.0001.01"  "BCU-003-GTH-000-0001"
"02.080.1000.01"  "BCU-003-GTH-000-0002"
"02.080.1001.01"  "BCU-003-GTH-000-0003"
"02.080.1002.01"  "BCU-003-GTH-000-0004"
"02.080.1003.01"  "BCU-003-GTH-000-0005"
"02.080.1004.01"  "BCU-003-GTH-000-0006"
"02.080.1005.01"  "BCU-003-GTH-000-0007"
"02.080.1005.02"  "BCU-003-GTH-000-0008"


"02.025.0001.01"  "BCU-004-GTH-000-0001"
"02.025.1000.01"  "BCU-004-GTH-000-0002"
"02.025.1001.01"  "BCU-004-GTH-000-0003"
"02.025.1002.01"  "BCU-004-GTH-000-0004"
"02.025.1003.01"  "BCU-004-GTH-000-0005"
"02.025.1004.01"  "BCU-004-GTH-000-0006"
"02.025.1005.01"  "BCU-004-GTH-000-0007"


"02.026.0001.01"  "BCU-005-GTH-000-0001"
"02.026.1000.01"  "BCU-005-GTH-000-0002"
"02.026.1001.01"  "BCU-005-GTH-000-0003"
"02.026.1002.01"  "BCU-005-GTH-000-0004"
"02.026.1003.01"  "BCU-005-GTH-000-0005"


"02.027.0001.01"  "BCU-006-GTH-000-0001"
"02.027.1000.01"  "BCU-006-GTH-000-0002"
"02.027.1001.01"  "BCU-006-GTH-000-0003"
"02.027.1002.01"  "BCU-006-GTH-000-0004"
"02.027.1003.01"  "BCU-006-GTH-000-0005"


"02.028.0001.01"  "BCU-007-GTH-000-0001"
"02.028.1000.01"  "BCU-007-GTH-000-0002"
"02.028.1001.01"  "BCU-007-GTH-000-0003"
"02.028.1002.01"  "BCU-007-GTH-000-0004"
"02.028.1002.02"  "BCU-007-GTH-000-0005"
"02.028.1002.03"  "BCU-007-GTH-000-0006"
"02.028.1003.01"  "BCU-007-GTH-000-0007"


"03.050.0001.01"  "NRB-001-GTH-000-0001"
"03.050.1001.02"  "NRB-001-GTH-000-0002"
"03.050.1001.01"  "NRB-001-GTH-000-0003"


"03.066.0001.01"  "SLP-001-GTH-000-0001"
"03.066.0001.02"  "SLP-001-GTH-000-0002"
"03.066.1000.01"  "SLP-001-GTH-000-0003"


"03.001.0001.01"  "COR-001-GTH-000-0001"
"03.001.1000.01"  "COR-001-GTH-000-0002"
"03.001.1001.01"  "COR-001-GTH-000-0003"
"03.001.1002.01"  "COR-001-GTH-000-0004"
"03.001.1003.01"  "COR-001-GTH-000-0005"
"03.001.1003.02"  "COR-001-GTH-000-0006"
"03.001.1004.01"  "COR-001-GTH-000-0007"
"03.001.1004.02"  "COR-001-GTH-000-0008"


"03.056.0001.01"  "COR-002-GTH-000-0001"
"03.056.1000.01"  "COR-002-GTH-000-0002"
"03.056.1001.01"  "COR-002-GTH-000-0003"
"03.056.1002.01"  "COR-002-GTH-000-0004"


"03.002.0001.01"  "COR-003-GTH-000-0001"
"03.002.1000.01"  "COR-003-GTH-000-0002"
"03.002.1001.01"  "COR-003-GTH-000-0003"
"03.002.1002.01"  "COR-003-GTH-000-0004"
"03.002.1002.02"  "COR-003-GTH-000-0005"


"03.057.0001.01"  "COR-004-GTH-000-0001"
"03.057.1000.01"  "COR-004-GTH-000-0002"
"03.057.1001.01"  "COR-004-GTH-000-0003"
"03.057.1002.01"  "COR-004-GTH-000-0004"
"03.057.1003.01"  "COR-004-GTH-000-0005"


"02.073.0001.01"  "KNA-001-GTH-000-0001"
"02.073.1000.01"  "KNA-001-GTH-000-0002"
"02.073.1001.01"  "KNA-001-GTH-000-0003"
"02.073.1001.02"  "KNA-001-GTH-000-0004"
"02.073.1002.01"  "KNA-001-GTH-000-0005"
"02.073.1003.01"  "KNA-001-GTH-000-0006"


"03.048.0001.01"  "GUT-001-GTH-000-0001"
"03.048.1000.01"  "GUT-001-GTH-000-0002"
"03.048.1001.01"  "GUT-001-GTH-000-0003"
"03.048.1001.02"  "GUT-001-GTH-000-0004"
"03.048.1001.03"  "GUT-001-GTH-000-0005"
"03.048.1002.01"  "GUT-001-GTH-000-0006"
"03.048.1003.01"  "GUT-001-GTH-000-0007"


"05.101.0001.01"  "GUT-002-GTH-000-0001"
"05.101.1000.01"  "GUT-002-GTH-000-0002"
"05.101.1001.01"  "GUT-002-GTH-000-0003"
"05.101.1001.02"  "GUT-002-GTH-000-0004"


"05.102.0001.01"  "GUT-003-GTH-000-0001"
"05.102.1000.01"  "GUT-003-GTH-000-0002"
"05.102.1001.01"  "GUT-003-GTH-000-0003"
"05.102.1001.02"  "GUT-003-GTH-000-0004"


"05.103.0001.01"  "GUT-004-GTH-000-0001"
"05.103.1000.01"  "GUT-004-GTH-000-0002"
"05.103.1001.01"  "GUT-004-GTH-000-0003"
"05.103.1001.02"  "GUT-004-GTH-000-0004"
"05.103.1001.03"  "GUT-004-GTH-000-0005"
"05.103.1001.04"  "GUT-004-GTH-000-0006"
))



(setq en (nentsel "\n Select page connector: "))				;select entity
(setq txt (car en))												;get entity name
(setq txtdxf (entget txt))										;get entity dxf properties
(setq typ (cdr (assoc 0 txtdxf)))								;get entity TYPE

(setq txtstring (cdr (assoc 1 txtdxf)))							;get TEXT STRING dxf property

(if (and (/= nil (member txtstring dwglst)) (= "ATTRIB" typ))	;TEST to see if ATTRIB and MATCH FOUND
	(progn
(setq txtdxf (subst (cons 1 (cadr (member txtstring dwglst))) (assoc 1 txtdxf) txtdxf))
(entmod txtdxf)
(entupd txt)
	)
(princ "\n***** This is NOT AN ATTRIBUTE or NO DWG MATCH FOUND. *****")
)










;***********************************************************************
;***********************************************************************
;Modified version of myblockupdate.lsp
(defun MYBLOCKUPDATE ( / blk blkdxf typ1 blkname blkfile )

(setq blk (cdr (assoc 330 txtdxf)))							;Get entity name
(setq blkdxf (entget blk))									;Get entity dxf properties
(setq typ1 (cdr (assoc 0 blkdxf)))							;Get entity TYPE

		(if (= typ1 "INSERT")
		(progn
(setq blkname (strcase (cdr (assoc 2 blkdxf))))				;Gets blockname selected.

(setq blkfile
		(if (not (findfile (strcat blkname ".dwg")))					;Checks autocad supports directories for this file?
			(cond
			((findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Flow\\" blkname ".dwg")))
			((findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Ortho\\" blkname ".dwg")))
			((findfile (strcat "S:\\Appsdata\\ProCAD\\Designer\\Iso\\" blkname ".dwg")))
			(T nil)
			)
			(findfile (strcat blkname ".dwg"))
		)
)

(if (and (= typ1 "INSERT") (/=  blkfile nil))					;Test, that it's a block, and that a block file exists.

;**************************************************************************************************************
;**************************************************************************************************************
(command "_.-insert" (strcat blkname "=" blkfile) (command))	;Updates the block with the specified filename.
;**************************************************************************************************************
;**************************************************************************************************************

(alert (strcat "\nThe block \"" blkname "\" cannot be updated, a file was not found."))		;If the file doesn't exist.
);end if.
(princ "\nBlock Update completed successfully.")
		);end progn.

		(alert "\nThe object selected is not a block, please try again.")	;If it's not a block.
		);end if.

;************************************************************************************************************************
;If there are attributes present.
;Added by Dean Jones, Aug 14, 2007.

(if (= (cdr (assoc 66 blkdxf)) 1)								;IF THERE ARE ATTRIBUTES PRESENT.
(progn (arxload "battman")(acet-attsync blkname))				;then... ATTSYNC.
)
;************************************************************************************************************************

(princ)
)
;***********************************************************************
;***********************************************************************









(MYBLOCKUPDATE)

(princ)
)
