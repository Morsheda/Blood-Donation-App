import 'package:flutter/material.dart';

class GlobalSnackbar {
  final String msg;

  const GlobalSnackbar({
    @required this.msg,
  });
  static show(
    BuildContext context,
    String msg,
  ) {
    Scaffold.of(context).showSnackBar(SnackBar(
      elevation: 5.0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.teal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
          textColor: Colors.white, label: "Ok", onPressed: () {}),
    ));
  }
}
