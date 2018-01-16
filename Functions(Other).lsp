;$Id: STDLIST.LSP 0.5006 2000/12/31 10:59:00 rurban Rel $ -*-AutoLISP-*-
;;; Time-stamp: <2000-12-31 11:33:04 rurban>
;;; Copyright (c) 1991,1998,1999 by Reini Urban
;;; Available for free at http://xarch.tu-graz.ac.at/autocad/stdlib/
;;;
;;; Permission to use, copy, modify and distribute this software and its
;;; documentation for any purpose is hereby granted without fee, provided
;;; 1) that the above copyright notice appear in all copies,
;;; 2) that the copyright notice, this permission notice and the pointer
;;;    where to download the source code for free appear in the
;;;    supporting documentation of source code distributions,
;;; 3) that the name of Reini Urban not be used in advertising or
;;;    publicity pertaining to distribution of the software and
;;; 4) that modifications without changing the defined function and
;;;    symbol names may not be published, distributed nor copied
;;; without specific, written prior permission.
;;;
;;; No Warranty
;;; Reini Urban makes no representations about the suitability of this
;;; software for any purpose, without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. It is provided
;;; "as is" without express or implied warranty.
;;; See the full Disclaimer for all detailed warranty exclusions.
;;; --------------------------------------------------------------------
;;; List functions for the STDLIB

;;; STATUS:
;;; Tested and stable.
;;; added STD-SETNTH, STD-RPLACE is depricated and will be removed.
;;; std-%every-n and std-%some-n don't work yet.
;;; Points moved to seperate STDPOINT module.
;;; Sets and esp. STD-INTERSECTION are incorrect with duplicates.
;;; Recursive functions are almost completely replaced by iterative ones
;;;   not to crash on large lists. (stability)
;;; STD-POSITION takes no strings => STD-STRING-POSITION
;;; STD-CENTROID moved to STDPOINT and renamed to GEOM-CENTROID2D
;;; added EVERY and SOME functionality
;;;
;;; There's no function to search for a list in a list.
;;; You might want to try
;;;   http://xarch.tu-graz.ac.at/autocad/lisp/whmatch.lsp
;|

Predicates
(CONSP	x)		; not empty list?
(STD-DOTTED-PAIR-P x)	; (a . b)
(STD-NOT-PROPER-LIST-P	x) ; (a b . c) also
(STD-STRING-LIST-P x)	; a list of strings?
(STD-NUMBER-LIST-P x)	; a list of numbers?

Accessors
 single elements
(FIRST	lst)		; as car
(SECOND	lst)		; as cadr
(THIRD	lst)		; as caddr
(FOURTH	lst)		; as cadddr
(FIFTH	lst)		; as (car (cddddr))
(SIXTH	lst)		; as (cadr (cddddr))
(SEVENTH lst)		; as (caddr (cddddr))
(EIGHT	lst)		; as (cadddr (cddddr))
(REST	lst)		; as cdr
(STD-LIST-LENGTH   lst)	;
(STD-ELT 	   lst i)	; safe NTH variant (throws error)
(STD-POSITION	   x lst)	; position of x in lst or nil
(STD-POSITION-IF   pred lst)	; first x matching pred
(STD-POSITION-IF-NOT pred lst)	; first x not matching pred
(STD-RPOSITION	   x lst)	; last x in lst
(STD-RASSOC	   x alst)	; reverse assoc
(STD-MEMBER-IF	   pred lst)	; member with predicate
(STD-MEMBER-IF-NOT pred lst)	;
(STD-COUNT         x lst)
(STD-COUNT-IF      pred lst)
(STD-COUNT-IF-NOT  pred lst)
 subsequences:
(STD-FIRSTN	n lst)		; the first n elements
(STD-NTHCDR	n lst)		; the rest after std-firstn
(STD-SUBSEQ	lst start end)	; inclusive start, exclusive end
(STD-BUTLAST	lst)		; list without the last element
(STD-SELECT     lst i)		; extended ELT for subsequences

Modifying
 not destructive operations
(STD-ADJOIN	x lst)		; cons if new
(STD-SETNTH     new i lst)	; replace at position
; (STD-RPLACE	lst i new)	; depricated: replace at position
(STD-DELPOS	i lst)		; delete at position
(STD-REMOVE	x lst)		;
(STD-REMOVE-IF	       pred lst);
(STD-REMOVE-IF-NOT     pred lst); keep if
(STD-REMOVE-DUPLICATES lst)	;
(STD-SPLIT-LIST	n lst)		; split into sublists of length n
(STD-FLATTEN	lst)		; tree => flat list
(STD-ROTATE-LEFT lst)		; rotate leftwise: put first to back
(STD-ROTATE-RIGHT lst)		; rotate rightwise: put last to front
 push/pop ("destructive")
