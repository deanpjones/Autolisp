(defun C:MACRO (/ str1 macro macname)

	(setq macro '(command))
	;start list with command

	(setq macname (getstring "\nEnter name of macro: "))
	;get name of macro

    	(while (/= str1 "/")
    	;do while str1 not equal to /

         	(setq str1 (getstring "\nEnter macro or / to exit: " ))
         	;get keystrokes

            	(if (= str1 "/")

                	(princ "\nEnd of macro ") 
                	;if / then print message

                	(Setq macro (append macro (list str1)))
                	;else append keystrokes to list
                ) 
                ;end if macro list

       );end while

	(eval (list 'defun (read macname) '() macro))
	;create function

   (princ)

);end macro

(princ)