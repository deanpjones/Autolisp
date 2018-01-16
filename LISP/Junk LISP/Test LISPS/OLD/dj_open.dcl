// Next available MSG number is   494
// MODULE_ID ACAD_DCL_
//
//
//  acad.dcl - AutoCAD dialogs
//
//  Copyright 1991-1998 by Autodesk, Inc.
//
//  Permission to use, copy, modify, and distribute this software for
//  any purpose and without fee is hereby granted, provided that the
//  above copyright notice appears in all copies and that both that
//  copyright notice and the limited warranty and restricted rights
//  notice below appear in all supporting documentation.
//
//  AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS.
//  AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
//  MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK,
//  INC. DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
//  UNINTERRUPTED OR ERROR FREE.
//
//  Use, duplication, or disclosure by the U.S. Government is subject
//  to restrictions set forth in FAR 52.227-19 (Commercial Computer
//  Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
//  (Rights in Technical Data and Computer Software), as applicable.
//

//  This file should not be modified when used with AutoCAD.
//  Modification to the dialog definitions can have serious adverse
//  effects on the use of the product.  Since no modifications to this
//  file are allowed, there should be no need for any internal error
//  checking on the contents of this file, hence we disable audit
//  checks by default.

acad_snap : dialog {
        label = "Drawing Aids";
        : row {
            : column {
                : boxed_column {
                    label = "Modes";
                    : toggle {
                        label = "&Ortho";
                        key = "ortho";
                    }
                    : toggle {
                        label = "Solid &Fill";
                        key = "fill";
                    }
                    : toggle {
                        label = "&Quick Text";
                        key = "qtext";
                    }
                    : toggle {
                        label = "&Blips";
                        key = "blips";
                    }
                    : toggle {
                        label = "Hi&ghlight";
                        key = "hilite";
                    }
                    : toggle {
                        label = "Gro&ups";
                        key = "group";
                    }
                    : toggle {
                        label = "Hat&ch";
                        key = "hatch";
                    }

                }
            }
            : boxed_column {
                label = "&Snap";
                : toggle {
                    label = "On";
                    key = "snap";
                }
                : edit12_box {
                    label = "&X Spacing";
                    key = "s_xsp";
                    errmsg = "Snap X Spacing";
                }
                : edit12_box {
                    label = "&Y Spacing";
                    key = "s_ysp";
                    errmsg = "Snap Y Spacing";
                }
                : edit12_box {
                    label = "Snap A&ngle";
                    key = "s_ang";
                    errmsg = "Snap Angle";
                }
                : edit12_box {
                    label = "X B&ase";
                    key = "xbase";
                    errmsg = "Snap X Base";
                }
                : edit12_box {
                    label = "Y Bas&e";
                    key = "ybase";
                    errmsg = "Snap Y Base";
                }
            }
            : column {
                : boxed_column {
                    label = "Gri&d";
                    fixed_height = true;
                    : toggle {
                        label = "On";
                        key = "grid";
                    }
                    : edit12_box {
                        label = "X S&pacing";
                        key = "g_xsp";
                        errmsg = "Grid X Spacing";
                    }
                    : edit12_box {
                        label = "Y Spac&ing";
                        key = "g_ysp";
                        errmsg = "Grid Y Spacing";
                    }
                }
                : boxed_column {
                    label = "Iso&metric Snap/Grid";
                    : toggle {
                        label = "On";
                        key = "iso";
                    }
                    : radio_row {
                        key = "isorad";
                        : radio_button {
                            label = "&Left";
                            key = "ileft";
                        }
                        : radio_button {
                            label = "&Top";
                            key = "itop";
                        }
                        : radio_button {
                            label = "&Right";
                            key = "iright";
                        }
                    }
                }
            }
       }
       ok_cancel_help_errtile;
}

rq_chroma :dialog {
    label = "Select Color";
    key = "chroma";                   // used by Help button to obtain label
    std_rq_color;
}

lt_text: text {
    width = 25;
}

lt_image: image_button {
    height = 1;
    width = 15;
    allow_accept = true;
}

acad_tstyle : dialog {
    label = "Select Text Style";
    : row {
        : column {
            : list_box {
                key = "style_list";
                width = 16;
                height = 8;
                allow_accept = true;
            }
            : button {
                label = "Show &All...";
                key = "showall";
            }
        }
        : column {
            : image {
                key = "style_image";
                height = 7;
                width = 20;
            }
            : edit_box {
                key = "style_sample";
                label = "&Sample Text:";
                edit_width = 6;
                fixed_width = true;
                alignment = centered;
            }
        }
    }
    spacer;
    : edit_box {
        key = "style_edit";
        label = "Style &Name:";
        edit_width = 31;
        edit_limit = 217;
        fixed_width = true;
        allow_accept = true;
    }
    : row {
        : paragraph {
            : text_part {
                label = "Font:";
            }
            : text_part {
                label = "Height:";
            }
            : text_part {
                label = "Width:";
            }
            : text_part {
                label = "Oblique:";
            }
            : text_part {
                label = "Generation:";
            }
        }
        : paragraph {
            : text_part {
                key = "font";
                width = 32;
            }
            : text_part {
                key = "height";
                width = 32;
            }
            : text_part {
                key = "width";
                width = 32;
            }
            : text_part {
                key = "oblique";
                width = 32;
            }
            : text_part {
                key = "gen";
                width = 32;
            }
        }
    }
    ok_cancel_err;
}

acad_tstyle_sym : dialog {
    key = "acad_tstyle_sym";
    label = "Symbol Set";
    : text {
        key = "page";
        width = 10;
    }
    : image {
        key = "showall";
        color = graphics_background;
        height = 16;
        width = 70;
    }
    : row {
        : ok_button {
            is_cancel = true;
        }
        : button {
            label = "&Previous";
            key = "pagedown";
            width = 10;
        }
        : button {
            label = "&Next";
            key = "pageup";
            width = 10;
        }
    }
}

acad_icon: dialog {
        key = "label";
        initial_focus               = "listbox";
        : row {
            : list_box {
                width               = 20;
                height              = 21;
                fixed_height        = true;
                key                 = "listbox";
                allow_accept        = true;
            }
            : column {
                : row {
                    : icon_image {
                        key         = "icon1";
                    }
                    : icon_image {
                        key         = "icon2";
                    }
                    : icon_image {
                        key         = "icon3";
                    }
                    : icon_image {
                        key         = "icon4";
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon5";
                    }
                    : icon_image {
                        key         = "icon6";
                    }
                    : icon_image {
                        key         = "icon7";
                    }
                    : icon_image {
                        key         = "icon8";
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon9";
                    }
                    : icon_image {
                        key         = "icon10";
                    }
                    : icon_image {
                        key         = "icon11";
                    }
                    : icon_image {
                        key         = "icon12";
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon13";
                    }
                    : icon_image {
                        key         = "icon14";
                    }
                    : icon_image {
                        key         = "icon15";
                    }
                    : icon_image {
                        key         = "icon16";
                    }
                }
                : row {
                    : icon_image {
                        key         = "icon17";
                    }
                    : icon_image {
                        key         = "icon18";
                    }
                    : icon_image {
                        key         = "icon19";
                    }
                    : icon_image {
                        key         = "icon20";
                    }
                }
/*
 *              : row {
 *                  : icon_image {
 *                      key         = "icon21";
 *                  }
 *                  : icon_image {
 *                      key         = "icon22";
 *                  }
 *                  : icon_image {
 *                      key         = "icon23";
 *                  }
 *                  : icon_image {
 *                      key         = "icon24";
 *                  }
 *              }
 */
            }
        }
        : row {
            : row {
                spacer_0;
                : row {
                    fixed_width = true;
                    : button {
                        label = "&Previous";
                        key = "prev";
                        width = 8;
                    }
                    :spacer {
                        width = 2;
                    }
                    :button {
                        label = "  &Next  ";
                        key = "next";
                        width = 8;
                    }
                }
                spacer_0;
            }
            spacer;
            ok_cancel;
        }
}

