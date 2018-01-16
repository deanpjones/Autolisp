;;;This routine is meant to handle DXF files and build routines for use with DXF codes.

;;;Create a VIEWER
	;;;Identify what type of entity?
	;;;Extract ALL Codes to view
	;;;Extract SPECIFIC Codes to view
	;;;How would you like them viewed?
	;;;Sort the Codes by preference?
	
	;;;Create a loop to keep printing CONSECUTIVE CODES.
	
	;;;Create a loop that goes thruough the list one at a time and enters the string as NEXTCODE.
(setq nextcode (	
	
(princ "\n*****************************************************************")
(princ (strcat "\n" nextcode)

(princ "\n*****************************************************************")

;;;Create a LISP BUILDER
	;;;Identify what type of entity?
	;;;Extract DXF codes.
		;;;Embedded DXF codes for ATTRIB, etc.
	;;;Ability to recognize INVALID entry (eg. REAL instead of STRING) (eg. 0, 1, 2, 4, 8, 16 needed)
	;;;Verify this before writing to the DXF Code.
	;;;Error Handler??
