import 'package:aphaa_app/screens/in_level_screen/sick_level/print_sick_level_butom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/my_separator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SickItem extends StatelessWidget {
  String sickDate;
  String sickName;
  String sickDocName;
  String leaveId;
  String repType;

  SickItem({required this.sickDate,required this.sickName, required this.sickDocName,required this.leaveId,required this.repType});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => PrintButtomSheetSickLevel(this.leaveId),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
              child: Text.rich(
                TextSpan(
                  text: AppLocalizations.of(context)!.date_of_visit,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontFamily: 'Tajawal'),
                  children: <TextSpan>[
                    TextSpan(
                      text: '  $sickDate  ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black45,
                          fontSize: 10.sp,
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
                  text: AppLocalizations.of(context)!.physician,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontFamily: 'Tajawal'),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' $sickDocName  ',
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
            // FittedBox(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //
            //     ],
            //   ),
            // ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0.h,),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding:  EdgeInsets.all(14.0.r),
              child: Center(
                child :Text(
                  ' $repType ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal'),
                ),
              ),
            ),
            // Padding(
            //   padding:  EdgeInsets.all(14.0.r),
            //   child: Center(
            //     child :Text.rich(
            //       TextSpan(
            //         text: AppLocalizations.of(context)!.sick_leave_for,
            //         style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             color: Colors.black,
            //             fontSize: 14.sp,
            //             fontFamily: 'Tajawal'),
            //         children: <TextSpan>[
            //           TextSpan(
            //             text: ' $sickName  ',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Color(0xff2D2D2D),
            //                 fontSize: 14.sp,
            //                 fontFamily: 'Tajawal'),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
