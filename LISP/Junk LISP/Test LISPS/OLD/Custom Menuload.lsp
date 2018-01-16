
;;;Loads Custom Menus.

(if 	(/= (menugroup "Custom") "Custom")
	(command "menuload" "C:/_Configuration/1-Toolbars/Custom.mnc")
	(princ "\n** CUSTOM NOT LOADED.  **")
)

-----------------------------------------------------------

;;;Loads Express Tools.

(if 	(/= (menugroup "Express") "Express")
	(command "menuload" "C:/Program Files/AutoCAD 2000i/Express/acetmain.mnc")
	(princ "\n** EXPRESS NOT LOADED.  **")
	)


-----------------------------------------------------------


;;;Loads Command List Menu.

(if 	(/= (menugroup "REL_Commands") "REL_Commands")
	(command "menuload" "C:/_Configuration/1-Toolbars/Commands List/REL Commands.mnc")
	(princ "\n** REL COMMANDS NOT LOADED.  **")	
	)
)

-----------------------------------------------------------






	

