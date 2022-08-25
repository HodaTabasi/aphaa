import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeAppoitmentItem extends StatefulWidget {

  @override
  State<TimeAppoitmentItem> createState() => _TimeAppoitmentItemState();
}

class _TimeAppoitmentItemState extends State<TimeAppoitmentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: Color(0xff058638), width: 0.5.r),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 10),
        //     blurRadius: 70,
        //     color: Colors.grey.withOpacity(0.23),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Text('10:00 pm',
              style:  TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              )),
          SizedBox(
            height: 8.h,
          ),
          Text(AppLocalizations.of(context)!.to,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              )),
          SizedBox(
            height: 8.h,
          ),
          Text('12:00 pm',
              style:  TextStyle(
                color: Colors.black,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              )),

        ],
      ),
    );
  }
}
