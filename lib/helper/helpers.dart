import 'package:aphaa_app/general/readPdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get/change_name_getx_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin Helpers1 {
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

  void showSnackBarAction(BuildContext context,
      {required String message, bool error = false,path, VoidCallback? onPressed }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        dismissDirection: DismissDirection.horizontal,
        action: SnackBarAction(
          label: AppLocalizations.of(context)!.open,
          textColor: Colors.white,
          // onPressed: onPressed ?? (){},
          onPressed: () {
            print(path);
            ChangeGetxController.to.filePath = path;

            Navigator.pushNamed(context, ReadPdf.routeName);
            // Get.to(ReadPdf());
          },
        ),
      ),
    );
  }

  // void showSnackBar2(BuildContext context,
  //     {required String message, bool error = false}) {
  //   Flushbar(
  //     flushbarPosition: FlushbarPosition.TOP,
  //     // title: "message",
  //     message: message,
  //     margin: EdgeInsets.all(8),
  //     backgroundColor: error ? Colors.red : Colors.green,
  //     dismissDirection: FlushbarDismissDirection.HORIZONTAL,
  //     forwardAnimationCurve: Curves.elasticOut,
  //     icon: IconButton(
  //         onPressed: () => Navigator.pop(context),
  //         icon: Icon(
  //           Icons.clear,
  //           color: Colors.white,
  //           size: 20,
  //         )),
  //   )..show(context);
  //
  //   // ScaffoldMessenger.of(context).showSnackBar(
  //   //   SnackBar(
  //   //     content: Text(message,style: TextStyle(fontFamily: "Tajawal")),
  //   //     backgroundColor: error ? Colors.red : Colors.green,
  //   //     dismissDirection: DismissDirection.horizontal,
  //   //     behavior: SnackBarBehavior.floating,
  //   //     margin: EdgeInsets.all(8),
  //   //   ),
  //   // );
  // }

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
