;;;VERSION AUTOCAD 2006 ONLY!

;;;Re: Manipulate object draworder
;;;That's great! It means you do not need to explore the avenue you were over 
;;;in the vba newsgroup. The 2006API exposes the SortEntsTable's methods & 
;;;properties so you can do what you need to through it. Here's an example of 
;;;how to manipulate the draworder. Note that this only works if the Draworder 
;;;has been used in the particular layout. You would need to check for the 
;;;error raised, using vl-catch-all-apply, and create the table if needed. (The 
;;;VBA help shows how to do this.....)

(setq doc (vla-get-activedocument (vlax-get-acad-object))
      space (vla-get-block (vla-get-activelayout doc))
      extdict (vla-getextensiondictionary space)
      sorttbl (vla-getobject extdict "ACAD_SORTENTS")
      )
;;create ss for this example
(princ "\nSelect objects to move to front: ")
(setq ss (ssget))
;;create a list of the vla-objects in the ss
(vlax-for x (vla-get-activeselectionset doc)
  (setq sslist (cons x sslist))
  )
;;Move them to the Top of the draworder
(vlax-invoke sorttbl 'movetotop sslist)