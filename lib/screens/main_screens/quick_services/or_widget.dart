
import 'package:flutter/material.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Color(0xFF0D2784),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50.r))),
      alignment: Alignment.center,
      child: Text(
        AppLocalizations.of(context)!.or,
        style:  TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
