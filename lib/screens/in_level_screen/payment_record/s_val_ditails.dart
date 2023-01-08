import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

TableRow SVDitails(desc,{val,context}){

    return TableRow(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Text(
            desc!,
            style:  TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 14.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Text(
            // ' ر.س ',
            '  ${val??0.0} ${ AppLocalizations.of(context)!.r_s}  ',
            style:  TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 14.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
