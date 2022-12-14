import 'package:aphaa_app/model/VitalSign/vitalSign.dart';
import 'package:aphaa_app/screens/in_level_screen/vital_signs/vital_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class VitalItem extends StatelessWidget {

  VitalSign vitalSign;
  VitalItem(this.vitalSign);


  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Color(0xff0E4C8F), width: 0.5.r),
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
                      text: AppLocalizations.of(context)!.date_of_visit,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  ${vitalSign.vitalSignDate!.split(" ").first}  ',
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
                // Padding(
                //   padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                //   child: Text.rich(
                //     TextSpan(
                //       text: AppLocalizations.of(context)!.visit_time,
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //           fontSize: 12.sp,
                //           fontFamily: 'Tajawal'),
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: '  ${vitalSign.vitalSignDate!.split(" ").last}  ',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.r,vertical: 8.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.the_clinic,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  ${vitalSign.clinic!.clinicName}  ',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.physician,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ${vitalSign.doctor!.doctorName}  ',
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.w,
                    height: 40.r,
                    child: Text(
                      AppLocalizations.of(context)!.notes,
                      style: TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.r),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width-150.w,
                      height: 40.r,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        '${vitalSign.notes}',
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // FittedBox(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
            //         child: Text.rich(
            //           TextSpan(
            //             text: AppLocalizations.of(context)!.notes,
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //                 fontSize: 10.sp,
            //                 fontFamily: 'Tajawal'),
            //             children: <TextSpan>[
            //               TextSpan(
            //                 text: '  ${vitalSign.notes}  ',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black45,
            //                     fontSize: 12.sp,
            //                     fontFamily: 'Tajawal'),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => VitalButtomSheet(vitalSign.vitalSignId!),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16,0,8,10),
                      child: SvgPicture.asset(
                        'assets/images/show.svg',
                        semanticsLabel: 'Acme Logo',
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
