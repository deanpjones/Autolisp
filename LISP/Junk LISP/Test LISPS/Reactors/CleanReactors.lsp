;;;--------------------------------------------------------------;
;;;     Function: CleanReactors                                  ;
;;;--------------------------------------------------------------;
;;;  Description: General utility function used for cleaning up  ;
;;;               reactors. It can be used during debugging, as  ;
;;;               well as cleaning up any open reactors before   ;
;;;               a drawing is closed.                           ;
;;;--------------------------------------------------------------;
(defun CleanReactors ()
  (mapcar 'vlr-remove-all
         '(:VLR-AcDb-reactor
           :VLR-Editor-reactor
           :VLR-Linker-reactor
           :VLR-Object-reactor
          )
  )
)
