;---------------------------------------------------------
;Ends while on condition.
(setq test nil)
(while (and (/= (cdr (assoc 0 endxf)) "SEQEND")(not test))
(setq en (entnext en))(setq endxf (entget en))
(cond
(mytest (progn mycond (setq test T)))
);END COND.
);END WHILE.
;---------------------------------------------------------
;Ends while on condition.
(while (not done)
(cond

( (setq done 1))
)
)
;---------------------------------------------------------