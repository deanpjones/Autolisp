(cond
((and (= (getvar "CTAB") "Model") (= (getvar "cprofile") "2D DESIGNER V2002 - AutoFLOW")) (AFPLOTMODEL) (AFPLOTPAPER)) 
((and (= (getvar "CTAB") "Model") (= (getvar "cprofile") "2D DESIGNER V2002 - AutoORTHO")) (AOPLOTMODEL) (AOPLOTPAPER)) 
((and (= (getvar "CTAB") "Model") (= (getvar "cprofile") "2D DESIGNER V2002 - AutoISO")) (AIPLOTMODEL) (AIPLOTPAPER))
(t nil)
)