;;;Converts a STRING into a LIST.
;;;Dean Jones, April 25, 2006.

(setq txtstring "how are you")										;get TEXT STRING dxf property
(setq txtlist (read (strcat "(" txtstring ")")))					;Converts STRING to LIST.

;;;;NOTE THE LIST IS USING SYMBOLS.