(STD-PUSH	x 'lst)		;
(STD-POP	'lst)		;
(STD-PUSHNEW	x 'lst)		;
(STD-PUSHMAX	x 'lst nmax)	; keep a maximal stacksize, queue-like

Mapping, Iteration:
(STD-MAPATOM	func tree)	; map on each atom in the tree
(STD-EVERY      pred lst)	; T if pred is non-nil for every element
(STD-EVERY-N    pred lists)	; for predicates taking more args
(STD-SOME       pred lst)	; T if pred is non-nil for some elements
(STD-SOME-N     pred lists)	; for predicates taking more args
(STD-%OR        lst)		; returns the first non-nil value

Set Operations: (not ordered, but ignoring duplicates)
(STD-UNION		lst1 lst2) ; all elements from both, not stable
(STD-INTERSECTION	lst1 lst2) ; those elements which are on both
(STD-SET-DIFFERENCE	lst1 lst2) ; lst1 without lst2
(STD-SET-EXCLUSIVE-OR	lst1 lst2) ; only elements in exactly one
(STD-SUBSETP		subset set); all eles of subset member of set?
(STD-SET-EQUAL-P        lst1 lst2) ; same members ignoring order?

Others:
(STD-MAKE-LIST	n def)		; => (def def...) of length n
(STD-INT-LIST	n)		; => (0 1 2 3 ... n-1) of length n
(STD-ISEQ  	start end)	; integer sequence (start ... end)
(STD-RSEQ  	start end n)	; real sequence, (start ... end)
(STD-NXTCYC	i n incr-func)	; next element in integer ringbuffer
(STD-SORT       lst less-pred)	; does not delete duplicates
(STD-FAST-SORT  lst less-pred)	; does delete duplicates
(STD-STABLE-SORT lst less-pred)	; preserves correct order, slowest
(STD-MERGE  lst1 lst2 less-pred); (std-merge '(0 2 4) '(1 3 5) '<)
(STD-COPY-TREE	lst)		; => a fresh copy of the list, for sort
(STD-RANDOMIZE	lst)		; shuffle the list
(STD-RANDOM-ELT	lst)		; return a random element from the list

Points: (moved to STDPOINT)
|;
;;; $Log: STDLIST.LSP $
;;; Revision 0.5006  2000/12/31 10:59:00  rurban
;;;   Release, see Changes
;;;
;;; 2000-10-02 14:23:34 rurban
;;;   improved STD-RANDOMIZE (Fisher-Yates algorithm)
;;; Revision 0.5004  2000/09/20 12:48:22  rurban
;;;   0.5004 release, see Changes
;;;
;;; Revision 0.5003  2000/07/11 15:59:52  rurban
;;;   0.5003 release, see Changes
;;;
;;; 2000-07-07 12:02:18 rurban
;;;   added std-%(un)protect-assign wrapper
;;; Revision 0.5002  2000/06/19 08:31:18  rurban
;;;   0.5002 release, see Changes
;;;
;;; Revision 0.5000  2000/05/14 17:41:36  rurban
;;; 0.5 release
;;; 2000-04-14 16:56:00 rurban
;;; added (STD-SETNTH new i lst)
;;;
;;; ===================================================================73
;|#+ VL|;
;;; avoid reload warnings in VL
(if std-%unprotect-assign
  (std-%unprotect-assign (setq *STDLIST-SYMBOLS*
;;;(eval (list 'pragma
;;;	    (list 'quote
;;;	      (list (cons 'unprotect-assign
        '(first second	     third		fourth
	  fifth		     sixth		seventh
	  eighth	     ninth		tenth
	  rest		     STD-DOTTED-PAIR-P	STD-NOT-PROPER-LIST-P
	  STD-LIST-LENGTH    STD-STRING-LIST-P	STD-NUMBER-LIST-P
	  STD-POSITION-IF    STD-POSITION-IF-NOT
	  STD-RPOSITION	     STD-RASSOC		STD-NTHCDR
	  STD-FIRSTN	     STD-SUBSEQ		STD-BUTLAST
	  STD-ELT	     STD-SELECT		STD-SETNTH
	  STD-RPLACE	     STD-DELPOS		STD-ADJOIN
	  STD-REMOVE-DUPLICATES			STD-SPLIT-LIST
	  STD-FLATTEN	     STD-ROTATE-RIGHT	STD-ROTATE-LEFT
	  STD-PUSH	     STD-PUSHNEW	STD-PUSHMAX
	  STD-POP	     STD-MAPATOM	STD-EVERY
	  STD-EVERY-N	     STD-SOME		STD-SOME-N
	  STD-INTERSECTION   STD-SET-DIFFERENCE	STD-UNION
	  STD-ORDERED-UNION  STD-SET-EXCLUSIVE-OR
	  STD-SUBSETP	     STD-SET-EQUAL-P	STD-INT-LIST
	  STD-MAKE-LIST	     STD-ISEQ		STD-RSEQ
	  STD-NXTCYC	     STD-COUNT		STD-COUNT-IF
	  STD-COUNT-IF-NOT   STD-STABLE-SORT	STD-MERGE
	  STD-COPY-TREE	     STD-RANDOMIZE	STD-RANDOM-ELT
	  STD-RANDOM-PT))))
;;;)))
;|END #+ VL|;

;;; FIRST   - first element of the list
(defun first (x) (car x))
;;; REST    - the rest of the list
(defun rest (x)  (cdr x))
;;; Other readable accessors, the element or nil, better than nth
(defun second (lst) (cadr lst))
(defun third (lst)  (caddr lst))
(defun fourth (lst) (cadddr lst))
(defun fifth (lst)  (car (cddddr lst)))
;|#- SMALL|;
(defun sixth (lst)  (cadr (cddddr lst)))
(defun seventh (lst)(caddr (cddddr lst)))
(defun eighth (lst) (cadddr (cddddr lst)))
(defun ninth (lst)  (car (cddddr (cddddr lst))))
(defun tenth (lst)  (car (cdr (cddddr (cddddr lst)))))
;|END #- SMALL|;

;;;(std-%cond-defun
;;;  '(defun consp (lst) (not (atom lst)))
;;;)

;or
;(defun consp (lst) (and lst (listp lst)))

(defun STD-DOTTED-PAIR-P (lst)
  (and (consp lst) (not (listp (cdr lst)))))

;;; This definitely has to converted to iteration!
;;; but (std-dotted-pair-p (last lst)) will fail!
;|(defun STD-NOT-PROPER-LIST-P (lst)
  (and (consp lst)	; fixed
       (or (std-dotted-pair-p lst)
	   (std-not-proper-list-p (cdr lst)))))
|;

;;; iterative version
;;; checks if the last cons cell is dotted or not.
;;; improvement over the highly-recursive version above, loops to the
;;; last cons (last is forbidden!) and checks this.
;;; not-proper-lists will fail ("bad list" error) with:
;;;   MEMBER, LENGTH, LAST, FOREACH, APPLY, MAPCAR, REVERSE, ...
;;;
;;;   (std-not-proper-list-p '(0 1 2))     => nil
;;;   (std-not-proper-list-p '(0 0 0 . 1)) => T
;;; but (std-not-proper-list-p '(0 . '(0 0 1))) => nil
;;;   because it is read as '(0 0 0 1)
;;;   (std-not-proper-list-p 0)            => nil
(defun STD-NOT-PROPER-LIST-P (lst)
  (if (consp lst)
    (progn
      (while (and lst (listp (cdr lst)))
        (setq lst (cdr lst)))
      (std-dotted-pair-p lst)
      )))

;;;(std-list-length 1) 		=> nil
;;;(std-list-length nil) 	=> 0
;;;(std-list-length '(0 1 2 0 1))  	=> 5
;;;(std-list-length '(0 1 2 0 . 1))  	=> 4
;;;(std-list-length '(0 1 2 (0 . 1))) 	=> 4
;;;(std-list-length '(0 1 2 0 . (1))) 	=> 5
(defun STD-LIST-LENGTH	(lst / l)
  (cond
    ((null lst) 0)
    ((atom lst) nil)
    (T
     (setq l 1)
     (while lst
       (if (atom (cdr lst))
         (setq lst nil l l)
         (setq lst (cdr lst) l (1+ l)))))))


(defun STD-STRING-LIST-P (lst)
  (and (consp lst)			;a cons?
       (not (std-not-proper-list-p lst))
       (<= (length lst) *MAX-ARGS-LIMIT*)
       (apply (function and) (mapcar (function stringp) lst))))

(defun STD-NUMBER-LIST-P (lst)
  (and (consp lst)			;a cons?
       (not (std-not-proper-list-p lst))
       (<= (length lst) *MAX-ARGS-LIMIT*)
       (apply (function and) (mapcar (function numberp) lst))))

;|#- VLISP|;
;;; STD-POSITION - returns the index of the first element in the list,
;;; base 0, or nil if not found
;;;   (std-position x '(a b c))   => nil
;;;   (std-position b '(a b c d)) => 1
;;; Ansi CL supports strings too but VL not. If we want to support
;;; strings, then the workaround is not just a simple
;;; (setq std-position vl-position) anymore
;;; ? (std-position (ascii "t") "Test")   => 3   ; zero based!
;;; or (std-position "t" "Test")   => 3   ; zero based!
;;; vlx-position was introduced with vill 3.0
;;; see also: std-string-position which searches for an intchar
;;; and is zero-based.
(if (not STD-POSITION)
 (defun STD-POSITION (x lst / ret)
   ;;(cond ((stringp lst)
   ;;       (std-string-position (if (stringp x) (ascii x) x) lst))
   ;;      (T
	  (if (not (zerop (setq ret (length (member x lst)))))
             (- (length lst) ret))
   ;;    ))
 )
)
;|END #- VLISP|;

;;; -------------------------------------------------------------------73
;;; AutoLISP workarounds for VLX extensions
;|#- VL|;

(if (listp (lambda () T)) (progn

;;; (STD-MEMBER-IF pred lst)
;;; pred requires exactly 1 arg, by Serge Pashkov
;;;   (std-member-if 'numberp '(b a 2 3)) -> (2 3)
(defun STD-MEMBER-IF (pred lst)
  (while (and lst (not (apply pred (list (car lst)))))
    (setq lst (cdr lst)))
  lst
)
;;; highly recursive, may fail on large lists!
;|(defun STD-MEMBER-IF (pred lst)
  (cond
    ((null lst) nil)       ;nil or symbol (invalid)
    ((apply pred (list (car lst))) lst)
    (t (std-member-if pred (cdr lst)))))
|;

;;; (STD-MEMBER-IF-NOT pred lst)
;;; pred requires exactly 1 arg, by Serge Pashkov
;;;   (std-member-if-not 'numberp '(b a 2 3)) -> (b a 2 3)
(defun STD-MEMBER-IF-NOT (pred lst)
  (while (and lst (apply pred (list (car lst))))
    (setq lst (cdr lst)))
  lst
)
;;; highly recursive, may fail on large lists!
;|(defun STD-MEMBER-IF-NOT (pred lst)
  (cond
    ((null lst) nil)       ;nil or symbol (invalid)
    ((not (apply pred (list (car lst)))) lst)
    (t (std-member-if-not pred (cdr lst)))))
|;

;;; STD-REMOVE - Removes all items from a list, also all duplicate elements
;;;   (std-remove 0 '(0 1 2 3 0)) -> (1 2 3)
(defun STD-REMOVE (ele lst)      ; by Serge Volkov, Tony also claims 
;  (if (> (length lst) *MAX-ARGS-LIMIT*)          ; authorship for this
;    (std-error (std-msg "maximal number of arguments exceeded"))
;; FCAD fails with (subst x y nil)
    (if lst
      (apply (function append)
	     (subst nil (list ele)
	       (mapcar (function list) lst)))))
;)

;;; (STD-REMOVE-IF pred lst)     - Conditional remove
;;;   pred requires exactly 1 arg
(defun STD-REMOVE-IF (_pred lst)
;  (if (> (length lst) *MAX-ARGS-LIMIT*)
;    (std-error (std-msg "maximal number of arguments exceeded"))
    (apply (function append)
      (mapcar
        (function (lambda (e) (if (not (apply _pred (list e))) (list e))))
        lst)))	;)

;;; STD-REMOVE-IF-NOT  - keeps all elements to which the predicate
;;;   returns not-nil, say: "keep if"
;;;   pred requires exactly 1 arg
(defun STD-REMOVE-IF-NOT (_pred lst)	;by Vladimir Nesterowsky
;  (if (> (length lst) *MAX-ARGS-LIMIT*)
;    (std-error (std-msg "maximal number of arguments exceeded"))
    (apply (function append)
      (mapcar
        (function (lambda(e) (if (apply _pred (list e)) (list e))))
        lst)))	;)

;|
;;; recursive versions:
( defun std-remove (item from)
  (cond
    ((atom from) (if (equal item from) nil from))
    ((equal (car from) item) (std-remove item (cdr from)))
    (t (cons (car from) (std-remove item (cdr from))))))
( defun std-remove-if (pred lst)
  (cond
    ((atom lst) lst)       ;nil or symbol (invalid)
    ((apply pred (list (car lst))) (std-remove-if pred (cdr lst)))
    (T (cons (car lst) (std-remove-if pred (cdr lst))))))
( defun std-remove-if-not (pred lst)
  (cond
    ((atom lst) lst)
    ((apply pred (list (car lst)))
      (cons (car lst) (std-remove-if-not pred (cdr lst))))
    (T (std-remove-if-not pred (cdr lst)))))
|;

)) ; eof vl list workarounds
;|END #- VL|;
;;; -------------------------------------------------------------------73

;|#- SMALL|;
;;; (std-position-if 'numberp '(0 1 2 3))  => 0
(defun STD-POSITION-IF (pred lst / ret)
  (if (not (zerop (setq ret (length (std-member-if pred lst)))))
    (- (length lst) ret)))

;;; (std-position-if-not 'stringp '("0" "1" 2 "3"))  => 2
(defun STD-POSITION-IF-NOT (pred lst / ret)
  (if (not (zerop
      (setq ret (length (std-member-if-not pred lst)))))
    (- (length lst) ret)))

;;; STD-RPOSITION  returns the index of the last found element or nil
;;;   (std-rposition 2 '(2 1 2 3)) => 2
(defun STD-RPOSITION (x lst / ret)
  (if (setq ret (member x (reverse lst)))
    (1- (length ret))))

;|
;;; You may define your own fast rpos which returns the last
;;; position or -1 instead of nil, but this is NOT standard.
( defun fast-rpos (x lst)
  (1- (length (member x (reverse lst)))))
|;

(defun STD-RASSOC (key alst / i)
  (if (setq i (std-position key (mapcar (function cdr) alst)))
    (nth i alst)))
;|END #- SMALL|;

;;; "list behind (including) the nth element"
;;;   (std-nthcdr 1 '(0 1 2 3) => '(1 2 3)
;;; O(i)
(defun STD-NTHCDR (i lst)
  (repeat i
    (setq lst (cdr lst)))
  lst				; fixed
)

;;; "list of first n elements", iterative version
;;; with safety check:
;;;   (std-firstn 1 '(0 1 2)) => '(0)
;;;   (std-firstn 0 '(0 1 2)) => nil
;;;   (std-firstn 4 '(0 1 2)) => '(0 1 2)
;;; O(n+i) if i<n, O(2n) if i>=n
(defun STD-FIRSTN (i lst / out)
  (setq out nil)	; possible VL lsa compiler bug
  (repeat (min i (length lst))
    (setq out (cons (car lst) out) lst (cdr lst)))
  (reverse out))

;;; without safety check, only usable internally
;;;   (std-%firstn 4 '(0 1 2)) => '(0 1 2 nil)
;;; O(i) even if i>n
(defun std-%firstn (i lst / out)
  (setq out nil)	; possible VL lsa compiler bug
  (repeat i
    (setq out (cons (car lst) out) lst (cdr lst)))
  (reverse out))


;;; slower version:
;;; O(4n+i)
;|(defun STD-FIRSTN (i lst)
  (if (>= i (length lst))
    lst
    (reverse (std-nthcdr (- (length lst) i) (reverse lst)))))

;;; tail-recursive version
;;; This is dangerous on long lists!
;;; O(n+i^2/2+i), i^2/2: (reverse x)
( defun STD-FIRSTN (i lst)
  (if (>= i (length lst))
    lst
    (std-%firstn-hlp lst nil i)))

( defun std-%firstn-hlp (lst x i)
  (cond
    ((minusp i) nil)
    ((zerop i) (reverse x))
    (T (std-%firstn-hlp (cdr lst) (cons (car lst) x) (1- i)))))
|;


;;; STD-SUBSEQ - subsequence including start excluding end
;;;   (std-subseq '(0 1 2 3) 1 3) => '(1 2)
(defun STD-SUBSEQ (lst start endp)
  (if (<= 0 start endp (length lst))	; fixed
    (std-firstn (- endp start) (std-nthcdr start lst))
    (std-error (list "STD-SUBSEQ: " 
		     (std-msg ;|MSG2|;"index out of range") 
		     " - " start " " endp))))

;;; (STD-BUTLAST lst) - list without (last lst)
;;; iterative version
(defun STD-BUTLAST (lst)
  (reverse (cdr (reverse lst))))

;;; recursive version
;|(defun std-butlast (lst)
  (std-firstn (1- (length lst)) lst))
|;

;;; safe NTH version with reverse order of arguments
;;; Throws an index out of range error.
;;; NTH throws just a bad argument type error
;;; (from LISP)
;;;   (STD-ELT '(0 1) 0) => 0
;;;   (STD-ELT lst -1)   => ERROR
;;;   (STD-ELT lst (length lst)) => ERROR
(defun STD-ELT (lst i)
  (if (< -1 i (length lst))	; fixed
    (nth i lst)
    (std-error (list "STD-ELT: "
		     (std-msg ;|MSG2|;"index out of range")
		     " - " i))))

;;; std-select is NTH expanded for multiple indices. (from xlisp-stat)
;;;   (std-select lst '(0 2 4)) or (std-select lst 0)
(defun STD-SELECT (lst i / x)
  (cond
    ((numberp i) (std-elt lst i))
    ((consp i)
      (while i	; looping over i is faster than mapping over lst
	(setq x (cons (std-elt lst (car i)) x)
	      i (cdr i)))
      (reverse x))))

;;; STD-SETNTH - replace by position, 0 based
;;; If the index is invalid return the unchanged list.
;;; (Sorry, this changed v0.3003)
(defun STD-SETNTH (new i lst)
  (std-%setnth (list new) i lst))

;;; Depricated, same as STD-SETNTH, only reversed argument ordering
;;; STD-RPLACE - replace by position, 0 based. will be removed soon.
;;; This was a bad name. The argument ordering was also
;;; questionable: possible is also (std-rplace new i lst) as in subst
;;; (std-setnth new i lst) or (std-nth<- new i lst)
;;;   (std-rplace '(0 1 2) 0 'NEW) => (NEW 1 2) but
;;;   (std-rplace '(0 1 2) 3 'NEW) => (0 1 2)
(defun STD-RPLACE (lst i new)
  (std-%setnth (list new) i lst))

;;; STD-DELPOS - list without i-th element
;;;   (std-delpos 2 '(0 1 2)) => (0 1)
;;;   (std-delpos 4 '(0 1 2)) => (0 1 2)
;;; Expanded for multiple indices:
;;;   (std-delpos '(2 1) '(0 1 2 3)) => (0 3)
(defun STD-DELPOS (i lst / new n j)
  (if (listp i)
    (progn
      (setq i (std-fast-sort i '<)
	    new '()
	    j 0)
      (foreach n i
        (setq new (cons (- n j) new)
	      j   (1+ j)))
      (foreach i (reverse new)
        (setq lst (std-%setnth nil i lst)))
      lst)
    (std-%setnth nil i lst)))

;;; Fast helper for DELPOS and RPLACE by Serge Pashkov.
;;; The new argument must be a list!
;;; Improved by Daniele Piazza, who thanks Fausto Azzoni. ~45% faster.
;;; Avoid firstn and nthcdr, loop only once through the list.
;;; Tests shows that actual gain is near 3 times at n << N,
;;; 2 times at (N-n) << N and no gain when n ~ N/2 to the old
;;; versions below.
;;; "very weak recursive", worst for elements in the middle.
;;; stack-overflow at about 2^stack-size (~log n) which is
;;; practically infinite: (std-expt 2 994) => 1.67423e+299
(defun std-%setnth (new i lst / fst len)
  (cond
    ((minusp i) lst)
    ((> i (setq len (length lst))) lst)
    ((> i (/ len 2))
      (reverse (std-%setnth new (1- (- len i)) (reverse lst))))
    (T
      (append
        (progn
          (setq fst nil)	; ; possible VL lsa compiler bug
          (repeat (rem i 4)
            (setq fst (cons (car lst) fst)
                  lst (cdr lst)))
          (repeat (/ i 4)
            (setq fst (cons (cadddr lst)
		            (cons (caddr lst)
			          (cons (cadr lst)
				        (cons (car lst) fst))))
                  lst (cddddr lst)))
          (reverse fst)
        )
        (if (listp new) new (list new))	; v0.4001
        (cdr lst)))))

;|
;;; old slower versions:
( defun STD-RPLACE (lst i new)
  (if (< -1 i (length lst))	; fixed v0.3003
    (append (std-firstn i lst)
	    (list new)
	    (std-nthcdr (1+ i) lst))
    lst))

( defun STD-DELPOS (i lst)
  (if (not (minusp i))	; fixed by Serge Pashkov
    (append (std-firstn i lst) (std-nthcdr (1+ i) lst))))
|;

;;; STD-ADJOIN - cons if not in list
;;; (std-adjoin 0 '(1 2))  => (0 1 2)
(defun STD-ADJOIN (x lst)
  (if (member x lst)
    lst
    (cons x lst)))

;;; by Serge Pashkov
;;; The below mentioned lsa compiler bug couldn't be isolated yet.
(defun STD-REMOVE-DUPLICATES (lst / ele new)
  (setq new nil)	; possible VL lsa compiler bug (??)
  (foreach ele lst
    (if (not (member ele new))
      (setq new (cons ele new))))
  (reverse new))

;;; removed: v0.3015
;;; STD-APPEND-JOIN appends only new elements from new to old,
;;; like append but only elements which are not already in old.
;;; use STD-ORDERED-UNION instead.
;;;   (std-append-join '(0 1 2) '(2 3)) => (0 1 2 3)
;;; (defun STD-APPEND-JOIN (_old new)
;;;   (append _old (std-remove-if
;;; ;|#- VL|; (quote    ;|END #- VL|; ;)
;;; ;|#+ VL   (function   END #+ VL|;
;;;                 (lambda (x)
;;;                    (member x _old)))
;;;                 new)))

;;; STD-SPLIT-LIST splits list into sublists of maximal length n
;;; n must be > 0!
;;; Iterative version by Serge Pashkov, safer than recursive version
;;;   (std-split-list 2 '(1 2 3 4 5 6)) => ((1 2) (3 4) (5 6))
(defun STD-SPLIT-LIST (n lst / ret out cnt)
  (setq ret nil)	; possible VL lsa compiler bug
  ;; adjust cnt to set incomplete number of elements (if any) for the
  ;; last segment
  (setq cnt (- n (rem (length lst) n)) lst (reverse lst))
  (while lst
    (setq ret (cons (car lst) ret) lst (cdr lst))
    (if (zerop (rem (setq cnt (1+ cnt)) n))
      (setq out (cons ret out) ret nil)))
  (if ret (cons ret out) out))

;;; recursive version by Serge Volkov
;|(defun std-%split-list-rec (n lst)
  (if lst
    (cons
      (std-firstn n lst)
      (std-split-list n (std-nthcdr n lst))
    )
  )
)
|;

;|#- SMALL|;
;;; Flattens a tree to a plain list, by Serve Pashkov
;;; iterative version, also processes not-proper-lists.
;;;   (std-flatten  '((1 2 3 (3 4)))) => (1 2 3 3 4)
(defun STD-FLATTEN (lst / pend new curr)
  (cond
    ((null lst) nil)
    ((atom lst) lst)
    (T
     (setq pend lst new nil)
     (while pend
       (if (atom pend)                 ; for processing '(1 2 . 3)
         (setq curr pend pend nil)
         (setq curr (car pend) pend (cdr pend)))
       (while (consp curr)
         (if (cdr curr)
           (setq pend (cons (cdr curr) pend)))
         (setq curr (car curr)))
       ;;now curr is atom
       (setq new (cons curr new)))
     (reverse new))))
;|END #- SMALL|;


;;; old, wrong and highly recursive, may fail on large lists!
;|(defun STD-FLATTEN (lst)
  (cond ((null lst) nil)
        ((atom lst) (list lst))
        (T (append (std-flatten (car lst)) (std-flatten (cdr lst))))))
|;

;;; std-rotate-right rotates a list rightwise
;;; put the last element to the front, 2x slower
;;;   (std-rotate-right '(0 1 2 3)) => '(3 0 1 2)
(defun STD-ROTATE-RIGHT (lst)
  (cons (last lst) (std-butlast lst)))

;;; std-rotate-left rotates a list leftwise
;;; put the first element to the end, 2x faster
;;;   (std-rotate-left '(0 1 2 3)) => '(1 2 3 0)
(defun STD-ROTATE-LEFT (lst)
  (append (cdr lst) (list (car lst))))

;;; The following local symbols may look obfuscated. It is to prevent
;;; binding of symbols with the same name.
;;; All symbols in functions which call eval and which requires symbol
;;; values not defined locally should use special prefixes (here "_$")
;;; not to harm earlier defined symbols.  (prevent "shadowing")

;;; to: lst or 'lst
;;; returns new stack
;;;   (std-push 1 '(2 3)) -> (1 2 3)
(defun STD-PUSH (_$what _$lst / _$tmp)
  (if (= (type _$lst) 'SYM)
    (setq _$tmp _$lst _$lst (std-symbol-value _$lst)))
  (setq _$lst (cons _$what _$lst))
  (if _$tmp (set _$tmp _$lst) _$lst))

;;; Stack argument may be quoted: lst or 'lst
;;; Returns new stack.
;;;   (std-pushnew 1 '(2 3))   => (1 2 3)
;;;   (std-pushnew 1 '(1 2 3)) => (1 2 3)
(defun STD-PUSHNEW (_$what _$lst / _$tmp)
  (if (= (type _$lst) 'SYM)
    (setq _$tmp _$lst _$lst (std-symbol-value _$lst)))
  (setq _$lst (std-adjoin _$what _$lst))
  (if _$tmp (set _$tmp _$lst) _$lst))

;;; with maximal stack size
;;; to: lst or 'lst
;;; returns new stack
;;;   (std-pushmax 1 '(2 3 4 5) 4) -> (1 2 3 4)
(defun STD-PUSHMAX (_$what _$lst nmax / _$tmp)
  (if (= (type _$lst) 'SYM)
    (setq _$tmp _$lst _$lst (std-symbol-value _$lst)))
  (if (>= (length _$lst) nmax)
    (setq _$lst (reverse (cdr (reverse _$lst)))))
  (setq _$lst (cons _$what _$lst))
  (if _$tmp (set _$tmp _$lst) _$lst))

;;; to: lst or 'lst
;;; returns what if SYM or new stack
;;;   (setq lst '(1 2 3))
;;;   (std-pop lst)  -> (2 3), lst = (1 2 3)
;;;   (std-pop 'lst) -> 1, lst = (2 3)
(defun STD-POP (_$lst / _$what _$tmp)
  (if (= (type _$lst) 'SYM)
    (setq _$tmp _$lst _$lst (std-symbol-value _$lst)))
  (setq _$what (car _$lst)
        _$lst  (cdr _$lst))
  (if _$tmp (progn (set _$tmp _$lst) _$what) _$lst))

;;; -------------------------------------------------------------------73

;|#- SMALL|;
;;; std-mapatom maps a function to every symbol in a tree,
;;; keeping the tree structure intact.
;;; Iterative version by Serge Pashkov.
(defun STD-MAPATOM (func lst / new pend curr pendlst newlst)
  (cond
    ((atom lst)
     (apply func (list lst)))
    (T
     ;; loop until last element, for '(1 2 . 3) too
     (while (consp lst)
       (setq pend (cons (car lst) pend) lst (cdr lst)))
     (setq new (if lst (apply func (list lst)))
           pendlst nil newlst nil)
     (while pend
       (while pend
         (setq curr (car pend) pend (cdr pend))
         (if (atom curr)
           (setq new (cons (apply func (list curr)) new))
           (progn
             (setq pendlst (cons pend pendlst)
                   newlst (cons new newlst) pend nil)
             (while (consp curr)
               (setq pend (cons (car curr) pend) curr (cdr curr)))
             (setq new (if curr (apply func (list curr)))))))
       (while (and pendlst (null pend))
         (setq new (cons new (car newlst)) newlst (cdr newlst)
               pend (car pendlst) pendlst (cdr pendlst))))
     new)))
;|END #- SMALL|;


;;; The old readable recursive version:
;;; highly recursive, may fail on large lists!
;;; by Vladimir Nesterovsky <vnestr@netvision.net.il>
;|(defun STD-MAPATOM (func lst)
  (cond ((atom lst)
	  (apply func (list lst)))
        ((and (cdr lst) (atom (cdr lst)))
          (cons (std-mapatom func (car lst))
		(apply func (cdr lst))))
        (T (mapcar (function (lambda (subl)(std-mapatom func subl)))
                   lst))))
|;

;;; -------------------------------------------------------------------73
;;; Added with v0.4001, 7/21/99
;;; SOME and EVERY for AutoLISP backwards compatibility.
;;; VL takes multiple arguments, so divide them into an one-arg version
;;; and a n-args version for alisp.
;;; These are the optimized versions, the simple one is just
;;;   (apply 'and|or (mapcar 'pred lst))

;|#- VLISP|;
;;; T if pred is non-nil for every element
;;; or nil if some elements are nil when applied to pred
;;; (apply 'and (mapcar 'pred lst))
;;;
;;; one-arg optimized alisp version
;;;   don't process the whole list,
;;;   break at the first nil
(defun STD-EVERY (pred lst / res)
  (setq	res (apply pred (list (car lst)))
	lst (cdr lst))
  (while (and res lst)
    (setq res (apply pred (list (car lst)))
	  lst (cdr lst)))
  res)

;;; T if pred is non-nil for some elements
;;; or nil if every element is nil when applied to pred
;;; (apply 'or (mapcar 'pred lst))
;;;
;;; one-arg optimized alisp version
;;;   don't process the whole list,
;;;   return T at the first non-nil
;;; (std-some 'numberp '(0 x 1 3)) => T
;;; (std-some 'zerop   '(1 2 3)) => nil
(defun STD-SOME  (pred lst / res)
  (setq	res (not (apply pred (list (car lst))))
	lst (cdr lst))
  (while (and res lst)
    (setq res (not (apply pred (list (car lst))))
	  lst (cdr lst)))
  (not res))
;|END #- VLISP|;

;;; lisp OR
;;; Return the value of the first non-nil value.
(defun STD-%OR  (lst)
  (while (not (car lst))
    (setq lst (cdr lst)))
  (car lst))

;;; for predicates taking more args
(defun STD-SOME-N  (pred lists)
  (cond ((std-vlisp-p)
         (apply (function vl-some) (cons pred lists)))
	((std-vill-p)
         (apply (function vlx-some) (cons pred lists)))
	(T (std-%some-n pred lists))))

;;; for predicates taking more args
(defun STD-EVERY-N  (pred lists)
  (cond ((std-vlisp-p)
         (apply (function vl-every) (cons pred lists)))
	((std-vill-p)
         (apply (function vlx-every) (cons pred lists)))
	(T (std-%every-n pred lists))))

;;; n-args optimized alisp version
(defun std-%every-n  (pred lists / res)
  (std-warn "std-%every-n fails sometimes. ")
  (setq	res   (apply pred (mapcar (function car) lists))
	lists (mapcar (function cdr) lists))
  (while (and res (car lists))
    (setq res   (apply pred (mapcar (function car) lists))
	  lists (mapcar (function cdr) lists)))
  res)

;;; n-args optimized alisp version
(defun std-%some-n  (pred lists / res)
  (std-warn "std-%some-n fails sometimes. ")
  (setq res (not (apply pred (mapcar (function car) lists)))
	lists (mapcar (function cdr) lists))
  (while (and res (car lists))
    (setq res (not (apply pred (mapcar (function car) lists)))
	  lists (mapcar (function cdr) lists)))
  (not res))

;;; -------------------------------------------------------------------73
;;; Sets (operations on unordered lists)
;;; Our sets are unordered, most operations are not stable, but duplicates
;;; are ignored or removed.

;;; The operations are very simple, not optimized for any data.

;;; STD-INTERSECTION returns all elements that are in x and y.
;;; Iterative, stable version by Serge Pashkov.
;;; Duplicates are handled incorrectly yet.
;;;   (std-intersection '(0 1 2 3 4 5) '(2 0 6 7)) => (0 2)
;;; Problem: (std-intersection '(0 0 0 1) '(0 0 1)) => (0 0 0 1)
;;;  but it should be (0 0 1) instead
(defun STD-INTERSECTION (x y / new)
  (setq new nil)	; possible VL lsa compiler bug
  (foreach ele x
    (if (member ele y)
      (setq new (cons ele new))))
  (reverse new))

;;; highly recursive, may fail on large lists!
;|(defun STD-INTERSECTION (x y)
  (cond ((null x) nil)
        ((member (car x) y)
	  (cons (car x) (std-intersection (cdr x) y)))
        (T (std-intersection (cdr x) y))))
|;

;;; STD-SET-DIFFERENCE returns all elements of x without elements
;;; also in y, iterative, stable version by Serge Pashkov
;;;   (std-set-difference '(0 1 2 3 4 5) '(2 0 6 7)) => (1 3 4 5)
;;; Big lists as second argument are faster:
;;;   (setq big (std-int-list 1000) small (std-int-list 10))
;;;   (std-time '(std-set-difference small big))
;;;   => (STD-SET-DIFFERENCE SMALL BIG) 	: 0 ms
;;;   (std-time '(std-set-difference big small))
;;;   (STD-SET-DIFFERENCE BIG SMALL) 	: 50 ms
(defun STD-SET-DIFFERENCE (x y / new)
  (setq new nil)	; to avoid possible VL lsa compiler bug (?)
  (foreach ele x
    (if (not (member ele y))
      (setq new (cons ele new))))
  (reverse new))

;;; highly recursive, may fail on large lists!
;|(defun STD-SET-DIFFERENCE (in out)
  (cond ((null in) nil)
        ((member (car in) out) (std-set-difference (cdr in) out))
        (T (cons (car in)      (std-set-difference (cdr in) out)))))
|;

;;; STD-UNION returns a list of all elements in both lists
;;; Iterative version by Serge Pashkov
;;;   (std-union '(0 1 2 3 4 5) '(2 0 6 7)) => like (7 6 0 1 2 3 4 5)
;;; Ignore duplicates in y are ignored, in x not.
;;; Simplified version without any ordering.
;;; See STD-ORDERED-UNION which keeps the orginal order intact.
;;; Big lists as first argument are faster:
;;;   (setq big (std-int-list 1000) small (std-int-list 10))
;;;   (std-time '(std-union small big))
;;;   => (STD-UNION SMALL BIG) 	: 1222 ms
;;;   (std-time '(std-union big small))
;;;   (STD-UNION BIG SMALL) 	: 0 ms
(defun STD-UNION (x y)
  (foreach ele y
    (if (not (member ele x))
      (setq x (cons ele x))))
  x)

;|#- SMALL|;
;;; We use reversing only for appending missing elements
;;; after the end of x. Iterative version by Serge Pashkov
(defun STD-ORDERED-UNION (x y / new)
  (setq new (reverse x))
  (foreach ele y
    (if (not (member ele new))
      (setq new (cons ele new))))
  (reverse new))

;|END #- SMALL|;


;;; highly recursive, may fail on large lists!
;|(defun STD-UNION (x y)
  (cond ((null x) y)
  	((member (car x) y) (std-union (cdr x) y))
  	(T (cons (car x)    (std-union (cdr x) y)))))
|;

;;; Elements that appear in exactly one of lst1 and lst2
(defun STD-SET-EXCLUSIVE-OR (x y)
  (append (std-set-difference x y)
          (std-set-difference y x)))

;;; std-subsetp returns T if every element of x is a member of y,
;;; ignoring order and duplicates, iterative version by Serge Pashkov
;;;   (std-subsetp '(7 0) '(2 0 6 7)) -> T
;;;   (std-subsetp '(1 7) '(2 0 6 7)) -> nil
;;; Note: in CL the default comparison is with EQL not with EQUAL!
;;;   (std-subsetp '((1) (2)) '((1) (2))) => T
;;;   but in CL it would return nil
(defun STD-SUBSETP (x y)
  (while (and x (member (car x) y))
    (setq x (cdr x)))
  (null x))

;;; highly recursive, may fail on large lists!
;|( defun STD-SUBSETP (x y)
  (cond ((null x) T)
        ((member (car x) y) (std-subsetp (cdr x) y))))
|;

;;; have both sets the same elements? ignoring order and duplicates
;;;  (std-set-equal-p '(a b c) '(c b a))   => T
;;;  (std-set-equal-p '(a b c) '(c b a a)) => T
(defun STD-SET-EQUAL-P (x y)
  (and (std-subsetp x y)
       (std-subsetp y x)))

;;; -------------------------------------------------------------------73
;;; List Creation

;;; std-int-list creates '(0 1 2 ... <n-1>) of length n
(defun STD-INT-LIST (n / lst)
  (setq lst nil)	; possible VL lsa compiler bug
  (repeat n
    (setq lst (cons (setq n (1- n)) lst))))

;;; Creates a list of n elements with initial value def
;;;   (std-make-list 100 nil)
;;; Support dynamic defaults from functions like:
;;;   (std-make-list 100 'std-%random)
;;;   (std-make-list 100 '(lambda () (std-random 10)))
;;;   (std-make-list 100 ( function (lambda () (std-random 10))))
;;; but not: (std-make-list 100 '(std-random 10))
;;; which would create a list of 100 lists
(defun STD-MAKE-LIST (n def / lst)
  (setq lst nil) 	; possible VL lsa compiler bug
  (if (std-functionp def)
    ;; dynamic invocation
    (repeat n
      (setq lst (cons (apply def nil) lst)))
    ;; dynamic list of n def's
    (repeat n
      (setq lst (cons def lst)))))

;;; Tip: To ensure a list of fixed length:
;;; (std-%firstn 4 '(0 1 2)) => '(0 1 2 nil)

;;; integer sequence including start and end element
;;;   (std-iseq 0 1) => (0 1)	; idea from xlisp-stat
(defun STD-ISEQ (start endp / lst)
  (repeat (1+ (- endp start))
    (setq lst (cons endp lst)
	  endp (1- endp)))
  lst)

;;; real sequence, list of n equally spaced real numbers between
;;; start and end (both including)	; idea from xlisp-stat
;;;   (std-rseq 0 1 3) => (0.0 0.5 1.0)
(defun STD-RSEQ (start endp n / lst d)
  (cond
    ((= n 1) start)
    ((< n 1) nil)
    ((< endp start) nil)
    (T
     (setq d (/ (float (- endp start)) (1- n))
	   lst nil)	; possible VL lsa compiler bug
     (repeat n
       (setq lst (cons (+ start (* (setq n (1- n)) d)) lst))))))


;;; "next cyclic number"
;;;   (std-nxtcyc 0 3 '1+) => 1
;;;   (std-nxtcyc 1 3 '1+) => 2
;;;   (std-nxtcyc 2 3 '1+) => 3
;;;   (std-nxtcyc 3 3 '1+) => 0
(defun STD-NXTCYC (i n func)
  (cond
    ((>= (setq i (apply func (list i))) n) 0)
    ((< i 0) (1- n))
    (T i)))

;|#- SMALL|;
;;; Note: equal is too weak and eq is too strong.
;;; = is the AutoLISP eql alike
(defun STD-COUNT (ele lst / i)
  (setq i 0)
  (foreach x lst
    (if (= ele x) (setq i (1+ i))))
  i)
(defun STD-COUNT-IF (pred lst / i)
  (setq i 0)
  (foreach x lst
    (if (apply pred (list x)) (setq i (1+ i))))
  i)
(defun STD-COUNT-IF-NOT (pred lst / i)
  (setq i 0)
  (foreach x lst
    (if (not (apply pred (list x))) (setq i (1+ i))))
  i)

;; more elegant but more inefficient:
;|( defun STD-COUNT (item lst)
  (apply '+
    (mapcar '(lambda (x)
               (if (= x item) 1 0))	; eql is = in AutoLISP
             lst)))
( defun STD-COUNT-IF (pred lst / i)
  (apply '+
    (mapcar '(lambda (x)
               (if (apply pred (list x)) 1 0))
             lst)))
( defun STD-COUNT-IF-NOT (pred lst)
  (apply '+
    (mapcar '(lambda (x)
               (if (apply pred (list x)) 0 1)))
             lst)))
|;
;|END #- SMALL|;

;;; -------------------------------------------------------------------73
;;; Sorting:
;;; vlx-sort introduced a new unwanted behaviour. (also in vl-sort)
;;; It removes duplicate elements, which does not conform to ANSI CL
;;; That's why we define 3 different sort functions for the user and
;;; several algorithms to acomplish it.
;;; STD-SORT is like ANSI CL, should have about O(n logn) average
;;;   complexity of long lists
;;; STD-FAST-SORT uses vlx-sort or same as above,
;;;   it may delete duplicate entries!
;;; STD-STABLE-SORT garantees order of elements
;;;   should be stable, but could be slower or use more stack than
;;;   std-sort.
;;; The algorithms tested were QUICK-SORT, STABLE-QSORT,
;;; MERGE-SORT and INSERTION-SORT and various (previously unstable)
;;; combinations. See the timings and all the algos in SORTTST.LSP

;;; Non-recursive stable merge sort
;;; Overall the best method in AutoLISP. By Serge Pashkov
;;; Slightly improved 3% by using Danieles trick. see std-%setnth
;;;   (setq l '((1 1) (2 1) (1 2) (3 1) (1 3) (3 2) (3 3) (4 1) (1 4)))
;;;   (std-%merge-sort l ( function (lambda (x y)(< (car x) (car y)))))
;;;     => ((1 1) (1 2) (1 3) (1 4) (2 1) (3 1) (3 2) (3 3) (4 1))
;;; It's supposed that used version of std-%insertion-sort is stable.
(defun std-%merge-sort (lst _cmp / mlst rst len)
  ;; split by short lists sorted by insertion to decrease overhead
  ;; length 4 is near optimum for sorted and random lists.
  (setq rst (mapcar (function (lambda (e) (std-%insertion-sort e _cmp)))
                    (std-split-list 4 lst)))
  ;; repeat while leave only 1 sequence
  (while (> (setq len (length rst)) 1)
    ;; Merge every 2 adjacent sorted sequences
    (repeat (/ len 2)
      (setq mlst (cons (std-merge (car rst) (cadr rst) _cmp) mlst)
            rst (cddr rst)))
    ;; Add last sorted sequence (if any)
    (setq rst (reverse (if rst (cons (car rst) mlst) mlst)) mlst nil))
  (car rst))

;;; old version
;|(defun std-%merge-sort (lst _cmp / mlst rst l1)
  (setq mlst nil)		; possible VL lsa compiler bug
  ;; split by short lists sorted by insertion to decrease overhead
  ;; length 4 is near optimum for sorted and random lists.
  (setq rst (mapcar (function (lambda(e) (std-%insertion-sort e _cmp)))
		     (std-split-list 4 lst)))
  ;; repeat while leave only 1 sequence
  (while (> (length rst) 1)
    ;; Merge every 2 adjacent sorted sequences
    (while (setq l1 (car rst) rst (cdr rst))
      (setq mlst (cons (std-merge l1 (car rst) _cmp) mlst)
	    rst (cdr rst) l1 nil)
    )
    ;; Add last sorted sequence (if any)
    (setq rst (reverse (if l1 (cons l1 mlst) mlst)) mlst nil))
  (car rst))
|;

;;; stable insertion sort, fast for already ordered and short lists
;;; very slow for reversed or random lists O(n^2)
;;; by Serge Pashkov
(defun std-%insertion-sort (lst cmp / M N O cO)
  (setq O (reverse lst) M nil N (list (car O)))
  (while (setq O (cdr O))
    (setq cO (car O))
    (while (and N (apply cmp (list (car N) cO)))
      (setq M (cons (car N) M)
            N (cdr N)))
    (setq N (cons cO N))
    (while M
      (setq N (cons (car M) N) M (cdr M))))
  N)

;;; use merge-sort for everything
(defun STD-STABLE-SORT (lst cmp)
  (std-%merge-sort lst cmp))

;|#- VL|;
(if (not (boundp 'STD-SORT))
 (defun STD-SORT (lst cmp)
  (std-%merge-sort lst cmp))
)

(if (not (boundp 'STD-FAST-SORT))
 (defun STD-FAST-SORT (lst cmp)
  (std-%merge-sort lst cmp))
)
;|END #- VL|;

;;; iterative stable version, (see test/SORTTST.LSP)
;;; by Serge Pashkov
;;; This version is ~2 times faster on nearly sorted and nearly
;;; backwards sorted lists, but 5-7% slower on truly random lists,
;;; so we take this one. It has some testing overhead.
;;; hmm, error! no time to check it for now.
;|( defun STD-MERGE (l1 l2 cmp / lst cl1 cl2)
  (cond
    ((apply cmp (list (car (reverse l2)) (setq cl1 (car l1))))
      (append l2 l1))
    ((apply cmp (list (car (reverse l1)) (setq cl2 (car l2))))
      (append l1 l2))
    (T
      (setq lst nil)		; possible VL lsa compiler bug
      (while (and l1 l2)
        (if (apply cmp (list cl2 cl1))
          (setq lst (cons cl2 lst) l2 (cdr l2) cl2 (car l2))
          (setq lst (cons cl1 lst) l1 (cdr l1) cl1 (car l1))))
      (append (reverse lst) l1 l2))))
|;

(defun std-merge (l1 l2 cmp / lst cl1 cl2)
  (setq cl1 (car l1) cl2 (car l2)
	lst nil)		; possible VL lsa compiler bug
  (while (and l1 l2)
    (if (apply cmp (list cl2 cl1))
      (setq lst (cons cl2 lst) l2 (cdr l2) cl2 (car l2))
      (setq lst (cons cl1 lst) l1 (cdr l1) cl1 (car l1))))
  (append (reverse lst) l1 l2))

;|#- SMALL|;
;;; This version is 5-7% faster on truly random lists, so we
;;; support it too.
(defun std-%merge-random (l1 l2 cmp / lst cl1 cl2)
  (setq cl1 (car l1) cl2 (car l2)
	lst nil)		; possible VL lsa compiler bug
  (while (and l1 l2)
    (if (apply cmp (list cl2 cl1))
      (setq lst (cons cl2 lst) l2 (cdr l2) cl2 (car l2))
      (setq lst (cons cl1 lst) l1 (cdr l1) cl1 (car l1))))
  (append (reverse lst) l1 l2))

;;; Some more recursion homework: freshly cons each car and cdr part
;;; this would only be useful if there are some destructive functions,
;;; but so far there are none.
;;; This function has no higher meaning, it is included just for fun.
;;; Well, some sort implementations were destructive in the past, but
;;; I cannot remember which.
;;; Highly recursive, may fail on large lists!
(defun STD-COPY-TREE (tree)
  (cond ((atom tree) (car (cons tree nil)))
	(T (cons (std-copy-tree (car tree))
		 (std-copy-tree (cdr tree))))))
;|END #- SMALL|;

;;; std-randomize arranges all list elements randomly.
;;; Fisher-Yates Algorithm. 10/2/00
;;; This will be re-defined by std-%randomize from FILEEXT 0.5 in
;;; STDINIT2, because this performs poorly.
;;;   (std-randomize '(0 1 2 3 4)) => (2 4 0 3 1)
(defun STD-RANDOMIZE (lst / j i tmp)
  (setq i (1- (length lst)))
  (while (> i 0)
    (if (/= i (setq j (std-random (1+ i))))
      (setq tmp (nth i lst)
	    lst (std-setnth (nth j lst) i lst) ; new i lst
	    i   (1- i)
	    lst (std-setnth tmp j lst)))))

;;; This doesn't create evenly distributed arrangements.
;;; I should have known, Serge Pashkov already told me.
;|(defun NAIVE-RANDOMIZE (lst / new len i)
  (setq len (length lst) new nil)	; possible VL lsa compiler bug
  (while lst
    (setq new (cons (nth (setq i (std-random len)) lst) new)
          len (1- len)
	  lst (std-delpos i lst)))
  new)
|;



;;; std-random-elt returns a random list element.
;;; elt is in LISP the normal safe sequence accessor.
(defun STD-RANDOM-ELT (l)
  (if (null (cdr l))
    (car l)
    (nth (std-random (length l)) l)))

;;; Returns a point in the 3d-box (0 0 0) - (1 1 1)
(defun STD-RANDOM-PT ()
  (list (std-random nil)
        (std-random nil)
        (std-random nil)))

;;; -------------------------------------------------------------------73
;|#+ VL|;
(if std-%protect-assign (std-%protect-assign *STDLIST-SYMBOLS*))
(setq *STDLIST-SYMBOLS* nil)
;|END #+ VL|;

;;; Module dependencies:
(std-%simple-provide "STDLIST") ; first provide it, but before you may
				; call it, be sure to have all
				; supporting modules
(std-%simple-require "STDINIT")	; all dependent top-level calls removed
				; consp, std-functionp, function