import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../get/new_account_getx_controller.dart';

class MyTextFeild extends StatelessWidget {
  var controler;


  MyTextFeild(this.controler);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(16.r),
        child: TextFormField(
          controller: controler,
          maxLines: 1,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: Color(0xff0E4C8F), width: 0.5.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: Color(0xff0E4C8F), width: 0.5.r),
              ),
              hintText: NewAccountGetxController.to.isCitizen.value? " رقم الهوية الوطنية":AppLocalizations.of(context)!.residency_number,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
