;List current printer.

(defun LISTCURRENTPLOTTER ( / AcadApp ActiveDoc Layout Curstyle Name CUSTOM)
(vl-load-com)
(setq AcadApp (vlax-Get-Acad-Object)
ActiveDoc (vla-get-ActiveDocument AcadApp)
Layout (vla-get-ActiveLayout ActiveDoc)
Curstyle (vla-get-StyleSheet Layout)
Name (vla-get-name Layout)
CUSTOM (vla-get-RefreshPlotDeviceInfo Layout)
)
(alert (strcat "Name is: "(strcase Name) " ... Style is: "(strcase Curstyle) " " (strcase CUSTOM)))
)