acad_mtprop_edit_box : edit_box {
    edit_width = 20;
    edit_limit = 30;
}

acad_mtprop_popup_list : popup_list {
    edit_width = 24;
}

acad_mtprop : dialog {
    label = "MText Properties";
    :boxed_column {
        label = "Contents";
        :acad_mtprop_popup_list {
            label = "Text &Style:";
            key = "sty";
        }
        :acad_mtprop_edit_box {
            label = "Text Hei&ght:";
            key = "hgt";
        }
        :acad_mtprop_popup_list {
            label = "&Direction:";
            list = "Left to Right\nTop to Bottom";
            key = "dir";
        }
    }
    :boxed_column {
        label = "Object";
        :acad_mtprop_popup_list {
            label = "&Attachment:";
            list = "TopLeft\nTopCenter\nTopRight\nMiddleLeft\nMiddleCenter\nMiddleRight\nBottomLeft\nBottomCenter\nBottomRight";
            key = "att";
        }
        :acad_mtprop_edit_box {
            label = "&Width:";
            key = "wid";
        }
        :acad_mtprop_edit_box {
            label = "&Rotation:";
            key = "rot";
        }
    }
    ok_cancel_help_errtile;
}

acad_plan6 : dialog {
    label = "UCS";
    : concatenation {
        : text_part {
            label = "Name: ";
        }
        : text_part {
            label = "*World*";
            key = "name";
            width = 40;
        }
    }
    : row {
        : boxed_column {
            label = "Origin";
            : concatenation {
                : text_part {
                    label = "X=";
                }
                : text_part {
                    key = "00";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Y=";
                }
                : text_part {
                    key = "10";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Z=";
                }
                : text_part {
                    key = "20";
                    width = 12;
                }
            }
        }
        : boxed_column {
            label = "X Axis";
            : concatenation {
                : text_part {
                    label = "X=";
                }
                : text_part {
                    key = "01";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Y=";
                }
                : text_part {
                    key = "11";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Z=";
                }
                : text_part {
                    key = "21";
                    width = 12;
                }
            }
        }
        : boxed_column {
            label = "Y Axis";
            : concatenation {
                : text_part {
                    label = "X=";
                }
                : text_part {
                    key = "02";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Y=";
                }
                : text_part {
                    key = "12";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Z=";
                }
                : text_part {
                    key = "22";
                    width = 12;
                }
            }
        }
        : boxed_column {
            label = "Z Axis";
            : concatenation {
                : text_part {
                    label = "X=";
                }
                : text_part {
                    key = "03";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Y=";
                }
                : text_part {
                    key = "13";
                    width = 12;
                }
            }
            : concatenation {
                : text_part {
                    label = "Z=";
                }
                : text_part {
                    key = "23";
                    width = 12;
                }
            }
        }
    }
    : ok_button {
        is_cancel = true;
    }
}

acad_plan : dialog {
    label = "UCS Control";
    initial_focus = "listbox";
    spacer;
    : list_box {
        label = "&UCS Names";
        tabs = "34";
        key = "listbox";
        width = 44;
        tab_truncate = true;
    }
    : row {
        : button {
            label = "&Current";
            key = "cur";
        }
        : button {
            label = "&Delete";
            key = "delete";
        }
        : button {
            label = "&List...";
            key = "list";
        }
    }
    : row {
        : button {
            label = "&Rename To:";
            key = "rename";
            fixed_width = true;
        }
        : edit_box {
            key = "rename_edit_box";
            edit_width = 28;
            edit_limit = 217;
        }
    }
    ok_cancel_help_errtile;
}

acad_txtedit : dialog {
    label = "Edit Text";
    initial_focus = "text_edit";
    : edit_box {
        label = "Text:";
        key = "text_edit";
        edit_width = 40;
        edit_limit = 2048;
        allow_accept = true;
    }
    ok_cancel;
}

acad_attedit : dialog {
    label = "Edit Attribute Definition";
    initial_focus = "tag_edit";
    : edit_box {
        key = "tag_edit";
        label = "Tag:";
        edit_width = 40;
        edit_limit = 2048;
    }
    : edit_box {
        key = "prompt_edit";
        label = "Prompt:";
        edit_width = 40;
        edit_limit = 2048;
    }
    : edit_box {
        key = "default_edit";
        label = "Default:";
        edit_width = 40;
        edit_limit = 2048;
    }
    ok_cancel;
    : errtile { width = 45; }
}

acad_dlfname : dialog {               // Single-file dialog
    initial_focus = "fedit";
    key = "dlfname";
    files_topdf;
    : row {
        : list_box {
            label = "Di&rectories:";
            key = "dirbox";
            width = 15;
        }
        : list_box {
            label = "F&iles:";
            key = "filebox";
            width = 15;
            allow_accept = true;
        }
        : column {
            : image {          // Drawing icon image will go here
                key = "icon";
                color = dialog_background;    // Invisible
                height = 4;
                aspect_ratio = 1.4;
                fixed_height = true;
                fixed_width = true;
            }
            : button {
                label = "&Type it";
                key = "typeit";
            }
            : button {
                label = "&Default";
                key = "default";
            }
        }
    }
    files_bottomdf;
}

//  acad_dlfmulti is used by the FILES command's Delete and Unlock
//  options.  It is similar to acad_dlfname (above), except that:
//
//    - its file listbox has the "multiple_select" attribute,
//    - its file listbox does not have the "allow_accept" attribute,
//    - it has additional "Select all" and "Clear all" buttons, and
//    - its title bar label is slightly different.
//
//  Modifications to either dialog should be examined for their relevance
//  to the other.

acad_dlfmulti : dialog {              // Multiple-file dialog
    initial_focus = "fedit";
    key = "dlfname";
    files_topdf;
    : row {
        : list_box {
            label = "Di&rectories:";
            key = "dirbox";
            width = 15;
        }
        : list_box {
            label = "F&iles:";
            key = "filebox";
            width = 15;
            multiple_select = true;
        }
        : column {
            : image {          // Drawing icon image will go here
                key = "icon";
                color = dialog_background;    // Invisible
                alignment = centered;
                height = 4;
                aspect_ratio = 1.4;
                fixed_height = true;
                fixed_width = true;
            }
            spacer_1;
            : button {
                label = "&Select all";
                key = "all";
            }
            : button {
                label = "&Clear all";
                key = "clear";
                is_enabled = false;
            }
            spacer_1;
            : button {
                label = "&Type it";
                key = "typeit";
            }
            : button {
                label = "D&efault";
                key = "default";
            }
        }
    }
    files_bottomdf;
}

