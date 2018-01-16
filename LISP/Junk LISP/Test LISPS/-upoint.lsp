;This function is freeware courtesy of the author's of "Inside AutoLisp" for rel. 10 published by New Riders Publications.  This credit must accompany all copies of this function.
;
;* UPOINT User interface point function 
;* BIT (1 for no null, 0 for none) and KWD key word ("" for none) are same as
;* for INITGET. MSG is the prompt string, to which a default point variable
;* is added as <DEF> (nil for none), and a : is added. BPT is base point
;* (nil for none).
;*
(defun upoint (bit kwd msg def bpt / inp)
  (if def
    (if (eq (type def) 'STR)
      (setq msg (strcat "\n" msg ": "))
      (progn
        (setq pts (strcat
                    (rtos (car def)) "," (rtos (cadr def))
                    (if
                      (and (caddr def) (= 0 (getvar "FLATLAND")))
                      (strcat "," (rtos (caddr def)))
                      ""
                  ) );if&strcat
              msg (strcat "\n" msg " <" pts ">: ")
              bit (* 2 (fix (/ bit 2)))
        )
      )
    )
    (setq msg (strcat "\n" msg ": "))
  );if a default was supplied
  (initget bit kwd)
  (setq inp
    (if bpt
       (getpoint msg bpt)
       (getpoint msg)
  ) );setq&if
  (if inp inp def)
);defun
;*
(princ)
;*