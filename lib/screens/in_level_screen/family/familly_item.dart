import 'package:aphaa_app/model/FamillyMember.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../drawer_screens/buttom_navication.dart';

class FamillyItem extends StatelessWidget {
  FamillyMember famillyMember;
  FamillyItem(this.famillyMember);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        print(famillyMember.medicFileNumber);
        SharedPrefController().setValuePCode(pCode: famillyMember.medicFileNumber!);
        print("dfsd ${SharedPrefController().getValueFor(key: "medicalId")}");
        Navigator.of(context)
            .pushNamedAndRemoveUntil(ButtomNavigations.routeName, (Route<dynamic> route) => false);
      },
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0E4C8F),width: 0.5.r),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.r),
                child:  SvgPicture.asset(
                    'assets/images/boy.svg',
                    semanticsLabel: 'Acme Logo'
                ),
              ),
               VerticalDivider(
                  width:2.w,
                  thickness:0.5.r,
                  color:Color(0xff0E4C8F)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Padding(
                      padding:  EdgeInsets.all(10.0.r),
                      child: Text(
                        AppLocalizations.of(context)!.file_No,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Padding(
                      padding:  EdgeInsets.all(10.0.r),
                      child: Text(
                        AppLocalizations.of(context)!.residency_number,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Padding(
                      padding:  EdgeInsets.all(10.0.r),
                      child: Text(
                        AppLocalizations.of(context)!.the_name,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Padding(
                      padding:  EdgeInsets.all(10.0.r),
                      child: Text(
                        famillyMember.medicFileNumber!,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        famillyMember.patientIDNumber!,
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Padding(
                      padding:  EdgeInsets.all(10.0.r),
                      child: Text(
                        famillyMember.patientName!,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              )

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Row(
              //     // crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'اسم التطعيم :',
              //         style: const TextStyle(
              //           color: Color(0xff2D2D2D),
              //           fontSize: 12,
              //           fontFamily: 'Tajawal',
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Text(
              //           'تطعيم ضد التسمم',
              //           style: const TextStyle(
              //             color: Color(0xff2D2D2D),
              //             fontSize: 12,
              //             fontFamily: 'Tajawal',
              //             fontWeight: FontWeight.normal,
              //           ),
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
