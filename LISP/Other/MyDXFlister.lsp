;;;My cleaner DXF Lister, that doesn't have to think about CDR or ASSOC, also less brackets.
;;;Compliments of Dean Jones, Apr. 04, 2007. 

'***********************************************************************************************
'***********************************************************************************************

(defun myDXFlister (num mylist)

(cdr (assoc num mylist))

(princ)
)

'***********************************************************************************************
'***********************************************************************************************




