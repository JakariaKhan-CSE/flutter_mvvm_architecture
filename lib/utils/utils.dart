import 'package:flutter/material.dart';
// Utils main benifit is reduce repetative code, So that user call when need
class Utils {

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus(); // current TextField Unfocus
    FocusScope.of(context).requestFocus(nextFocus); // focus move to next field
  }

  static snackBarMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg),backgroundColor: Colors.deepPurple,));
  }
}
