import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/model/AvailableTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeAppoitmentItem extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged onChanged;
  AvailableTime? data;


  TimeAppoitmentItem({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,   this.data});

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: (){
        onChanged(value);
        NewAccountGetxController.to.consultNo = data!.consultSNo!;
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: isSelected ?Color(0xffF7F8FB):Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: isSelected ?Color(0xffF7F8FB):Color(0xff058638), width: 0.5.r),
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
            Text('${data?.consultTime}',
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
            Text('${data?.consultTime24}',
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal,
                )),

          ],
        ),
      ),
    );
  }
}