acad_files : dialog {
    label = "File Utilities";
    initial_focus = "exit";
    : row {
        : column {
            : button {
                label = "&List files... ";
                key = "list";
            }
            : button {
                label = "&Delete file...";
                key = "delete";
            }
        }
        : column {
            : button {
                label = " &Copy file... ";
                key = "copy";
            }
            : button {
                label = "&Unlock file...";
                key = "unlock";
            }
        }
        : column {
            : button {
                label = "&Rename file...";
                key = "rename";
            }
            : help_button {
                fixed_width = false;
            }
        }
    }
    errtile;
    : button {
        label = "     E&xit     ";
        key = "cancel";
        fixed_width = true;
        alignment = centered;
        is_cancel = true;
        is_default = true;
    }
}

acad_info : dialog {
    label = "Program Information";    // Overridden by caller
    key = "acad_info";
    : row {
        : image {
            key = "logo";
            width = 8;
            aspect_ratio = 1.0;
            fixed_height = true;
            alignment = top;
            color = dialog_background;
        }
        : paragraph {
            : text_part {
                key = "text1";
                width = 63;
            }
            : text_part {
                key = "text2";
                width = 63;
            }
            : text_part {
                key = "text3";
                width = 63;
            }
            : text_part {
                key = "text4";
                width = 63;
            }
            : text_part {
                key = "text5";
                width = 63;
            }
            : text_part {
                key = "text6";
                width = 63;
            }
            : text_part {
                key = "text7";
                width = 63;
            }
            : text_part {
                key = "text8";
                width = 63;
            }
            : text_part {
                key = "text9";
                width = 63;
            }
            : text_part {
                key = "text10";
                width = 63;
            }
        }
    }
    spacer;
    : list_box {
        width = 63;
        key = "listbox";
    }
    : ok_button {                     // Permit exit via either ENTER
        is_cancel = true;             //   or CTRL-C.
    }
}

init_view : dialog {

    key = "title";
    initial_focus = "listbox";
    : list_box {
        tabs = "33";
        width = 40;
        key = "listbox";
        allow_accept = true;
    }
    ok_cancel_err;
}




acad_plot : dialog {
    label = "Print / Plot Configuration";
    : row {
        : column {
            : boxed_column {
                label = "Device and Default Information";
                : text {
                    key = "userid";
                    width = 35;
                }
                : button {
                    label = "&Device and Default Selection...";
                    fixed_width = true;
                    key = "devsel";
                    alignment = centered;
                }
            }
            : boxed_row {
                label = "Pen Parameters";
                children_fixed_width = true;
                : button {
                    label = "&Pen Assignments...";
                    key = "assign";
                }
                : button {
                    label = "&Optimization...";
                    key = "optimize";
                }
            }
            : boxed_column {
                label = "Additional Parameters";
                : row {
                    : radio_column {
                        fixed_width = true;
                        : radio_button {
                            label = "Displa&y";
                            key = "D";
                        }
                        : radio_button {
                            label = "E&xtents";
                            key = "E";
                        }
                        : radio_button {
                            label = "&Limits";
                            key = "L";
                        }
                        : radio_button {
                            label = "&View";
                            key = "V";
                        }
                        : radio_button {
                            label = "&Window";
                            key = "W";
                        }
                    }
                    : column {
                        : edit12_box {
                            label = "Text Resolution";
                            key = "textreso";
                            errmsg = "Text Resolution";
                        }
                        : toggle {
                            label = "Text Fill";
                            key = "textfill";
                        }
                        : toggle {
                            label = "Hide&-Lines";
                            key = "hide";
                        }
                        : toggle {
                            label = "Ad&just Area Fill";
                            key = "plfill";
                        }
                        : toggle {
                            label = "Plot To &File";
                            key = "file";
                        }
                        : toggle {
                            label = "Auto&spool";
                            key = "aspool";
                        }
                    }
                }
                : row {
                    alignment = centered;
                    : button {
                        label = "Vi&ew...";
                        key = "view";
                        fixed_width = true;
                    }
                    : button {
                        label = "Wi&ndow...";
                        key = "selwind";
                        fixed_width = true;
                    }
                    : button {
                        label = "File N&ame...";
                        key = "sfile";
                        fixed_width = true;
                    }
                }
            }
        }
        : column {
                : boxed_column {
                    label = "Paper Size and Orientation";
                    : row {
                        : radio_column {
                            fixed_width = true;
                            : radio_button {
                                label = "In&ches";
                                key = "I";
                            }
                            : radio_button {
                                label = "&MM";
                                key = "M";
                            }
                        }
                        : row {
                            fixed_width = true;
                            : button {
                                label = "Si&ze...";
                                key = "sizbuttn";
                                fixed_width = true;
                            }
                            : text {
                                key = "size";
                                width = 6;
                            }
                            : column {
                                spacer;
                                : image {
                                    key = "vec_image";
                                    width = 4.0;
                                    fixed_width = true;
                                    aspect_ratio = 1.0;
                                    color = dialog_background;
                                }
                                spacer;
                            }
                        }
                    }
                    : text {
                        key = "area";
                        width = 25;
                    }
                }
                : boxed_column {
                    label = "Scale, Rotation, and Origin";
                    : button {
                        label = "Rotation and Ori&gin...";
                        key = "rot&or";
                        alignment = centered;
                        fixed_width = true;
                    }
                    : row {
                        : column {
                            children_fixed_width = true;
                            : text {
                                key = "pu";
                                width = 14;
                                alignment = right;
                            }
                            : edit_box {
                                edit_width = 10;
                                key = "punit";
                                alignment = centered;
                            }
                        }
                        : column {
                            children_fixed_width = true;
                            children_alignment = centered;
                            : text {
                                label = "=";
                            }
                            : text {
                                label = "=";
                            }
                        }
                        : column {
                            children_fixed_width = true;
                            : text {
                                label = "Drawing Units";
                            }
                            : edit_box {
                                edit_width = 10;
                                key = "dunit";
                                alignment = centered;
                            }
                        }
                    }
                    : toggle {
                        label = "Scaled to Fi&t";
                        key = "fit";
                    }
                }
                : boxed_column {
                    label = "Plot Preview";
                    : row {
                        children_fixed_width = true;
                        : button {
                            label = "P&review...";
                            key = "prev";
                        }
                        : radio_row {
                            : radio_button {
                                label = "Part&ial";
                                key = "earea";
                            }
                            : radio_button {
                                label = "F&ull";
                                key = "full";
                            }
                        }
                    }
                }
        }
    }
    ok_cancel_help;
    : row {
        : errtile { fixed_width = true; }

        // This spacer_0 between the two fixed-width items serves
        // to left-justify the first and right-justify the second,
        // since it's the only flexible-width item in the row.
        spacer_0;

        : row {
            fixed_width = true;
            : text {
                key = "zero";
                width = 3;
            }
            : image {
                key = "pre_image";
                color = dialog_background;
                height = 1;
                width = 18;
            }
            : text {
                key = "comp";
                width = 5;
            }
        }
    }
}

