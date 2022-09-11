import 'package:aphaa_app/model/ServiceTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestResultItem extends StatelessWidget {
  ServiceTest? serviceTest;

  TestResultItem({this.serviceTest});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
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
                    text: AppLocalizations.of(context)!.examination_date,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  ${serviceTest?.serviceDate?.split(" ").first}  ',
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
                    text: AppLocalizations.of(context)!.examination_type,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '   ${serviceTest?.serviceType}   ',
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
                        text: '   ${serviceTest?.clinicName}   ',
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

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  // showModalBottomSheet(
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (context) => PrintMedicalRecipesButtomSheet(),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.r,0,16.r,10.r),
                  child: SvgPicture.asset(
                    'assets/images/Group40855.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
