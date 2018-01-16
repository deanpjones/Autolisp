

;;;Add a suffix or prefix for a piece of TEXT.
;;;Compliments of Dean Jones, June 26, 2006.
;;;Revised to retain prefix and suffix, July 25, 2006.


(defun C:te ( / p s en txt txtdxf txtstring txtstring2)


;;;***********************************************************************
;PREFIX TEST.
(if (= T (boundp 'txtprefix))																;test if PREFIX already exists.
	(progn
(setq p (getstring (strcat "\nAdd the prefix \"" txtprefix "\" or [new Prefix]:  ")))		;if YES continue, or P for new PREFIX.
	(cond
((= (strcase p) "P") (setq txtprefix (getstring T "\nEnter a PREFIX to add:  "))) 
(T (eval txtprefix))  
(T nil)
	)	
	)
(setq txtprefix (getstring T "\nEnter a PREFIX to add:  "))
)

(vl-propagate 'txtprefix)																	;SETS VARIABLE ACROSS EVERY DRAWING IN AUTOCAD. 				

;SUFFIX TEST.
(if (= T (boundp 'txtsuffix))																;test if suffix already exists.
	(progn
(setq s (getstring (strcat "\nAdd the suffix \"" txtsuffix "\" or [new Suffix]:  ")))		;if YES continue, or s for new suffix.
	(cond
((= (strcase s) "S") (setq txtsuffix (getstring T "\nEnter a SUFFIX to add:  "))) 
(T (eval txtsuffix))  
(T nil)
	)	
	)
(setq txtsuffix (getstring T "\nEnter a SUFFIX to add:  "))
)

(vl-propagate 'txtsuffix)																	;SETS VARIABLE ACROSS EVERY DRAWING IN AUTOCAD. 

;;;***********************************************************************


(while
	(setq en (nentsel (strcat "\nAdd \"" txtprefix "******" txtsuffix "\" to text entity: ")))
	(setq txt (car en))
	(setq txtdxf (entget txt))
	(setq txtstring (cdr (assoc 1 txtdxf)))

	
;Creates a new string and redefines the selected text.
(setq txtstring2 (strcat txtprefix txtstring txtsuffix))
(setq txtdxf (subst (cons 1 txtstring2) (assoc 1 txtdxf) txtdxf))


	(entmod txtdxf)
	(entupd txt)
)
(princ)
)