acad_plwin : dialog {
    label = "Window Selection";
        : button {
            label = "&Pick <";
            key = "pick";
            fixed_width = true;
        }
            : boxed_row {
                label = "&First Corner";
                : edit_box {
                    label = "   X:";
                    key = "fpx";
                    edit_width = 10;
                }
                : edit_box {
                    label = "   Y:";
                    key = "fpy";
                    edit_width = 10;
                }
            }
            : boxed_row {
                label = "&Other Corner";
                : edit_box {
                    label = "   X:";
                    key = "spx";
                    edit_width = 10;
                }
                : edit_box {
                    label = "   Y:";
                    key = "spy";
                    edit_width = 10;
                }
            }
        ok_cancel_err;
}

acad_plopt : dialog {
    aspect_ratio = 0;
    label = "Optimizing Pen Motion";
    : column {
        : toggle {
            label = "&No optimization";
            key = "0";
        }
        : toggle {
            label = "Adds &endpoint swap";
            key = "1";
        }
        : toggle {
            label = "Adds &pen sorting";
            key = "2";
        }
        : toggle {
            label = "Adds &limited motion optimization";
            key = "3";
        }
        : toggle {
            label = "Adds &full motion optimization";
            key = "4";
        }
        : toggle {
            label = "&Adds elimination of overlapping horizontal or vertical vectors";
            key = "5";
        }
        : toggle {
            label = "A&dds elimination of overlapping diagonal vectors";
            key = "6";
        }
    }
    ok_cancel;
}

acad_plsize : dialog {
    label = "Paper Size";
    : row {
        : column {
            : concatenation {
                : text_part {
                    label = "&Size";
                    width = 8;
                }
                : text_part {
                    label = "Width";
                    width = 9;
                }
                : text_part {
                    label = "Height";
                }
            }
            : list_box {
                key = "listbox";
                tabs = "0 8 17";
                width = 28;
                height = 13;
            }
        }
        spacer_1;
        : column {
            : row {
                : text_part {
                    label = "Size";
                    width = 8;
                }
                : text_part {
                    label = "Width";
                    width = 11;
                }
                : text_part {
                    label = "Height";
                }
            }
            spacer_0;
            : row {
                : text_part {
                    label = "&USER:";
                    width = 8;
                }
                : edit_box {
                    key = "0w";
                    edit_width = 10;
                }
                : edit_box {
                    key = "0h";
                    label = " ";
                    edit_width = 10;
                }
            }
            : row {
                : text_part {
                    label = "USER&1:";
                    width = 8;
                }
                : edit_box {
                    key = "1w";
                    edit_width = 10;
                }
                : edit_box {
                    key = "1h";
                    label = " ";
                    edit_width = 10;
                }
            }
            : row {
                : text_part {
                    label = "USER&2:";
                    width = 8;
                }
                : edit_box {
                    key = "2w";
                    edit_width = 10;
                }
                : edit_box {
                    label = " ";
                    key = "2h";
                    edit_width = 10;
                }
            }
            : row {
                : text_part {
                    label = "USER&3:";
                    width = 8;
                }
                : edit_box {
                    key = "3w";
                    edit_width = 10;
                }
                : edit_box {
                    label = " ";
                    key = "3h";
                    edit_width = 10;
                }
            }
            : row {
                : text_part {
                    label = "USER&4:";
                    width = 8;
                }
                : edit_box {
                    key = "4w";
                    edit_width = 10;
                }
                : edit_box {
                    label = " ";
                    key = "4h";
                    edit_width = 10;
                }
            }
            : row {
                : column {
                    spacer_1;
                    : row {
                        alignment = left;
                        : text_part {
                            label = "Orientation is";
                            fixed_width = true;
                        }
                        : text_part {
                            key = "land";
                            width = 12;
                        }
                    }
                    spacer;
                }
                : column {
                    spacer;
                    : image {
                        key = "vec_image";
                        width = 4.0;
                        fixed_width = true;
                        aspect_ratio = 1.0;
                        color = dialog_background;
                    }
                    spacer;
                }
            }
        }
    }
    ok_cancel_err;
}

acad_plpen : dialog {
    label = "Pen Assignments";
    : column {
        : row {
            : paragraph {
                : concatenation {
                    : text_part {
                        label = "Color    Pen No.";
                        key = "1";
                        width = 20;
                    }
                    : text_part {
                        label = "Linetype";
                        key = "2";
                        width = 11;
                    }
                    : text_part {
                        label = "Speed";
                        key = "3";
                        width = 7;
                    }
                    : text_part {
                        label = "Pen Width";
                        key = "4";
                    }
                }
                : list_box {
                    key = "listbox";
                    tabs = "2 11 22 32 38";
                    width = 50;
                    multiple_select = true;
                }
            }
            : boxed_column {
                label = "Modify Values";
                : row {
                    : text_part {
                        label = "Color:";
                        width = 7;
                        fixed_width = true;
                    }
                    : image {
                        key = "color_image";
                        width = 4.0;
                        height = 0.5;
                    }
                }
                : text {
                    width = 13;
                    key = "varies";
                }
                : row {
                    : text_part {
                        label = "&Pen:";
                        width = 7;
                        fixed_width = true;
                    }
                    : edit_box {
                        key = "penno";
                        edit_width = 8;
                    }
                }
                : row {
                    : text_part {
                        label = "&Ltype:";
                        width = 7;
                        fixed_width = true;
                    }
                    : edit_box {
                        key = "ltype";
                        edit_width = 8;
                    }
                }
                : row {
                    : text_part {
                        label = "&Speed:";
                        width = 7;
                        fixed_width = true;
                    }
                    : edit_box {
                        key = "speed";
                        edit_width = 8;
                    }
                }
                : row {
                    : text_part {
                        label = "&Width:";
                        width = 7;
                        fixed_width = true;
                    }
                    : edit_box {
                        key = "width";
                        edit_width = 8;
                    }
                }
            }
        }
        : row {
            : button {
                label = "&Feature Legend...";
                key = "legend";
                fixed_width = true;
            }
            : spacer { width = 2; }
            : edit_box {
                label = "P&en Width:";
                key = "lpwidth";
                edit_width = 8;
                fixed_width = true;
            }
        }
    }
    ok_cancel_err;
}

acad_plpre : dialog {
    label = "Preview Effective Plotting Area";
        : image {
            key = "pimage";
            height = 11.25;
            width = 25;
            fixed_width = true;
            fixed_height = true;
            alignment = centered;
        }
        : row {
            : image {
                key = "cpaper";
                width = 2.0;
                color = red;
                height = 0.1;
                fixed_width = true;
                fixed_height = true;
            }
            : text {
                key = "paper";
                width = 50;
            }
        }
        : row {
            : image {
                key = "earea";
                width = 2.0;
                color = blue;
                height = 0.1;
                fixed_width = true;
                fixed_height = true;
            }
            : text {
                key = "area";
                width = 50;
            }
        }
        : row {
            : image {
                key = "clip";
                width = 2.0;
                height = 0.1;
                fixed_width = true;
                fixed_height = true;
            }
            : text {
                key = "cliptxt";
                width = 50;
            }
        }
        : text {
            width = 50;
            key = "warn";
        }
        : list_box {
            height = 3;
            key = "listbox";
        }
    ok_only;
}

