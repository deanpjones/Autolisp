;This function is freeware courtesy of the author's of "Inside AutoLisp" for rel. 10 published by New Riders Publications.  This credit must accompany all copies of this function.
;
;* UKWORD User key word. DEF, if any, must match one of the KWD strings
;* BIT (1 for no null, 0 for none) and KWD key word ("" for none) are same as
;* for INITGET. MSG is the prompt string, to which a default string is added
;* as <DEF> (nil or "" for none), and a : is added.
;*
(defun ukword (bit kwd msg def / inp)
  (if (and def (/= def ""))
    (setq msg (strcat "\n" msg " <" def ">: ")
          bit (* 2 (fix (/ bit 2)))
    );setq
  );if
  (initget bit kwd)
  (setq inp (getkword msg))
  (if inp inp def)
);defun
;*
(princ)
;*
