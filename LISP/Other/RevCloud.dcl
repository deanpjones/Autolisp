//
//
//    REVCLOUD.DCL
//    Copyright © 1999 by Autodesk, Inc.
//
//    Your use of this software is governed by the terms and conditions of the
//    License Agreement you accepted prior to installation of this software.
//    Please note that pursuant to the License Agreement for this software,
//    "[c]opying of this computer program or its documentation except as
//    permitted by this License is copyright infringement under the laws of
//    your country.  If you copy this computer program without permission of
//    Autodesk, you are violating the law."
//
//    AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS.
//    AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
//    MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC.
//    DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
//    UNINTERRUPTED OR ERROR FREE.
//
//    Use, duplication, or disclosure by the U.S. Government is subject to
//    restrictions set forth in FAR 52.227-19 (Commercial Computer
//    Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
//    (Rights in Technical Data and Computer Software), as applicable.
//
//  ----------------------------------------------------------------

Revcloud : dialog {
  label = "Revcloud Options" ;
  spacer_1 ;
  : boxed_row {
    label = "Arc Style" ;
    : image_button {
      color = 0 ;
      aspect_ratio = 0.8 ;
      fixed_height = true ;
      fixed_width = true ;
      width = 11 ;
      key = "imgStyle" ;
    }
    : radio_column {
      spacer_0 ;
      : radio_button {
        key = "radNormal" ;
        label = "Normal" ;
        mnemonic = "N" ;
      }
      : radio_button {
        key = "radCalligraphy" ;
        label = "Calligraphy" ;
        mnemonic = "C" ;
      }
      spacer_0 ;
    }
    spacer_1 ;
  }
  spacer_1 ;
  : boxed_row {
    label = "Arc Chord Length" ;
    : image {
      aspect_ratio = 0.8 ;
      color = 0 ;
      fixed_width = true ;
      key = "imgLength" ;
      width = 11 ;
    }
    : column {
      : edit_box {
        key = "edtLength" ;
      }
      : button {
        fixed_width = true ;
        key = "btnPick" ;
        label = "Pick <" ;
        mnemonic = "P" ;
        width = 4 ;
      }
    }
  }
  spacer_1 ;
  ok_cancel_help_errtile ;
}
