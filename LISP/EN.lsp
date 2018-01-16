
(defun c:listDXF1 ()
(setq en (nentsel "\n Select text entity: "))(setq txt (car en))(setq txtdxf (entget txt))
)

(defun c:listDXF2 ()
(setq en (entsel "\n Select text entity: "))(setq txt (car en))(setq txtdxf (entget txt))
)