acad_plok : dialog {
   label = "Plot Preview";
   : column {
       width = 15;
       : button {
           label = "&Pan and Zoom";
           key = "zoomd";
       }
       : button {
           key = "accept";
           label = "&End Preview";
           is_cancel = true;
       }
   }
}

acad_plokcan : dialog {
    label = "Plot Preview";
    : column {
        width = 15;
        : button {
            label = "&Zoom Previous";
            key = "zoomd";
        }
        : button {
            key = "accept";
            label = "&End Preview";
            is_cancel = true;
        }
    }
}

acad_devdesc : dialog {
    label = "Describe Device";
    : column {
        : text {
            label = "AutoCAD needs a description of the device so you can find it later.";
        }
        : edit_box {
            edit_limit = 80;
            label = "Description:";
            key = "desc";
        }
    }
    ok_cancel;
}

acad_devinf : dialog {
    label = "Device and Default Selection";
    : boxed_column {
                label = "Select a Device Configuration";
                : list_box {
                        key = "listbox";
                        width = 60;
                        height = 6;
                        tabs = "36";
                }
                : concatenation {
                        : text_part {
                        label = "Manufacturer: ";
                        fixed_width = true;
                        width = 14;
                        }
                        : text_part {
                        key = "device";
                        width = 50;
                        }
                }
                : concatenation {
                        : text_part {
                        label = "Port: ";
                        width = 6;
                        }
                        : text_part {
                        key = "port";
                        width = 50;
                        }
                }
    }
    : boxed_row {
                label = "Configuration File";
            : column {
                    : text {
                            label = "Complete (PC2)";
                alignment = centered;
                    }
            : row {
                        : button {
                                label = "S&ave...";
                                key = "savepc2";
                        }
                        : button {
                                label = "&Replace...";
                                key = "loadpc2";
                        }
            }
            }
        spacer_0;
        : column {
                    : text {
                            label = "Partial (PCP - R12/R13)";
                alignment = centered;
                    }
            : row {
                        : button {
                                label = "&Save...";
                                key = "sfile";
                        }
                        : button {
                                label = "&Merge...";
                                key = "ffile";
                        }
            }
        }
    }
    : boxed_row {
                label = "Device Specific Configuration";
                : text_part {
                        label = "Device Requirements: ";
                        width = 35;
                }
                : button {
                        label = "Sh&ow...";
                        key = "showreq";
                        is_enabled = false;
                }
                : button {
                        label = "&Change...";
                        key = "cfgreq";
                        is_enabled = false;
                }
    }
    ok_cancel_help_errtile;
}

acad_plferr : dialog {
    label = "Error Information On File Defaults";
    : list_box {
        width = 62;
        height = 8;
        key = "listbox";
    }
    : row {
        spacer_0;
        : row {
            fixed_width = true;
            : button {
                key = "save";
                label = "&Create Error File";
            }
            : spacer {
                width = 2;
            }
            ok_only;
        }
        spacer_0;
    }
    errtile;
}

acad_rotor : dialog {
    label = "Plot Rotation and Origin";
    : boxed_radio_row {
        label = "Plot Rotation";
        : radio_button {
            label = "&0";
            key = "0";
        }
        : radio_button {
            label = "&90";
            key = "90";
        }
        : radio_button {
            label = "&180";
            key = "180";
        }
        : radio_button {
            label = "&270";
            key = "270";
        }
    }
    : boxed_row {
        label = "Plot Origin";
        : edit_box {
            label = "&X Origin:";
            key = "originx";
            edit_width = 10;
        }
        : edit_box {
            label = "&Y Origin:";
            key = "originy";
            edit_width = 10;
        }
    }
    spacer;
    ok_cancel_err;
}


acad_dwgmod : dialog {
   label = "Drawing Modification";
   initial_focus = "save";
   : column {
       : text {
           label = "The current drawing has been changed.";
           alignment = centered;
       }
       : row {
           : button {
               label = "&Save Changes...";
               is_default = true;
               key = "save";
           }
           : button {
               label = "&Discard Changes";
               key = "discard";
           }
           : button {
               label = "&Cancel Command";
               is_cancel = true;
               key = "cancel";
           }
       }
   }
}

acad_newdwg : dialog {
    label = "Create New Drawing";
    initial_focus = "fedit";
    : boxed_column {
        : row {
            : button {
                label = "&Prototype...";
                key = "template";
            }
            : edit32_box {
                key = "protype";
            }
        }
        : column {
            : toggle {
                label = "&No Prototype";
                key = "dflts";
                value = "0";
            }
            : toggle {
                label = "&Retain as Default";
                key = "retain";
                value = "0";
            }
        }
    }
    spacer_1;
    : column {
        : row {
            : button {
                label = "New &Drawing Name...";
                key = "fdialog";
            }
            : edit32_box {
                key = "fedit";
                allow_accept = true;
            }
        }
    }
    ok_cancel_err;
}

// acad_opendwg is used by the OPEN command and is the same as
// acad_dlfname except it has additional toggles:
//          Select Initial View and Read Only Mode
// and the title is fixed in the definition.

acad_opendwg : dialog {
    label = "Open Drawing";
    initial_focus = "fedit";
    files_topdf;
    : row {
        : list_box {
            label = "Di&rectories:";
            key = "dirbox";
            width = 15;
        }
        : list_box {
            label = "F&iles:";
            key = "filebox";
            width = 15;
            allow_accept = true;
        }
        : column {
            : image {          // Drawing icon image will go here
                key = "icon";
                color = dialog_background;    // Invisible
                height = 6;
                aspect_ratio = 1.4;
                fixed_height = true;
                fixed_width = true;
            }
            : button {
                label = "&Type it";
                key = "typeit";
            }
            : button {
                label = "&Default";
                key = "default";
            }
        }
    }
    : row {
        : toggle {
            label = "&Select Initial View";
            key = "vselect";
            value = "0";
        }
        : toggle  {
            label = "Read &Only Mode";
            key = "read";
            value = "0";
        }
    }
    files_bottomdf;
}

acad_reinit : dialog {
    label = "Re-initialization";
    : boxed_column {
        label = "I/O Port Initialization";
        : row {
            : toggle {
                label = "&Digitizer";
                key = "1";
                value = "0";
            }
        }
    }
    : boxed_column {
        label = "Device and File Initialization";
        : toggle {
            label = "Di&gitizer";
            key = "g";
            value = "0";
        }
        : toggle {
            label = "PGP &File";
            key = "p";
            value = "0";
        }
    }
    ok_cancel;
}

acad_wait : dialog {
   key = "title";
   initial_focus = "accept";
   width = 25;
   spacer;
   : column {
       fixed_width = true;
       fixed_height = true;
       alignment = centered;
       : button {
           key = "accept";
           label = "&Continue";
           is_cancel = true;
       }
    }
    spacer;
}

