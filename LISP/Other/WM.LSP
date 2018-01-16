 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Wm - Move word to next line.                                          ³
 ; ³  Copyright 1990, 1998 by Rocket Software                               ³
 ; ³  Software for those who want to make the big bucks                     ³
 ; ³                                      and get the good looking women.   ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Errx - error handler.                                                 ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN ERRX (shk)
  (setvar "snapmode" snapp)
  (write-line (strcat "\n" shk))
  (setq *error* prev)
 (princ))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Errx end.                                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  1stwrd - divide the argument (a text string) at a space into the      ³
 ; ³  first word and the remainder of the string.                           ³
 ; ³  Returns a list thereof.                                               ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN 1STWRD (txa / lena last first len)
  (setq lena 1)
  (while (and (> (strlen txa) lena) (= (substr txa lena 1) " "))
         (setq lena (1+ lena)))
  (while (and (> (strlen txa) lena) (/= (substr txa lena 1) " "))
         (setq lena (1+ lena)))
  (if (/= (strlen txa) lena)                      ; if a > 1 word
      (progn
           (setq last (substr txa (1+ lena)))     ; text after space
           (setq first (substr txa 1 (1- lena)))) ; word up to space
      (progn                                      ; if a = only 1 word
           (if (= (substr txa (setq len (strlen txa))) " ")
               (setq txa (substr txa 1 (1- len))))
           (setq first txa)
           (setq last "")))
 (list first last))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  1stwrd end.                                                           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Endwrd - divide the argument (a text string) at a space into the      ³
 ; ³  first part and the last word.                                         ³
 ; ³  Returns a list thereof.                                               ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN ENDWRD (txa / lena last first)
  (setq lena (strlen txa))      ; length of line a
  (while (and (< 0 lena) (= (substr txa lena 1) " "))
         (setq lena (1- lena)))
  (while (and (< 0 lena) (/= (substr txa lena 1) " "))
         (setq lena (1- lena)))
  (if (/= 0 lena)
      (progn
           (setq last (substr txa (1+ lena)))      ; word after space
           (setq first (substr txa 1 (1- lena))))  ; text up to space
      (progn
           (setq last txa)                         ; whole word
           (setq first "")))                       ; empty string
 (list first last))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Endwrd end.                                                           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Justo - returns a string describing the justification of the text     ³
 ; ³  entity whose data was passed as its sole argument.  "none" is         ³
 ; ³  returned for standard left justification.                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN JUSTO (entt / xjust yjust xjst yjst justrg)
  (setq xjust (cdr (assoc 72 entt)))
  (setq yjust (cdr (assoc 73 entt)))
  (cond ((= yjust 0) (setq yjst ""))       ; base = normal
        ((= yjust 1) (setq yjst "b"))      ; bottom
        ((= yjust 2) (setq yjst "m"))      ; middle
        ((= yjust 3) (setq yjst "t")))     ; top
  (cond ((= xjust 0) (setq xjst "l"))      ; left
        ((= xjust 1) (setq xjst "c"))      ; centre
        ((= xjust 2) (setq xjst "r"))      ; right
        ((= xjust 3) (setq xjst "a"))      ; aligned
        ((= xjust 4) (setq xjst "m"))      ; middle
        ((= xjust 5) (setq xjst "f")))     ; fit
  (setq justrg (strcat yjst xjst))
 (if (= justrg "l") "none" justrg))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Justo end.                                                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Ad - create new text beneath an existing line.                        ³
 ; ³  Takes two arguments: enam, the existing line entity name              ³
 ; ³                       str, the string for the new text entity          ³
 ; ³  Returns a list of the enames of the new text entities.                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN AD (enam str / entt nl cs czs cc cl clt justrg ecolor)
  (setq entt (entget enam))
  (setq nl (cdr (assoc 8 entt)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Save system variables.                                                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq cs (getvar "textstyle"))
  (setq czs (getvar "textsize"))
  (setq cc (getvar "cecolor"))
  (setq cl (getvar "clayer"))
  (setq clt (getvar "celtype"))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Find the justification of the original entity.                        ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq justrg (justo entt))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Set the entity creation colour to that of the text, set the linetype  ³
 ; ³  to bylayer, make the entity layer current, turn it on and thaw it,    ³
 ; ³  erase the original entity.                                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (if (setq ecolor (cdr (assoc 62 entt)))
      (progn
           (if (= (type ecolor) 'INT)
               (setq ecolor (itoa ecolor)))
               (setvar "cecolor" ecolor))
      (setvar "cecolor" "bylayer"))
  (setvar "celtype" "bylayer")
  (command "layer" "on" nl "t" nl "s" nl "")
  (entdel enam)
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Now create a new text entity which is identical to the selected one.  ³
 ; ³  This will allow the dtext command to pick up immediately below it.    ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (command "text" "s" (cdr (assoc 7 entt))   ; text style
           justrg)                           ; justification
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Find the insertion point.  If the text is left justified this will    ³
 ; ³  be the 10 point, otherwise 11, unless the justification is fit or     ³
 ; ³  aligned in which case both the ten and eleven points will be          ³
 ; ³  required.                                                             ³
 ; ³  Note that aligned text requires two end points, fitted text needs     ³
 ; ³  two points and a height, and other justifications need an insertion,  ³
 ; ³  a height, and a rotation.                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (cond ((= justrg "f")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))
                  (cdr (assoc 40 entt))))    ; height
        ((= justrg "a")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))))
        (t
          (command (spit entt)                ; insertion
                   (cdr (assoc 40 entt))      ; height
                   (* 180 (/ (cdr (assoc 50 entt)) pi))))) ; rotation
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Enter the original text string.                                       ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (command (cdr (assoc 1 entt)))
  (setq enam1 (entlast))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Now add a new text entity after that one with the text command.       ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (command "text" "" str)
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  The user has apparently finished with Dtext and we are back in lisp.  ³
 ; ³  Reset the sysvars.                                                    ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setvar "textsize" czs)
  (setvar "textstyle" cs)
  (setvar "cecolor" cc)
  (setvar "clayer" cl)
  (setvar "celtype" clt)
 (list enam1 (entlast)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Ad end.                                                               ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Ab - create new text above an existing line.                          ³
 ; ³  Arguments: enam, the ename of the existing text                       ³
 ; ³             str, the new text string                                   ³
 ; ³  Returns a list of the enames of the new text entities.                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN AB (enam str / cs czs cc cl clt entt pa nl justrg ecolor enam1 enam2
                                                                          pb)
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Save system variables.                                                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq cs (getvar "textstyle"))
  (setq czs (getvar "textsize"))
  (setq cc (getvar "cecolor"))
  (setq cl (getvar "clayer"))
  (setq clt (getvar "celtype"))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Get the text entity data.                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq entt (entget enam))
  (setq pa (spit entt))                  ; original insertion point
  (setq nl (cdr (assoc 8 entt)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Find the justification of the original entity.                        ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq justrg (justo entt))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Set the entity creation colour to that of the text, set the linetype  ³
 ; ³  to bylayer, make the entity layer current, turn it on and thaw it,    ³
 ; ³  erase the original entity.                                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (if (setq ecolor (cdr (assoc 62 entt)))
      (progn
           (if (= (type ecolor) 'INT)
               (setq ecolor (itoa ecolor)))
           (setvar "cecolor" ecolor))
      (setvar "cecolor" "bylayer"))
  (setvar "celtype" "bylayer")
  (command "layer" "on" nl "t" nl "s" nl "")
  (entdel enam)
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Now create a new text entity which is identical to the selected one.  ³
 ; ³  This will allow the dtext command to pick up immediately below it.    ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (command "text" "s" (cdr (assoc 7 entt))   ; text style
           justrg)                           ; justification
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Find the insertion point.  If the text is left justified this will    ³
 ; ³  be the 10 point, otherwise 11, unless the justification is fit or     ³
 ; ³  aligned in which case both the ten and eleven points will be          ³
 ; ³  required.                                                             ³
 ; ³  Note that aligned text requires two end points, fitted text needs     ³
 ; ³  two points and a height, and other justifications need an insertion,  ³
 ; ³  a height, and a rotation.                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (cond ((= justrg "f")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))
                  (cdr (assoc 40 entt))))                 ; height
        ((= justrg "a")
         (command (cdr (assoc 10 entt))
                  (cdr (assoc 11 entt))))
        (t
         (command (spit entt)                             ; insertion
                  (cdr (assoc 40 entt))                   ; height
                  (* 180 (/ (cdr (assoc 50 entt)) pi))))) ; rotation
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Enter the new text string.  (This is the text entity that replaces    ³
 ; ³  the original one.)                                                    ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (command str)
  (setq enam1 (entlast))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Now pick up after that one by repeating the text command.             ³
 ; ³  This entity will have the original string.                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (command "text" "" (cdr (assoc 1 entt)))
  (setq enam2 (entlast))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  The user has apparently finished with Dtext and we are back in lisp.  ³
 ; ³  Reset the sysvars.                                                    ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setvar "textsize" czs)
  (setvar "textstyle" cs)
  (setvar "cecolor" cc)
  (setvar "clayer" cl)
  (setvar "celtype" clt)
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Move both text entities so as to place the new (lower) text entity    ³
 ; ³  where the original one was.  This puts the one containing the new     ³
 ; ³  string one line above the original text.                              ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq pb (spit (entget enam2)))        ; new text insertion point
  (command "move" enam1 enam2 "" pb pa)  ; move text entities
 (list enam1 enam2))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Ab end.                                                               ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Griz - a replacement for the entsel function - returns a list in the  ³
 ; ³  (ename point) format unless there was no entity at that point, in     ³
 ; ³  which case (nil point) is returned.                                   ³
 ; ³  Takes one argument, a prompt string.                                  ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN GRIZ (prom / pa ss)
  (princ prom)
  (while (and (setq pa (grread t 5 2))
              (/= (car pa) 6)
              (/= (car pa) 3)))
  (if (setq ss (ssget (setq pa (cadr pa))))
      (list (ssname ss 0) pa)
      (list () pa)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Griz end.                                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Spit - returns the insertion point of the text entity whose data was  ³
 ; ³  passed as its sole argument.  Note that this is not necessarily the   ³
 ; ³  same as the 10 association code.                                      ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN SPIT (entt / xjust yjust)
  (setq xjust (cdr (assoc 72 entt)))
  (setq yjust (cdr (assoc 73 entt)))
  (if (or (/= xjust 0) (/= yjust 0))
      (cdr (assoc 11 entt))
      (cdr (assoc 10 entt))))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Spit end.                                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Isab - see if a point or the insertion of a text entity is above or   ³
 ; ³  below a text entity relative to the orientation of the latter.        ³
 ; ³  Arguments: Entt1 - the base text entity data list.                    ³
 ; ³             Entt2 - either the entity data list of the entity whose    ³
 ; ³                     relative position we want, or a point.             ³
 ; ³  Returns the position of the destination entity or point relative to   ³
 ; ³  the source.                                                           ³
 ; ³  Calls spit.                                                           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN ISAB (entt1 entt2 / rota1a rota1b ten1 ten2 rota2)
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Get the rotation angle of the text, and the opposite angle.           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq rota1a (cdr (assoc 50 entt1)))
  (if (< rota1a pi)
      (setq rota1b (+ rota1a pi))
      (setq rota1b (- rota1a pi)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Get the angle from the insertion point of the source text to the      ³
 ; ³  insertion point of the destination text.  Am using insertions         ³
 ; ³  rather than ten points just because it seems more likely to be        ³
 ; ³  what the user wants.                                                  ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq ten1 (spit entt1))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  If the second argument is a data list, extract the insertion.         ³
 ; ³  Otherwise use it as a point.                                          ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (if (> (length entt2) 3)
      (setq ten2 (spit entt2))
      (setq ten2 entt2))
  (setq rota2 (angle ten1 ten2))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Will cover all conditions here, just for the sake of completeness.    ³
 ; ³  Also the code can do its own error checking.  Realistically should    ³
 ; ³  be able to only check for Above and call everything else Below.       ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (cond ((and (> rota1a rota1b) (> rota1a rota2) (> rota1b rota2))
         "above")
        ((and (> rota1a rota1b) (> rota1a rota2) (< rota1b rota2))
         "below")
        ((and (> rota1a rota1b) (< rota1a rota2) (< rota1b rota2))
         "above")
        ((and (< rota1a rota1b) (> rota1a rota2) (> rota1b rota2))
         "below")
        ((and (< rota1a rota1b) (< rota1a rota2) (> rota1b rota2))
         "above")
        ((and (< rota1a rota1b) (< rota1a rota2) (< rota1b rota2))
         "below")
        (T (write-line "*error* - unrecognized alignment."))))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Isab end.                                                             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Wm.                                                                   ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN C:WM (/ prev *error* aa lina bb linb pb rela newreq txa txb txlst
                                                                   ntxb ntxa)
  (setvar "cmdecho" 0)
  (command "undo" "mark")
  (setq prev *error*)
  (setq *error* errx) 
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Get the source text entity.                                           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (while (or (null (setq aa (griz "\nSource text: ")))
             (/= (cdr (assoc 0 (entget (car aa)))) "TEXT")))
  (setq lina (entget (setq aa (car aa))))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Get the destination entity or a point.                                ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq bb (griz "\nDestination text or pick new text line position: "))
  (if (and (car bb) (= (cdr (assoc 0 (entget (car bb)))) "TEXT"))
      (setq linb (entget (setq bb (car bb))))
      (setq pb (cadr bb)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  See if a new line is required, and if the destination is above or     ³
 ; ³  below the source.                                                     ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (if (and lina linb)
      (setq rela (isab lina linb))
      (progn
           (setq rela (isab lina pb))
           (setq newreq t)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Condition 1: The second line (the destination) was above the first    ³
 ; ³               (the source).                                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (cond ((and (null newreq) (= rela "above"))
         (setq txa (cdr (assoc 1 lina)))
         (setq txb (cdr (assoc 1 linb)))
         (setq txlst (1stwrd txa))
         (setq ntxb (strcat txb " " (car txlst)))
         (setq ntxa (cadr txlst))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina)))
         (entmod (subst (cons 1 ntxb) (cons 1 txb) linb)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Condition 2: The destination was below the source.                    ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
        ((and (null newreq) (= rela "below"))
         (setq txa (cdr (assoc 1 lina)))  ; text of line a 
         (setq txb (cdr (assoc 1 linb)))  ; text of line b 
         (setq txlst (endwrd txa))
         (setq ntxb (strcat (cadr txlst) " " txb))
         (setq ntxa (car txlst))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina)))
         (entmod (subst (cons 1 ntxb) (cons 1 txb) linb)))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Condition 3: A new line is required above the existing one.           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
        ((= rela "above")
         (setq txa (cdr (assoc 1 lina)))  ; text of line a 
         (setq txlst (1stwrd txa))
         (setq ntxb (car txlst))
         (setq ntxa (cadr txlst))
         (setq aa (cadr (ab aa ntxb)))
         (setq lina (entget aa))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina))))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Condition 4: A new line is required below the existing one.           ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
        ((= rela "below")
         (setq txa (cdr (assoc 1 lina)))  ; text of line a 
         (setq txlst (endwrd txa))
         (setq ntxb (cadr txlst))
         (setq ntxa (car txlst))
         (setq aa (car (ad aa ntxb)))
         (setq lina (entget aa))
         (if (or (= ntxa "") (= ntxa " "))
             (entdel aa)
             (entmod (subst (cons 1 ntxa) (cons 1 txa) lina)))))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Reset the error handler and end.                                      ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  (setq *error* prev)
 (princ))