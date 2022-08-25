import 'package:aphaa_app/screens/in_level_screen/vital_signs/vital_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VitalItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => VitalButtomSheet(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Color(0xff0E4C8F), width: 0.5.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.date_of_visit,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  20.8.2022  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.visit_time,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  11:00 a.m  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.the_clinic,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  أسنان  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.the_doctor,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' محمود أحمد  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.notes,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  ملاحظات ...  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
