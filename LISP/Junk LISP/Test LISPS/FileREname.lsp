;;File Renamer

;;How to get user input? Dialog Box? Picking folder? Options to keep directory or search new one?
(setq file "test.txt")
(setq path "C:/_Configuration/2-AutoLisp/AutoCAD 2005")
(setq oldfile (strcat path "/" file))

(setq newfilename "thishasbeenrenamed.lsp")
(setq newfile (strcat path "/" newfile))



(if (= T (vl-file-rename oldfile newfile))
(alert (strcat "The file: ***" ""newfile"" "*** has been renamed."))
(alert (strcat "The file: ***" ""newfile"" "*** was NOT renamed."))
)