 ; ������������������������������������������������������������������������Ŀ
 ; �  C: turbocopier.                                                       �
 ; �  Copyright 1997 by Rocket Software                                     �
 ; �                                                                        �
 ; ��������������������������������������������������������������������������

 ; ������������������������������������������������������������������������Ŀ
 ; �  Nert - error handler.                                                 �
 ; ��������������������������������������������������������������������������
 (DEFUN NERT (shk /)
  (setq *error* esav)
  (if (/= shk "Function cancelled") (write-line shk))
  (setvar "snapmode" snapp)
 (princ))
 ; ������������������������������������������������������������������������Ŀ
 ; �  Nert end.                                                             �
 ; ��������������������������������������������������������������������������

 ; ������������������������������������������������������������������������Ŀ
 ; �  C - no relation to the language...well, not much.                     �
 ; ��������������������������������������������������������������������������
 (DEFUN C:TCOPY (/ ss)
  (setq esav *error*)
  (setq *error* nert)
  (setq snapp (getvar "snapmode"))
  (setvar "snapmode" 0)
  (if (setq ss (ssget))
      (command "copy" ss "" "m"))
  (setvar "snapmode" snapp)
  (setq *error* esav)
 (princ))