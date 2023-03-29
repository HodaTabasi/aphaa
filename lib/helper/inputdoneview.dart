import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../preferences/shared_pref_controller.dart';

class InputDoneView extends StatelessWidget {
  String? language = SharedPrefController()
      .getValueFor<String>(key: PrefKeys.lang.name) ==
      null
      ? 'ar'
      : SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: CupertinoColors.extraLightBackgroundGray,
        child: Align(
            alignment: language == 'ar'?Alignment.topLeft: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CupertinoButton(
                padding: const EdgeInsets.only(
                    right: 24.0, top: 8.0, bottom: 8.0,left: 24.0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child:  Text(language == 'ar'?"حسنا":"Done",
                    style: const TextStyle(color: CupertinoColors.activeBlue,fontFamily: 'Tajawal',fontSize: 18,fontWeight: FontWeight.w700)
                ),
              ),
            )
        )
    );
  }
}