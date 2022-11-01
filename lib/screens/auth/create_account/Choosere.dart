import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:flutter/material.dart';

import 'btn_layout.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Choosere extends StatefulWidget {

  @override
  _ChoosereState createState() => _ChoosereState();
}

class _ChoosereState extends State<Choosere> {
  var _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          Flexible(
              child: BtnLayout(
                title: AppLocalizations.of(context)!.citizen,
                value: 0,
                groupValue: _value,
                onChanged: (value) => setState(() {
                  _value = value;
                  NewAccountGetxController.to.changeIsCitizen(true);
                  NewAccountGetxController.to.pID.text = "";
                }),
              )),
          Flexible(
              child: BtnLayout(
                  title: AppLocalizations.of(context)!.resident,
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) => setState(() {
                    _value = value;
                    NewAccountGetxController.to.changeIsCitizen(false);
                    NewAccountGetxController.to.pID.text = "";
                  } ))),
        ],
      ),
    );
  }
}
