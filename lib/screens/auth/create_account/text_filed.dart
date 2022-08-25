import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyTextFeild extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(16.r),
        child: TextFormField(
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
              hintText: AppLocalizations.of(context)!.residency_number,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