fh_open : dialog {
    label = "Boundary Definition Error";
    initial_focus = "accept";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "Boundary is not closed.";
        }
    }
    spacer_1;
    ok_look;
    spacer;
}


fh_outside : dialog {
    aspect_ratio = 0;
    label = "Boundary Definition Error";
    initial_focus = "accept";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "Point is outside of boundary.";
        }
    }
    spacer_1;
    ok_look;
    spacer;
}


fh_on : dialog {
    aspect_ratio = 0;
    label = "Boundary Definition Error";
    initial_focus = "accept";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "Point is directly on an object.";
        }
    }
    spacer_1;
    ok_look;
    spacer;
}


fh_dup : dialog {
    aspect_ratio = 0;
    label = "Boundary Definition Error";
    initial_focus = "accept";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "Boundary duplicates an existing boundary.";
        }
    }
    spacer_1;
    ok_only;
    spacer;
}


fh_awful : dialog {
    aspect_ratio = 0;
    label = "Boundary Definition Error";
    initial_focus = "accept";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "Valid hatch boundary not found.";
        }
    }
    spacer_1;
    ok_only;
    spacer;
}


fh_nohatch : dialog {
    aspect_ratio = 0;
    label = "Hatching Error";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "No hatching was created";
        }
    }
    spacer_1;
    ok_only;
    spacer;
}


fh_toodense : dialog {
    aspect_ratio = 0;
    label = "Hatching Error";
    width = 30;
    spacer;
    : column {
        fixed_height = true;
        alignment = centered;
        : text {
            alignment = centered;
            label = "Hatch spacing too dense, or dash size too small.";
        }
    }
    spacer_1;
    ok_only;
    spacer;
}


falert : dialog {
    label = "ALERT";
    spacer;
    : text {
        key = "alert_text_1";
        horizontal_alignment = centered;
        width = 50;
    }
    : text {
        key = "alert_text_2";
        horizontal_alignment = centered;
        width = 50;
    }
    spacer_1;
    ok_only;
    spacer;
}

big_button :button{
    fixed_width = true;
    width = 25;
}


look_button : retirement_button {
    label           = "&Look at it";
    key             = "look";
    vertical_alignment = centered;
}


ok_look : column {
    : row {
        fixed_width = true;
        alignment = centered;
        : ok_button { is_cancel = true; }
        : spacer { width = 2; }
        look_button;
    }
}


next_button : button {
        label           = "&Next";
        key             = "next";
        fixed_width     = true;
        width           = 9;
        vertical_alignment = centered;
        horizontal_alignment = centered;
}


prev_button : button {
        label           = "&Previous";
        key             = "previous";
        fixed_width     = true;
        width           = 9;
        vertical_alignment = centered;
        horizontal_alignment = centered;
}


pick_cancel : column {
    : row {
        fixed_width = true;
        alignment = centered;
        : button {
            label = "&Pick Points <";
            key = "accept";
            is_default = true;
        }
        : spacer { width = 1; }
        cancel_button;
        : spacer { width = 1; }
        help_button;
    }
}

//
// support functions
//

isopwidth : popup_list {
    label = "&ISO Pen Width:";
    list = " \n0.13 mm\n0.18 mm\n0.25 mm\n0.35 mm\n0.5 mm\n0.7 mm\n1.0 mm\n1.4 mm\n2.0 mm\n";
    popup_height = 3;
    key = "isopenwidth";
    edit_width = 12;
}

text_35 : text {
    width = 35;
}


acad_group : dialog {
    label = "Object Grouping";
    initial_focus = "name";
    : column {
        : concatenation {
            : text_part {
                label = "Grou&p Name";
                width = 32;
            }
            : text_part {
                label = "Selectable";
            }
        }
        : list_box {
            tabs = "36";
            key = "grp_list";
            width = 48;
            height = 5;
            tab_truncate = true;
        }
    }
    : boxed_column {
        label = "Group Identification";
        : column {
            : row {
                : text_part {
                    label = "&Group Name:";
                    width = 13;
                }
                : edit_box {
                    key = "name";
                    edit_width = 32;
                    edit_limit = 217;
                }
            }
            : row {
                : text_part {
                    label = "&Description:";
                    width = 13;
                }
                : edit_box {
                    key = "desc";
                    edit_width = 32;
                    edit_limit = 448;
                }
            }
        }
        : row {
            children_fixed_width = true;
            : button {
                label = "&Find Name <";
                key = "find";
            }
            : button {
                label = "&Highlight <";
                key = "h_light";
            }
            : toggle {
                label = "&Include Unnamed";
                key = "anon";
            }
        }
    }
    : boxed_column {
        label = "Create Group";
        : row {
            alignment = centered;
            : button {
                label = "&New <";
                key = "add_new";
            }
            spacer_1;
            : toggle {
                label = "&Selectable";
                value = "1";
                key = "select";
            }
            : toggle {
                label = "&Unnamed";
                value = "0";
                key = "unnamed";
            }
        }
    }
    : boxed_column {
        label = "Change Group";
        key = "chg_column";
        : row {
            : button {
                label = "&Remove <";
                key = "remove";
            }
            : button {
                label = "&Add <";
                key = "add";
            }
            : button {
                label = "Rena&me";
                key = "rename";
            }
            : button {
                label = "Re-&Order...";
                key = "order";
            }
        }
        : row {
            : button {
                label = "&Description";
                key = "chg_desc";
            }
            : button {
                label = "&Explode";
                key = "explode";
            }
            : button {
                label = "Se&lectable";
                key = "chg_select";
            }
        }
    }
    ok_cancel_help_errtile;
}


acad_grp_order : dialog {
    label = "Order Group";
    : column {
        : text {
            label = "&Group Name";
        }
        : list_box {
            key = "grp_list";
            width = 45;
            height = 6;
        }
    }
    : boxed_column {
        label = "&Description";
        : text {
            key = "desc";
            width = 43;
        }
    }
    : boxed_column {
        children_fixed_width = true;
        : row {
            : text {
                key = "remove";
                width = 50;
                horizontal_alignment = right;
            }
            : edit_box {
                edit_width = 10;
                key = "from";
                horizontal_alignment = left;
            }
        }
        : row {
            : text {
                key = "replace";
                width = 50;
                horizontal_alignment = right;
            }
            : edit_box {
                edit_width = 10;
                key = "to";
                horizontal_alignment = left;
            }
        }
        : row {
            : text {
                key = "qtext";
                width = 50;
                horizontal_alignment = right;
            }
            : edit_box {
                edit_width = 10;
                key = "quantity";
                horizontal_alignment = left;
            }
        }
    }
    : row {
        key = "action";
        : button {
            label = "&Re-Order";
            key = "reorder";
        }
        : button {
            label = "&Highlight";
            key = "hlight";
        }
        : button {
            label = "Reverse &Order";
            key = "reverse";
        }
    }
    ok_cancel_help_errtile;
}

acad_grp_member : dialog {
    label = "Group Member List";
    initial_focus = "accept";
    : list_box {
        key = "listbox";
        width = 35;
        height = 8;
        fixed_width = true;
    }
    spacer;
    : ok_button {
        is_cancel = true;
    }
}

