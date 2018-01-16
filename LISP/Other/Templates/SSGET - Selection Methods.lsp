(setq testTBlock (ssget "_X" (list (cons 2 "grb_d"))));Selects entire database and returns block with that name.

(setq ss (ssget "+.:E:S" '((0 . "INSERT")(2 . "TITLE_DRAWING_NO"))))

(setq ss (ssget "+.:E:N" '((0 . "INSERT")(2 . "TITLE_DRAWING_NO"))))
(setq ss (ssget ":N"))
(sslength ss)
(entget (ssname ss 0))


;For nested entity, same as (nentsel)
(setq ss (ssget ":N:S"))
(entget (cadar (ssnamex ss)))



