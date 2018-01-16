dcl_settings : default_dcl_settings { audit_level = 3; }

dj_txtedit : dialog {
    label = "DJ Edit Text";
    initial_focus = "text_edit";




      
    : edit_box {
        label = "Text:";
        key = "text_edit";
        edit_width = 40;
        edit_limit = 2048;
        allow_accept = true;
    }
        : edit_box {
        label = "Not Text:";
        key = "ntext_edit";
        edit_width = 40;
        edit_limit = 2048;
        allow_accept = true;
    }
    ok_cancel_help_info;
}