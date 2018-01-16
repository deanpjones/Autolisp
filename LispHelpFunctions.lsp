;----------------------------------
;Changes the POLARITY of a number.
(defun nPol (num)
(1+ (~ num))
);END DEFUN.
;----------------------------------
;Draw Routine, with a list as an argument.
(defun polygon-List (lst / pt1 pt2)
(setq pt1 (getpoint "\nSelect first point for polygon base: "))
(setq pt2 (getpoint "\nSelect seconde point for polygon base: "))
(mapcar '(lambda (x) (command "polygon" x "edge" pt1 pt2)) lst)
(princ)
);END DEFUN.
;(polygon-list (list 3 4 5 6))
;----------------------------------
;Maplist function to run each element of one list against all elements of another list.
;(maplist lst1 lst2 func sort)
(defun maplist (lst1 lst2 func / lst ele output)
(setq lst lst1)
(while (/= lst nil)
(setq ele (car lst))
(setq output (append output (mapcar func lst2)))
(setq lst (cdr lst))
);END WHILE.
(princ (vl-sort output '<)) 	;Add vl-sort to remove redundancies, removes duplicates.
(princ)
);END DEFUN.
;Call the function in LAMBDA for using (ele) to access elements in first list.
;(maplist (list 1 2 3 4) (list 1 2 3 4) '(lambda (x) (* ele x)))
;(maplist lst1 lst2 '(lambda (x) (* ele x)))
;----------------------------------
;VL-FUNCTIONS
;See VISUAL LISP DEVELOPERS BIBLE - David Stein
(setq aa (vlax-get-acad-object))
(vlax-dump-object aa)				;Lists objects properties.
(vlax-dump-object aa T)				;Lists objects properties, and lists all methods that apply.

(setq ent (car (entsel "\nSelect object: ")))	;Gets ENTITY name
(setq objLine (vlax-ename->vla-object ent))		;Converts ENTITY to VLA object.
(vla-get-Layer objLine)				;Get Layer
(vla-get-Color objLine)				;Get Color
(vla-get-Lineweight objLine)		;Get Lineweight
(vla-put-Layer objLine "Contin")	;Set layer to "Contin"
(vla-put-Color objLine acMagenta)	;Set color to "Magenta"

;----------------------------------
;LIST FUNCTIONS
;Remove Doubles from list (by devitg)
;(setq lst (list 2 2 3 3 4 5 5 6 7 7 8 9))
(defun remove-doubles (lst)
(if lst (cons (car lst) (remove-doubles (vl-remove (car lst) lst)))) 
);END DEFUN.

;----------------------------------
;Creates EXCEPTION LIST from function (* x every-element-lstN)
;(setq lstN (list 5 7 11 13 17 19 23 25 29 31 35 37)) --> (25 35)
(defun except-list (lstN)

(setq lst lstN l nil)
(while (/= nil lst)
(setq l (vl-sort (remove-doubles (append l (mapcar '(lambda (x) (* x (car lst))) lst))) '<))
(setq lst (cdr lst))
);END WHILE.
(princ)

(vl-remove-if '(lambda (x) (> x (last lstN))) l)
);END DEFUN.
;----------------------------------

;Create a LIST with an OPERATOR to EVAL
(setq dstlst '(+ )) 
(setq dstlst (append dstlst (list 1 2 3)))
(eval dstlst)		;EVAL is the same as ! at command line.

;Append OPERATOR to LIST.
(setq a 1 b 2 c 3)
(setq lst (list a b c))
(append '(+) lst) ;-->(+ 1 2 3)
(eval (append '(+) lst)) ;-->6

;----------------------------------------------------------
;EVAL to replace COND function.
(setq edval 1.0 retval "IM")

(defun IM (val) (* val 25.4))
(defun MI (val) (/ val 25.4))

(cond
     ((= retval "IM") (IM edval))
     ((= retval "MI") (MI edval))
);cond


((eval (read retval)) edval) ;replaces COND function above.
;----------------------------------------------------------
;Error Trapping
(defun *error* (errmsg)
	(princ "\n-----------------------------------------")
	(princ "\nAn error has occurred in the lisp program. ")
	(prompt (strcat "\nerror: *** " errmsg " ***"))
	(princ "\n-----------------------------------------")
	(princ)
);END DEFUN

(defun saveGETVAR (/)	;Add to beginning of LISP programs with SETVAR changes.
(setq lst (list "OSMODE" "AUPREC"))
(setq getvarLST (mapcar '(lambda (x) (cons x (getvar x))) lst))
);END DEFUN.
;(assoc "OSMODE" getvarLST)	;Will return the OSMODE value.

(defun resetGETVAR ()	;Add to end of LISP programs to reset in the event of an *error*
;saveGETVAR passes (getvarLST) variable to mapcar below.
(mapcar '(lambda (x) (setvar (car x) (cdr x))) getvarLST)
);END DEFUN.


;Test *ERROR* function.
(defun c:test (/ *error*)
	(saveGETVAR)				;Saves GETVAR's from above function.
  
  (defun *error* (msg)
	(resetGETVAR)				;Resets GETVAR's to original settings if TEST2 fails.
    (princ "error ABCD: ")
    (princ msg)
    (princ)
  );END DEFUN *error*
  
	(setvar "OSMODE" 16)		;Sets OSMODE for TEST2
	(setq p1 (getpoint "getpoint"))
	(setq p2 (getpoint "getpoint"))
  (getstring "\nHit Esc to force an Error...")
  (princ)
);END DEFUN.
;----------------------------------------------------------
;APPLY and MAPCAR.
;APPLY puts a function to the whole list with ONE result.
;MAPCAR puts a function to each element of the list with a LIST result.

;Multiply NUM to all element of LST.
(defun xx (num lst) (mapcar '(lambda (x) (* x num)) lst))

;MAPCAR with LAMBDA
(mapcar '(lambda (x) (* x 5)) '(1 2 3))

(mapcar (function (lambda (x) (* x x))) '(1 2 3))

(setq lst (list 5 7 11 13 17 19))
(mapcar '(lambda (x) (foreach n lst (* x n))) lst)
;--------------------------------
;Typical WHILE loop with COUNT.
(setq lst (list 5 7 11 13 17 19))
(setq n (1- (length lst)) lst2 nil)
(while (>= n 0)
(setq y (nth n (reverse lst)))
(setq lst2 (append lst2 (mapcar '(lambda (x) (* x y)) lst)))
(setq n (1- n))
);END WHILE.
(vl-sort lst2 '<)
;--------------------------------
;Same WHILE LOOP with different method using CAR/CDR.
(setq lst (list 5 7 11 13 17 19) lst2 nil)
(while (/= lst nil)
(setq lst2 (append lst2 (mapcar '(lambda (x) (* (car lst) x)) lst)))
(setq lst (cdr lst))
);END WHILE.
(vl-sort lst2 '<)
;--------------------------------
;???????????????????????????????????
;TRY TO MAKE MAPLIST WITH FUNCTION AND LST AS ARGUMENTS
(defun maplist (func mylist / lst2)
(setq lst mylist lst2 nil)
(while (/= lst nil)
(setq lst2 (append lst2 (mapcar '(lambda (x) func) lst)))
(setq lst (cdr lst))
);END WHILE.
(vl-sort lst2 '<)
);END DEFUN.
;???????????????????????????????????
;LEE MAC EXAMPLE TO STUDY
;http://lee-mac.com/mapcarlambda.html
(defun AveragePoint ( l )
  (mapcar
    (function
      (lambda ( x ) (/ x (float (length l))))
    );END FUNCTION.
    (apply 'mapcar (cons '+ l))
  );END MAPCAR.
);END DEFUN.

(AveragePoint '((2 3 1) (2 4 1) (1 5 1)))

==> (1.66667 4.0 1.0)

;???????????????????????????????????

;(setq lstN (list 2 3 4 5 6 7 8 9))
;(lstN) to be NUMBER LIST.
(setq lst lstN lstOUT nil)
(while 
(and
(/= lst nil)
(/= nil
	(setq lstOUT (append lstOUT
	(vl-remove-if '(lambda (x) (> x (car (vl-sort lst '>))))		;remove ELEMENTS greater than MAX NUMBER in orig list.
		(mapcar '(lambda (x) (* x (car lst))) lstN)
	);END VL-REMOVE-IF.
	));END SETQ & APPEND.
));END WHILE TEST.
(setq lst (cdr lst))
);END WHILE.

(vl-sort-i lstOUT '=)
;???????????????????????????????????
(setq lst (list 2 3 4 5 6 7 8 9))
(setq num (car lst))
(apply '(lambda (x) (strcat (itoa x))) lst)
(setq lst (cdr lst))

(setq lst (list 2 3 4 5 6 7 8 9))
(setq num (car lst))
(foreach n lst (terpri)(princ (* n num)))

(mapcar '(lambda (x) (* x 
(foreach n lst (* n num))
)) lst)


(defun maplist (lst1 lst2 / lst ele)
(setq lst lst1 output nil)
(while (/= lst nil)
(setq ele (car lst))
(setq output (append output (mapcar '(lambda (x) (* ele x)) lst2)))
(setq lst (cdr lst))
);END WHILE.
;(vl-sort output '<)
);END DEFUN.
;(maplist (list 1 2 3 4) (list 1 2 3 4)) ;!output

(defun flower ()
(setq pt1 (getpoint "\nSelect first point for circle: "))
(command "circle" pt1 "10")
(command "circle" "2p" pt1 "@10,0")
;(10,0)(-10,0)(0,10)(0,-10)
(
(princ)
);END DEFUN.

;Returns a list of four point options from a point.
(defun four-directions (n)
(setq n x)
(list '(0 x) '(0 -x) '(x 0) '(-x 0))
(nPol x)
);END DEFUN.

;???????????????????????????????????
(setq cen (getpoint "\nSelect point for center: "))
(setq rad (getpoint "\nSelect point for radius: "))
(setq pt1 (list (car pt) (cadr pt)))
(setq pt2 (reverse pt1))
(setq pt3 (list (car pt) (nPol (cadr pt))))
(setq pt4 (reverse pt3))

(mapcar '(lambda (x) (command "circle" "2p" pt (strcat "@" (rtos (car x)) "," (rtos (cadr x))))) (list pt1 pt2 pt3 pt4))
;???????????????????????????????????
;Created Dec.17, 2010 by Dean Jones

;--------------------------------------------
;--------------------------------------------
;List for xFN FUNCTION
(defun xFN (increment listlen startNum)
(setq listxFN (list startNum))
(repeat listlen (setq listxFN (cons (+ increment (car listxFN)) listxFN)))
(reverse listxFN)
);END DEFUN.
;Command: (xfn 1 9 0)
;(0 1 2 3 4 5 6 7 8 9)
;Command: (xfn 2 9 0)
;(0 2 4 6 8 10 12 14 16 18) EVEN #'s
;Command: (xfn 2 9 1)
;(1 3 5 7 9 11 13 15 17 19) ODD #'s 
;--------------------------------------------
;--------------------------------------------
;(vl-remove-if 'vl-symbolp (list pi t 0 "abc"))
;(vl-remove-if 'vl-symbolp (list 1 3 5 7 9 11 13 15 17 19))

;Command: (setq aa (xfn 2 12 5))
;(5 7 9 11 13 15 17 19 21 23 25 27 29)
;Command: (nth 2 aa)
;9
;Command: (xfn 3 12 3)
;(3 6 9 12 15 18 21 24 27 30 33 36 39)
;------
;(setq list1 (xfn 2 24 5))
;=(5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49 51 53)
;(setq list2 (xfn 3 24 2))
;=(2 5 8 11 14 17 20 23 26 29 32 35 38 41 44 47 50 53 56 59 62 65 68 71 74)
;(foreach n list2 (setq list1 (vl-remove (nth n list1) list1)))
;=(5 7 13 15 17 23 25 29 33 37 39 45 47 49)
;Close but not exactly right
;------
;--------------------------------------------
;--------------------------------------------

;;;?????????????????????????????
(defun MODx (mylist modulo)
(setq listX nil)
;(mapcar '(lambda (mylist) (rem mylist 9)))
;(mapcar '(lambda (rem mylist 9) mylist))
(mapcar '1+ mylist)
(repeat (length mylist) (setq listX (cons (foreach n mylist (rem n 9)) listX)))
;???(repeat (length mylist) (setq listX (cons (foreach n mylist (rem n modulo)) listX)))
;???(foreach n mylist (princ (rem n 9)) (princ))
)
;;;?????????????????????????????

;Adds a VALUE to each variable in a list.
(defun ADDlist (mylist value)
(mapcar '(lambda (x) (+ value x)) mylist) 
)


;List for 1FN
(defun 1FN ()
(setq list1FN (list 0))
(repeat 9 (setq list1FN (cons (+ 1 (car list1FN)) list1FN)))
(reverse list1FN)
)

;List for 2FN
(defun 2FN ()
(setq list2FN (list 0))
(repeat 9 (setq list2FN (cons (+ 2 (car list2FN)) list2FN)))
(reverse list2FN)
)

;List for 3FN
(defun 3FN ()
(setq list3FN (list 0))
(repeat 9 (setq list3FN (cons (+ 3 (car list3FN)) list3FN)))
(reverse list3FN)
)

;List for 4FN
(defun 4FN ()
(setq list4FN (list 0))
(repeat 9 (setq list4FN (cons (+ 4 (car list4FN)) list4FN)))
(reverse list4FN)
)

;List for 5FN
(defun 5FN ()
(setq list5FN (list 0))
(repeat 9 (setq list5FN (cons (+ 5 (car list5FN)) list5FN)))
(reverse list5FN)
)

;List for 6FN
(defun 6FN ()
(setq list6FN (list 0))
(repeat 9 (setq list6FN (cons (+ 6 (car list6FN)) list6FN)))
(reverse list6FN)
)

;List for 7FN
(defun 7FN ()
(setq list7FN (list 0))
(repeat 9 (setq list7FN (cons (+ 7 (car list7FN)) list7FN)))
(reverse list7FN)
)

;List for 8FN
(defun 8FN ()
(setq list8FN (list 0))
(repeat 9 (setq list8FN (cons (+ 8 (car list8FN)) list8FN)))
(reverse list8FN)
)

;List for 9FN
(defun 9FN ()
(setq list9FN (list 0))
(repeat 9 (setq list9FN (cons (+ 9 (car list9FN)) list9FN)))
(reverse list9FN)
)

;MOD(9) applied to a number.
(defun mod9 (n)
(rem n 9)
);END DEFUN.

;MOD(n) applied to a number.
(defun modN (n mod)
(rem n mod)
);END DEFUN.

;MOD(n) applied to a list.
(defun modLST (lst mod)
(mapcar '(lambda (x) (rem x mod)) lst)
);END DEFUN.

;Find EVERY (nth) number in a list.
;eg. lst (2 4 6 8 10 12 14 16 18 20)
;every 2nd # is (4 8 12 16 20)

;-----------------------------------------------------------------------------
;Find LAST DIGIT in a number
(defun LastN (n)
(rem n 10)
);END DEFUN.

;Test for ODD numbers.
	;Uses LastN function.
(defun Odd (n)
(if (or (= 1 (LastN n))(= 3 (LastN n))(= 5 (LastN n))(= 7 (LastN n))(= 9 (LastN n)))
T
nil
);END IF.
);END DEFUN.

;Test for EVEN numbers.
	;Uses LastN function.
(defun Even (n)
(if (or (= 2 (LastN n))(= 4 (LastN n))(= 6 (LastN n))(= 8 (LastN n))(= 0 (LastN n)))
T
nil
);END IF.
);END DEFUN.

;Test of DIVISIBLE BY 3
	;Uses Mod9 function.
(defun Div3 (n)
(if (or (= 3 (mod9 n))(= 6 (mod9 n))(= 0 (mod9 n)))		;(0=9)zero is equal to nine.
T
nil
);END IF.
);END DEFUN.

;Test for SEMI-PRIME
	;Uses Even function.
	;Uses Div3 function.
(defun sPrime (n)
;(if (and (not (Even n))(not (Div3 n)))
(if (or (even n)(div3 n))
nil
T
);END IF.
);END DEFUN.

;Creates LIST for SEMI-PRIME's up to NUMBER
	;Uses sPrime function.
	;Uses xFN function.
(defun sPrimeLst (n / lst)
(setq lst (xFN 1 (1- n) 1))
;(vl-remove-if '(lambda (x) (or (even x)(div3 x))) lst)
(vl-remove-if '(lambda (x) (or (= x 1)(not (sPrime x)))) lst)
);END DEFUN.

;Removes LAST ELEMENT from list
(defun BUTLAST (lst)
(reverse (cdr (reverse lst)))
);END DEFUN.

;Test for REAL-PRIME
	;Uses sPrime function.
	;Uses sPrimeLst function.
	;Uses BUTLAST function.
(defun rPrime (n / lst)
(setq lst (BUTLAST (sPrimeLst n)))
(if (sPrime n)
	(if 
	(vl-some '(lambda (x) (= 0 (rem n x))) lst)
	nil
	T
	);END IF.
nil
);END IF.
);END DEFUN.
;(vl-every '(lambda (x) (/ x n)) lst)
;(vl-remove-if '(lambda (x) (/  x n )) lst)

;Find FACTORS OF 2.
	;Uses Even function.
(defun Factors2 (n / num lst2)
(setq num n)
(while (Even num)
(setq lst2 (append (list 2) lst2))
(setq num (/ num 2))
);END WHILE.
(terpri)(princ lst2)
(princ)
);END DEFUN.

;Find FACTORS OF 3.
	;Uses Div3 function.
(defun Factors3 (n / num lst3)
(setq num n)
(while (Div3 num)
(setq lst3 (append (list 3) lst3))
(setq num (/ num 3))
);END WHILE.
(terpri)(princ lst3)
(princ)
);END DEFUN.

;Creates REAL PRIME list.
	;Uses sPrimeLst function.
	;Uses rPrime function.
(defun rPrimeLst (n)
(append (list 2 3) (vl-remove-if '(lambda (x) (not (rPrime x))) (sPrimeLst n)))
);END DEFUN.
;-----------------------------------------------------------------------------