acad_msg : dialog {
   label = "Object Grouping";
   width = 30;
   : row {
       next_button;
       prev_button;
   }
   spacer_1;
   : ok_button {
       is_cancel = true;
   }
   errtile;
}

ddfcf : dialog {
  label        = "Geometric Tolerance";
  :row {
      : boxed_column {
          label = "Sym";
          children_fixed_height = true;
          children_fixed_width = true;
          : text {
             label = "";
          }
          spacer_1;
          : fcf_ibut {
             key         = "sym11";
          }
          spacer_1;
          : fcf_ibut {
             key         = "sym21";
          }
      }
      : boxed_column {
          label = "Tolerance 1";
          children_fixed_height = true;
          children_fixed_width = true;
          : text {
              label = "Dia  Value    MC";
          }
          spacer_1;
          : row {
              : fcf_ibut {
                  key         = "sym12";
              }
              : fcf_ebox {
                  key         = "ebox11";
              }
              : fcf_ibut {
                  key         = "sym13";
              }
          }
          spacer_1;
          : row {
              : fcf_ibut {
                  key         = "sym22";
              }
              : fcf_ebox {
                  key         = "ebox21";
              }
              : fcf_ibut {
                  key         = "sym23";
              }
          }
      }

      : boxed_column {
          label = "Tolerance 2";
          children_fixed_height = true;
          children_fixed_width = true;
          : text {
              label = "Dia  Value    MC";
          }
          spacer_1;
          : row {
               : fcf_ibut {
                   key         = "sym14";
               }
               : fcf_ebox {
                   key         = "ebox12";
               }
               : fcf_ibut {
                   key         = "sym15";
               }
          }
          spacer_1;
          : row {
              : fcf_ibut {
                  key         = "sym24";
              }
              : fcf_ebox {
                  key         = "ebox22";
              }
              : fcf_ibut {
                  key         = "sym25";
              }
          }
      }

      : boxed_column {
          label = "Datum 1";
          children_fixed_height = true;
          children_fixed_width = true;
          : text {
              label = "Datum MC";
          }
          spacer_1;
          : row {
              : fcf_ebox1 {
                  key         = "ebox13";
              }
              : fcf_ibut {
                  key         = "sym16";
              }
          }
          spacer_1;
          : row {
              : fcf_ebox1 {
                  key         = "ebox23";
              }
              : fcf_ibut {
                  key         = "sym26";
              }
          }
      }

      : boxed_column {
          label = "Datum 2";
          children_fixed_height = true;
          children_fixed_width = true;
          : text {
              label = "Datum MC";
          }
          spacer_1;
          : row {
              : fcf_ebox1 {
                  key         = "ebox14";
              }
              : fcf_ibut {
                  key         = "sym17";
              }
          }
          spacer_1;
          : row {
              : fcf_ebox1 {
                  key         = "ebox24";
              }
              : fcf_ibut {
                  key         = "sym27";
              }
          }
      }

      : boxed_column {
          label = "Datum 3";
          children_fixed_height = true;
          children_fixed_width = true;
          : text {
              label = "Datum MC";
          }
          spacer_1;
          : row {
              : fcf_ebox1 {
                  key         = "ebox15";
              }
              : fcf_ibut {
                  key         = "sym18";
              }
          }
          spacer_1;
          : row {
              : fcf_ebox1 {
                  key         = "ebox25";
              }
              : fcf_ibut {
                  key         = "sym28";
              }
          }
      }
  }
  spacer_1;
  : column {
      children_fixed_height = true;
      : row {
          fixed_width = true;
          : text {
               label = "Height";
          }
          : fcf_ebox {
              key         = "ebox31";
          }
          : text {
               label = "Projected Tolerance Zone";
          }
          : fcf_ibut {
              key         = "sym31";
          }
      }
      spacer_1;
      : row {
          fixed_width = true;
          : text {
               label = "Datum Identifier";
          }
          : fcf_ebox {
              key         = "ebox32";
          }
      }
  }
  spacer_1;
  ok_cancel_help_errtile;
}

ddfcfsub: dialog {
  label        = "Symbol";
  : column {
   : row {
      : fcf_ibut1 {
        key          = "gdtj";      /* Position */
      }
      : fcf_ibut1 {
        key          = "gdtr";      /* Circularity */
      }
      : fcf_ibut1 {
        key          = "gdti";      /* Symmetry */
      }
      : fcf_ibut1 {
        key          = "gdtf";      /* Parallel */
      }
      : fcf_ibut1 {
        key          = "gdtb";       /* Perpendicular */
      }
    }
    : row {
      : fcf_ibut1 {
        key          = "gdta";      /* Angular */
      }
      : fcf_ibut1 {
        key          = "gdtg";      /* Cylindricity */
      }
      : fcf_ibut1 {
        key          = "gdtc";       /* Flatness */
      }
      : fcf_ibut1 {
        key          = "gdte";      /* Circularity */
      }
      : fcf_ibut1 {
        key          = "gdtu";      /* Straightness    */
      }
    }
    : row {
      : fcf_ibut1 {
        key          = "gdtd";      /* Profile of a surface */
      }
      : fcf_ibut1 {
        key          = "gdtk";      /* Line Profile */
      }
      : fcf_ibut1 {
        key          = "gdth";      /* Circular Runout */
      }
      : fcf_ibut1 {
        key          = "gdtt";      /* Total Runout    */
      }
      : fcf_ibut1 {
        key          = "gdt-";      /* Nothing */
      }
    }
  }
  spacer_1;
  ok_cancel_help_errtile;
}

ddfcfsub1: dialog {
  label        = "Material Condition";
  : row {
      : fcf_ibut1 {
       key          = "gdtm";   /* Maximum */
      }
      : fcf_ibut1 {
       key          = "gdtl";   /* Least */
      }
      : fcf_ibut1 {
       key          = "gdts";   /* Regardless of feature size */
      }
      : fcf_ibut1 {
       key          = "gdt-";   /* Nothing */
      }
  }
  spacer_1;
  ok_cancel_help_errtile;
}

// mstyle - main dialogue:

mstyle : dialog {
    label = "Multiline Styles";
    children_alignment = centered;
    :boxed_row {
        label = "Multiline Style";
        width = 42; fixed_width = true;
        :column {
            : row {
                : text_part {
                    label = "Current:";
                    width = 13;
                }
                : popup_list {
                    key = "current";
                    edit_width = 31;
                    edit_limit = 31;
                }
            }
            : row {
                : text_part {
                    label = "Name:";
                    width = 13;
                }
                : edit_box {
                    key = "name";
                    edit_width = 31;
                    edit_limit = 31;
                }
            }
            : row {
                : text_part {
                    label = "Description:";
                    width = 13;
                }
                : edit_box {
                    key = "description";
                    edit_width = 31;
                    edit_limit = 255;
                }
            }
            :row {
                :button {
                    label = "Load...";
                    key = "load";
                }
                :button {
                    label = "Save...";
                    key = "save";
                }
                :button {
                    label = "Add";
                    key = "addStyle";
                }
                :button {
                    label = "Rename";
                    key = "rename";
                }
            }
        }
    }
    spacer_1;
    :image {
        key = "mline_image";
        height = 4;
        width = 45;
        alignment = centered;
        fixed_width = true;
    }
    :button {
        fixed_width = true;
        width = 32;
        height = 2;
        label = "Element Properties ...";
        key = "elements";
    }
    :button {
        fixed_width = true;
        width = 32;
        height = 2;
        label = "Multiline Properties ...";
        key = "properties";
    }
    spacer_1;
    ok_cancel_help_errtile;
}

