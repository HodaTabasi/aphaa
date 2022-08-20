
import 'package:flutter/material.dart';

mixin Helpers{
  showAlertDialog(BuildContext context) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text('done'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          Icons.check_circle,
          size: 35,
          color: Colors.green,
        ),
      ),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
