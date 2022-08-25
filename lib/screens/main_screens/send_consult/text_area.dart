import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(16.r),
        child: TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: Color(0xff0E4C8F), width: 0.5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: Color(0xff0E4C8F), width: 0.5.w),
              ),
              hintText: AppLocalizations.of(context)!.consult_note,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}