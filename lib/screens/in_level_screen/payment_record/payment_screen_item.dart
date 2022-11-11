import 'package:aphaa_app/model/patent_payment_record/PatientPaymentRecord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentScreenItem extends StatelessWidget {
  PatientPaymentRecord patientPaymentRecord;
  PaymentScreenItem(this.patientPaymentRecord);

  @override
  Widget build(BuildContext context) {
    return Stack(
        // fit: StackFit.expand,
        children: [
          FittedBox(
            child: Container(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                text: '  ${patientPaymentRecord.invDate}  ',
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
                                text: '  ${patientPaymentRecord.invNo}  ',
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
                                text: '  ${patientPaymentRecord.invType}  ',
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
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                      //   child: Text.rich(
                      //     TextSpan(
                      //       text: AppLocalizations.of(context)!.the_doctor,
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black,
                      //           fontSize: 12.sp,
                      //           fontFamily: 'Tajawal'),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: ' محمود أحمد  ',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w700,
                      //               color: Colors.black45,
                      //               fontSize: 12.sp,
                      //               fontFamily: 'Tajawal'),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                      //   child: Text.rich(
                      //     TextSpan(
                      //       text: AppLocalizations.of(context)!.descraptipn,
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black,
                      //           fontSize: 12.sp,
                      //           fontFamily: 'Tajawal'),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: 'عرض زراعة أسنان',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w500,
                      //               color: Colors.black45,
                      //               fontSize: 12.sp,
                      //               fontFamily: 'Tajawal'),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

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
                                text: ' ${patientPaymentRecord.totalAmt} ',
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
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      topRight: Radius.circular(40.r))),
              child: Text(
                "مقيول",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Tajawal', fontSize: 13.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
  }
}