//==================================================================
// mstyle - elements dialogue:

estyle : dialog {
     label = "Element Properties";
     : concatenation {
         : text_part {
              label = "Elements:";
              width = 10;
              fixed_width = true;
         }
         : text_part {
              label = "Offset";
              width = 8;
              fixed_width = true;
         }
         : text_part {
              label = "Color";
              width = 8;
              fixed_width = true;
         }
         : text_part {
              label = "Ltype";
              fixed_width = true;
         }
     }
     : row {
       : spacer {
         width = 9;
       }
       : list_box {
         width = 40;
         height = 4;
         key = "list_of_lines";
         tabs = "8 16";
       }
     }
     : row {
          fixed_width = true;
          : button {
               fixed_width = true;
               label = "Add";
               key = "addLine";
          }
          : button {
               fixed_width = true;
               label = "Delete";
               key = "delLine";
          }
          : spacer { width = 3; }
          : edit_box {
              fixed_width = true;
              label = "Offset";
              key = "offSet";
              value = "0.00";
              edit_width = 6; edit_limit = 6;
          }
     }
     : row {
          fixed_width = true;
          : button {
              fixed_width = true;
              width = 12;
              label = "Color...";
              key = "lineColDialog";
           }
           : image_button {
              fixed_width = true;
              key = "lineColSwash";
              height = 2; width = 5;
           }
           : edit_box {
              fixed_width = true;
              key = "lineColEdit";
              value = "BYLAYER";
              edit_width = 11;
              edit_limit = 11;
           }
     }

     : row {
          fixed_width = true;
          : button {
               fixed_width = true;
               width = 12;
               label = "Linetype...";
               key = "setLineStyle";
          }
          : spacer {
              fixed_width = true;
               width = 6;
          }
          : text {
              fixed_width = true;
               key = "ltype_name";
               value = "BYLAYER";
               width = 11;
          }
     }
     ok_cancel_help;
     errtile;
}

//==================================================================
// mstyle - styles list dialogue:

sstyle : dialog {
     label = "Load Multiline Styles";
     :row {
         :button {
            label = "File ...";
            key = "mstyleFileBut";
         }
         : text {
            key = "mstyleFileLabel";
            width = 31;
         }
      }
     : list_box {
         width = 40;
         height = 4;
         key = "list_of_styles";
       }
    ok_cancel_help_errtile;
}

//==================================================================
// mstyle - properties dialogue:

pstyle : dialog {
  label = "Multiline Properties";
  : row {
    fixed_width = true;
    : toggle {
      label = "Display joints";
      key = "dispJoint";
    }
  }
  : boxed_column {
    label = "Caps";
    : row {
      fixed_width = true;
      : spacer {
        width = 12;
      }
      : text {
        label = "Start";
        width = 9;
      }
      : text {
        label = "End";
      }
    }
    : row {
      fixed_width = true;
      : text {
        label = "Line";
        width = 12;
      }
      : toggle {
        key   = "scapline";
      }
      : spacer {
        width = 5;
      }
      : toggle {
        key   = "ecapline";
      }
    }
    : row {
      fixed_width = true;
      : text {
        label = "Outer arc";
        width = 12;
      }
      : toggle {
        key   = "scapoarc";
      }
      : spacer {
        width = 5;
      }
      : toggle {
        key   = "ecapoarc";
      }
    }
    : row {
      fixed_width = true;
      : text {
        label = "Inner arcs";
        width = 12;
      }
      : toggle {
        key   = "scapiarc";
      }
      : spacer {
        width = 5;
      }
      : toggle {
        key   = "ecapiarc";
      }
    }
    : row {
      fixed_width = true;
      : text {
        label = "Angle";
        width = 12;
      }
      : edit_box {
        key   = "scapangle";
        edit_limit = 10;
        edit_width = 10;
        fixed_width = true;
        value = "90.0";
      }
      : spacer {
        width = 2;
      }
      : edit_box {
        key   = "ecapangle";
        edit_limit = 10;
        edit_width = 10; fixed_width = true;
        value = "90.0";
      }
    }

  }
  : boxed_row {
    label = "Fill";
    : toggle {
      key = "fillOn";
      label = "On";
    }
    : spacer { width = 2; }
    : button {
      label = "Color...";
      key = fillColor;
    }
    : image_button {
      key = "fillColSwash";
      height = 2; width = 5; fixed_width = true;
    }
    : edit_box {
      key = "filColEdit";
      edit_limit = 11;
      edit_width = 11;
      fixed_width = true;
    }
  }
  ok_cancel_help;

  errtile;
}

//==================================================================
// mledit.dcl
//
//
// Prototype layout for mline edit tools.


//==================================================================
// mledit - main dialogue:

mledit : dialog {

  label = "Multiline Edit Tools";
  : row {
        : image_button {
           key = "medit_cc";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_ct";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_cj";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_cs";
           width = 7;
           height = 3;
           fixed_width = true;
        }
   }
   : row {
        : image_button {
           key = "medit_oc";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_ot";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_av";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_ca";
           width = 7;
           height = 3;
           fixed_width = true;
        }
   }
   : row {
        : image_button {
           key = "medit_mc";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_mt";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_dv";
           width = 7;
           height = 3;
           fixed_width = true;
        }
        : image_button {
           key = "medit_wa";
           width = 7;
           height = 3;
           fixed_width = true;
        }
   }
   ok_cancel_help;
   errtile;
}

//==================================================================
// LispEd.dcl
//
//
// Prototype layout for single-line MText editor.


//==================================================================
// LispEd - main dialogue:

LispEd : dialog {
  label = "Edit MText";
  initial_focus = "text";
  : edit_box {
    label = "Contents:";
    key = "contents";
    edit_width = 40;
    edit_limit = 100;
    allow_accept = true;
  }
  spacer;
  : column {
    : row {
      fixed_width = true;
      alignment = centered;
      ok_button;
      : spacer { width = 2; }
      cancel_button;
      : spacer { width = 2; }
      : retirement_button {
        label = "Full editor...";
        mnemonic = "F";
        key = "mtexted";
      }
    }
  }
}

block_equal : dialog {
  key = "block_equal";
  label = "Substitute Block Name";
    : text {
      label = "The file you have chosen can not be used as a block name";
      alignment = centered;
    }
    : edit_box {
        label = "New Block Name:";
        key = "blockname";
        edit_width = 31;   /* Leave the edit window at pre-ESN length.  */
        edit_limit = 2040; /* Allow 255 MIF sequences for new symbol name. */
        alignment = centered;
        allow_accept = true;
    }
    ok_cancel_err;

}