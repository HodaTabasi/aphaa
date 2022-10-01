import 'package:aphaa_app/general/download_btn.dart';
import 'package:aphaa_app/model/SickLeaves/LeaveDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../api/controllers/hospital_controller.dart';

class PrintButtomSheetSickLevel extends StatefulWidget {
  String leaveId;
  PrintButtomSheetSickLevel(this.leaveId);


  @override
  State<PrintButtomSheetSickLevel> createState() => _PrintButtomSheetSickLevelState();
}

class _PrintButtomSheetSickLevelState extends State<PrintButtomSheetSickLevel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.r),

      child: FutureBuilder<List<LeaveDetail>>(
        future: HospitalApiController().getSickLeaveDtl(leaveId: widget.leaveId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return   Column(
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
                                      '${snapshot.data!.first.leaveDate}',
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
                                      '${snapshot.data!.first.fileName}',
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
                                      '${snapshot.data!.first.clinic!.clinicName}',
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
                                      '${snapshot.data!.first.leaveDuration}',
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
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),

    );
  }
}
