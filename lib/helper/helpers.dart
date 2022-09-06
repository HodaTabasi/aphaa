import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: new Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey.shade300.withOpacity(0.3),
          color: Colors.white,
        ),
        // Container(margin: EdgeInsets.only(left: 7),child: Text("...")),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
