EXAMPLE : dialog {
          label = "EXAMPLE.lsp";            \\ Puts a label on the dialog box
          initial_focus = "textval";       \\ Sets the initial focus
          : column {
            : row {
              : boxed_column {
                : edit_box {                \\ The edit_box control - Something new! 
                  key = "textval";
                  label = "Text Value to Find";
                  edit_width = 30;
                  value = "";
                }
              } 
            }
            : row {
              : boxed_row {
                : button {
                  key = "accept";
                  label = " Okay ";
                  is_default = true;
                }
                : button {
                  key = "cancel";
                  label = " Cancel ";
                  is_default = false;
                  is_cancel = true;
                }
              }
            }
          } 
}