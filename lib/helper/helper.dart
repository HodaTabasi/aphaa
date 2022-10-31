import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin Helpers {
  showAlertDialog(BuildContext context) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text('تـم الــإرســـال بـــنـــجــاح!',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.green)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );
    Widget continueButton1 = Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'شكرا لكم، تم استلام طلب الاستشارة وسوقف نقوم بالرد في اقرب وقت',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Tajawal', color: Colors.black45),
          textAlign: TextAlign.center,
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.check_circle,
          size: 60,
          color: Colors.green,
        ),
      ),
      actions: [
        continueButton,
        continueButton1,
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

  showRigectAlertDialog(BuildContext context) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text(AppLocalizations.of(context)!.this_date_is_not_available,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.black)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );
    Widget continueButton1 = Center(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.ok,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.error,
          size: 60,
          color: Colors.red,
        ),
      ),
      actions: [
        continueButton,
        continueButton1,
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
