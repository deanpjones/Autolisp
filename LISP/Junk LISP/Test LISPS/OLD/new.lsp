(if 
(= (getvar "filedia") 0)
(setvar "filedia" 1)
)



^C^C_(if (= (getvar "filedia") 0) ((setvar "filedia" 1) (command "new")) 