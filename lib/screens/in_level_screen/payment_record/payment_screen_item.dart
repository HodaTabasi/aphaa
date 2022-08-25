import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentScreenItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width - 50,
            height: 160.h,
            padding: EdgeInsets.only(left: 16.r, right: 16.r, top: 12.r, bottom: 10.r),
            margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            // margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
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
                          text: AppLocalizations.of(context)!.payment_data ,
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
                          text: AppLocalizations.of(context)!.payment_time,
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
                          text: AppLocalizations.of(context)!.descraptipn,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'عرض زراعة أسنان',
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
                          text: AppLocalizations.of(context)!.price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '500',
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
          Positioned(
            // right: 0,
            bottom: 0,
            left: 0,
            // bottom: 100,
            child: Container(
              width: 80.sp,
              height: 35.sp,
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              decoration: BoxDecoration(
                  color: Color(0xffEE1131),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      topRight: Radius.circular(40.r))),
              child: Text(
                "مرفوض",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Tajawal', fontSize: 13.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
  }
}
