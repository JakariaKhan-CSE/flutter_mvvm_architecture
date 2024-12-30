import 'package:flutter/material.dart';

class Utils {
  static snackBarMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
