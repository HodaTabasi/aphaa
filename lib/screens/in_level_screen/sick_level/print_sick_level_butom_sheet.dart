import 'package:aphaa_app/general/download_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrintButtomSheetSickLevel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.r),

      child: Column(
        children: [
          Divider(
            color: Colors.black,
            thickness: 10.h,
            indent: 100.w,
            endIndent: 100.w,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 36.r),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.date_of_visit,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(16.0.r),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2.w,
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color(0xffF7F8FB),
                                  borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(16.0.w),
                                child: Text(
                                  '20.08.2022',
                                  style:  TextStyle(
                                    color: Color(0xff2D2D2D),
                                    fontSize: 14.sp,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        AppLocalizations.of(context)!.descraptipn,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(16.0.r),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2.w,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF7F8FB),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(16.0.r),
                              child: Text(
                                'إجازة مرضية لجهاد',
                                style:  TextStyle(
                                  color: Color(0xff2D2D2D),
                                  fontSize: 14.sp,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.physician,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(16.0.r),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2.w,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF7F8FB),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(16.0.r),
                              child: Text(
                                'د. محمود أحمد',
                                style:  TextStyle(
                                  color: Color(0xff2D2D2D),
                                  fontSize: 14.sp,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        AppLocalizations.of(context)!.duration,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(16.0.r),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2.w,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF7F8FB),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(16.0.r),
                              child: Text(
                                '5 أيام فقط',
                                style:  TextStyle(
                                  color: Color(0xff2D2D2D),
                                  fontSize: 14.sp,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          downloadBtn(),
        ],
      ),
    );
  }
}
