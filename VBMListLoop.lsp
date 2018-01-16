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