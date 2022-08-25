import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class P_VaccinationItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width - 50,
            height: 140.h,
            padding: EdgeInsets.only(left: 26.r, right: 26.r, top: 16.r, bottom: 10.r),
            margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
            // margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.vaccination_name,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(10.0.r),
                        child: Text(
                          'تطعيم ضد التسمم',
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.vaccination_date,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(10.0.r),
                        child: Text(
                          '20.08.2022',
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            // bottom: 100,
            child: Container(
              width: 30.w,
              height: 35.h,
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(horizontal: 130.r,vertical: 8.r),
              decoration: BoxDecoration(
                  color: Color(0xff058638),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r))),
              child: Text("تم التلقيح",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Tajawal',
                    fontSize: 12.sp),
                textAlign: TextAlign.center,),
            ),
          ),
        ]);
  }
}
