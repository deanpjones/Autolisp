qplot : dialog {
    label = "Custom Plot Configuration";

     : boxed_radio_column {
      label = "Choose Plotter :";

        //change the plotter name to suit your own
        : radio_button {
          label = "\\CGYP19NS\CGY-HP8150-1537";
          key = "rb1";
        }
        //change the plotter name to suit your own
        : radio_button {
          label = "\\CGYP19NS\CGY-HP8150-1507";
          key = "rb2"; 
        }

     }


     : boxed_radio_column {
      label = "Plot Type:";

        : radio_button {
          label = "Vendor";
          key = "rb5";
        }
        : radio_button {
          label = "BRC Ltd.";
          key = "rb6"; 
        }
        : radio_button {
          label = "PDF";
          key = "rb7"; 
        }
        : radio_button {
          label = "A&3 -   420 x 297";
          key = "rb8"; 
        }
        : radio_button {
          label = "A&4 -   297 x 210";
          key = "rb9"; 
        }
     }
  
      ok_cancel ;  

               : paragraph {
		 : text_part {
                   label = "Burlington Resources Canada Ltd.";
                 }
               }
}

choose : dialog {
    label = "Plot Routine";
     
       : text {
       label = "Continue with Plot?";
       alignment = centered;
       }

       ok_cancel ;  
                   
}