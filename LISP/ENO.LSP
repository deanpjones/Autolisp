 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Eno - change existing text or attributes to incremented numbers as    ³
 ; ³  they are selected.  Allows direct subentity selection.                ³
 ; ³  Copyright 1996 by Rocket Software                                     ³
 ; ³  Coming soon from Rocket Foods: ASCII macaroni.                        ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Subroutine Loose - takes a string as an argument, prompts for an      ³
 ; ³  entity nentsel, puts the string into the entity.                      ³
 ; ³  Returns an ename if something was selected, otherwise nil             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN LOOSE (str / nent enam entt typ outer nn)
  (if (setq enam (car (setq nent (nentsel (strcat "<" str ">: ")))))
      (setq typ (cdr (assoc 0 (setq entt (entget enam))))))
  (if (and enam (or (= "TEXT" typ) (= "ATTDEF" typ) (= "ATTRIB" typ)))
      (progn
           (setq outer (car (reverse (car (reverse nent)))))
           (entmod (subst (cons 1 str) (assoc 1 entt) entt))
           (entupd enam)
           (if (= (type outer) 'ENAME) (entupd outer)))
      (progn
           (if enam (write-line "Can't eat that: it makes my stomach ache."))
           (setq enam ())))
 (if enam enam ()))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Loose end.                                                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Eno - the fizzy white ups.                                            ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 (DEFUN C:ENO ( / ss goon nnum pincr lll lln zz strnum nn)
   (setvar "cmdecho" 0)
   (command "undo" "mark")
   (if (= (type num) 'REAL)
       (progn
            (setq nnum (getreal (strcat "Start # <" (rtos num) ">: ")))
            (if nnum (setq num nnum)))
       (progn
            (setq num (getreal "Start # <1>: "))
            (if (null num) (setq num 1.0))))
   (if (= (type incr) 'REAL)
       (progn
            (setq pincr (getreal (strcat "Increment <" (rtos incr) ">: ")))
            (if pincr (setq incr pincr)))
       (progn
            (setq incr (getreal "Increment <1>: "))
            (if (null incr) (setq incr 1.0))))
   (if (and (= (type pref) 'STR) (/= pref ""))
       (setq ppref (getstring t (strcat "\nPrefix text <" pref ">:")))
       (progn
            (setq ppref (getstring t "\nPrefix text:"))
            (setq pref "")))
   (cond ((= ppref " ")
          (setq pref ""))
         ((/= ppref "")
          (setq pref ppref)))
   (if (and (= (type suff) 'STR) (/= suff ""))
       (setq psuff (getstring t (strcat "\nSuffix text <" suff ">:")))
       (progn
            (setq psuff (getstring t "\nSuffix text:"))
            (setq suff "")))
   (cond ((= psuff " ")
          (setq suff ""))
         ((/= psuff "")
          (setq suff psuff)))
   (setq goon T)
   (prompt "Select an entity ")
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  While entities are selected, replace their string values.             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   (while goon
          (setq strnum (rtos num 2))
          (if (equal num 0)
              (setq strnum "0")
              (progn
                   (setq pnum strnum) ; for while initialization
                   (while (= strnum pnum)
                          (setq pnum (substr strnum 1 (1- (strlen strnum))))
                          (setq lasdig (substr strnum (strlen strnum)))
                          (if (equal lasdig "0")
                              (setq strnum pnum)))
                   (if (equal lasdig ".")
                       (setq strnum pnum))))
 ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ; ³  Add the prefix and suffix, put the value into the entity.             ³
 ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
          (setq strnum (strcat pref strnum suff))
          (if (setq goon (loose strnum))
              (setq num (+ incr num))))
 (princ))