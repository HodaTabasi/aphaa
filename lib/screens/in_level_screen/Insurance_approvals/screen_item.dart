import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'insurance_buttom_sgeet.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InsuranceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => InsuranceButtomSheet(),
        );
      },
      child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width - 50,
              height: 90.h,
              padding: EdgeInsets.only(left: 16.r, right: 16.r, top: 12.r, bottom: 10.r),
              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              // margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Color(0xff0E4C8F), width: 0.5.r),
              ),
              child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.medical_file_number,
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
                          '#2031456',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.the_request,
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: Text(
                            'هذا النص افتراضي ، هذا النص افتراضي ، هذا النص',
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
              // right: 0,
              top: 0,
              left: 0,
              // bottom: 100,
              child: Container(
                width: 80.w,
                height: 35.h,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                decoration: BoxDecoration(
                    color: Color(0xffEE1131),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(20.r))),
                child: Text(
                  "مرفوض",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Tajawal', fontSize: 13.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
    );
  }
}
