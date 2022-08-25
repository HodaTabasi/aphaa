import 'package:aphaa_app/general/my_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/download_btn.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrintMedicalRecipesButtomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(8.r),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.black,
              thickness: 10.r,
              indent: 100.w,
              endIndent: 100.w,
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.all(16.0.r),
              child: Text(
                '${AppLocalizations.of(context)!.invoice_number} #11235',
                style:  TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.medicament_name,
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(
                            width: MediaQuery.of(context).size.width/2.r,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffF7F8FB),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(16.0.r),
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

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.times_of_use,
                          style: TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.r,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffF7F8FB),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(16.0.r),
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

                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.how_to_use,
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.r,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffF7F8FB),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(16.0.r),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.price,
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       SizedBox(
                            width: MediaQuery.of(context).size.width/2.r,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffF7F8FB),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(16.0.r),
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

                      ],
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 20.h,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0.r,),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0.r),
              child: Text(
                AppLocalizations.of(context)!.total_bill,
                style:  TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 16.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.the_total,
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(
                      '100 ر.س',
                      style:  TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.tax,
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.sp),
                    child: Text(
                      '115 ر.س',
                      style:  TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.aggregate,
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(
                      '115 ر.س',
                      style:  TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
             SizedBox(height: 20.h,),
            downloadBtn(),
             SizedBox(height: 10.h,),
            // Image.asset(
            //   "assets/images/image1.png",
            //   fit: BoxFit.fitWidth,
            // ),
          ],
        ),
      ),
    );
  }
}
