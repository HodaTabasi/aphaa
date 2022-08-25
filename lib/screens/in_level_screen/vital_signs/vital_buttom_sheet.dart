import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/my_separator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VitalButtomSheet extends StatefulWidget {

  @override
  State<VitalButtomSheet> createState() => _VitalButtomSheetState();
}

class _VitalButtomSheetState extends State<VitalButtomSheet> {
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
          children: [
            Divider(
              color: Colors.black,
              thickness: 10.w,
              indent: 100.w,
              endIndent: 100.w,
            ),
            SizedBox(height: 15.h,),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/prasher.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(AppLocalizations.of(context)!.pressure,
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(16.0.r),
                      child: Text(
                        '140/100',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.r,vertical: 8.r),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/suger.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(AppLocalizations.of(context)!.diabetes,
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(16.0.r),
                      child: Text(
                        '140/100',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/higth.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(AppLocalizations.of(context)!.height,
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(16.0.r),
                      child: Text(
                        '140/100',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/wihtj.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(AppLocalizations.of(context)!.weight,
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(16.0.r),
                      child: Text(
                        '140/100',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Image.asset(
              "assets/images/image1.png",
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
