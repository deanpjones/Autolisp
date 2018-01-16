;Install Information
;Dean Jones
;May 17, 2012

;--------------------------------
Loading

(1) To load Autoload file create CPC.MNL file in same directory as CPC.CUI file. This will
automatically load the MNL file then.
;Fast Loading (FAS) lisp file.
(load "S:/BR-S/gsGRP/GROUP/ENGCAD/00.000 CAD Management/700/780 CAD Configuration Files/CPC Customization (v2007)/CPC AutoLoad.fas" "\nCPC AutoLoad.fas not loaded")

(1a) To create FAS file
RUN FROM VLISP EDITOR.
(vlisp-compile 'st "c:/CPC Autoload.lsp" "c:/CPC Autoload.fas")

(2) Create AUTOLOAD FILE
CPC AutoLoad.lsp (to maintain)
CPC AutoLoad.fas (to optimize loading)

(3) Other, use startup suite.
;--------------------------------
Create Autoload file.
(vl-load-com)
;------
;Create list to load.
(setq loadlist '("add_support_path.lsp" "TextMatch.lsp" "AuditPurgeAll.lsp" "tblock.lsp" "TREV.lsp" "SetPlotLayout-VENDOR.lsp" "MYBLK.lsp" "MYBLK-Y.lsp" "VERSION.lsp"))
;Load function
(mapcar '(lambda (x) (load x (strcat "\n" x " not loaded"))) loadlist)
;------
;System Variable settings.
(setvar "luprec" 4)				;Sets the units precision to 4 decimal places.
(setvar "auprec" 4)				;Sets the units precision to 4 decimal places.
(setvar "offsetgaptype" 1)		;Sets offset to rounded rectangles (for site plan 100m clearances)
(setvar "mirrtext" 0)			;When mirroring does not flip text.
;------
;User specific settings
;----------Dean Jones------------
(if (= (getvar "LOGINNAME") "jonesdp")
(progn
(setvar "PICKBOX" 6)			;Select Objects pickbox size.
(setvar "donutID" 0)			;Sets default donut inside diameter.
(setvar "DRAWORDERCTL" 0)		;Sets the draworder display default.
(setvar "OSMODE" 0)				;Running OSNAP settings.
(setvar "cursorsize" 100)		;Crosshair size.
(setvar "luprec" 8)				;Sets the units precision to 8 decimal places.
(setvar "auprec" 8)				;Sets the units precision to 8 decimal places.
(command "zoom" "e")			;Zoom extents on loading.
(command "zoom" "0.95x")		;Zoom back 95%.
(PRINC)
);END PROGN
);END IF
;------
;Maximize window on startup.
(defun winMax ( / acadApp activeDoc winMaximize)
(setq acadApp (vlax-get-acad-object))
(setq activeDoc  (vla-get-activeDocument acadApp))
(setq winMaximize (vla-put-WindowState activeDoc acMax))
(princ)
)
(winMax)
;------
;Message that AUTOLOAD is loaded on startup.
(terpri)(princ "\nConocoPhillips Settings & Lisp loaded. v2011")
;--------------------------------
Local USER PATH for AutoCAD
C:\Documents and Settings\%USERNAME%\Application Data\Autodesk\AutoCAD 2011\R18.1\enu\support
;--------------------------------
Mapping a drive
(1)Z:drive to be mapped to...
\\cgyap7\shared\BR-S\gsGRP\GROUP\ENGCAD\00.000 CAD Management\700
;--------------------------------
Add support path by code.
(load "add_support_path.lsp")
(addSupportPath "Z:\\780 CAD Configuration Files\\Scripts" nil)		;Adds to end of list (low priority)
(addSupportPath "Z:\\780 CAD Configuration Files\\Scripts" 0)		;Adds to top of list (high priority)
;--------------------------------
