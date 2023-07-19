import 'dart:io';

import 'package:aphaa_app/general/download_btn.dart';
import 'package:aphaa_app/helper/helpers.dart';
import 'package:aphaa_app/helper/share_buttom_sheet.dart';
import 'package:aphaa_app/model/SickLeaves/LeaveDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../general/edittext_item.dart';
import '../../../helper/FileProcess.dart';
import '../../../model/getPDF.dart';
import '../../../preferences/shared_pref_controller.dart';

class PrintButtomSheetSickLevel extends StatefulWidget {
  String leaveId;
  BuildContext bottomSheetContext;
  PrintButtomSheetSickLevel(this.leaveId, this.bottomSheetContext);


  @override
  State<PrintButtomSheetSickLevel> createState() => _PrintButtomSheetSickLevelState();
}

class _PrintButtomSheetSickLevelState extends State<PrintButtomSheetSickLevel> with Helpers1{
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
            return   SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: 10.h,
                    indent: 100.w,
                    endIndent: 100.w,
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(8.0.r,20.r,8.r,10.r),
                    child: Column(
                      children: [
                        Row(
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
                                            '${snapshot.data!.first.repDate}',
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
                                  SizedBox(height: 10.h,),
                                  Text(
                                    AppLocalizations.of(context)!.the_clinic,
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
                                  //////////
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
                                          padding:  EdgeInsets.all(16.0.w),
                                          child: Text(
                                            '${snapshot.data!.first.doctor!.doctorName}',
                                            style:  TextStyle(
                                              color: Color(0xff2D2D2D),
                                              fontSize: 12.5.sp,
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ), ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
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
                                  //////////
                                ],
                              ),
                            ),
                          ],
                        ),

                   SizedBox(
                     width: MediaQuery.of(context).size.width,
                     child: Text(
                                  AppLocalizations.of(context)!.descraptipn,
                                  style:  TextStyle(
                                    color: Color(0xff2D2D2D),
                                    fontSize: 15.sp,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                  ),
                       textAlign: TextAlign.start,
                                ),
                   ),
                              Padding(
                                padding:  EdgeInsets.all(16.0.r),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xffF7F8FB),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(16.0.r),
                                      child: Text(
                                        '${snapshot.data!.first.repDiag}',
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
                  // SizedBox(height: 10.h,),
                  Visibility(
                    visible: snapshot.data!.first.repStaus == "1",
                      child: InkWell(
                        onTap: () async {

                          showLoaderDialog(context);
                          PdfClass base64 = await HospitalApiController().getPdfFile(
                              patientCode:
                              SharedPrefController().getValueFor(key: "p_code"),
                              clinicCode: snapshot.data!.first.clinic!.clinicCode,
                              serviceType: snapshot.data!.first.serviceType,
                              fileName: snapshot.data!.first.fileName);
                          if (base64 == null)
                            showSnackBar(context, message: AppLocalizations.of(context)!.no_file_find,error: true);
                          else {
                            Navigator.pop(context);
                            File file =  await FileProcess.downloadFile(base64.pdfFile, snapshot.data!.first.fileName);
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) => ShareButtomSheet(file.path) );
                          //showSnackBarAction(widget.bottomSheetContext, message: "${AppLocalizations.of(context)!.download_successfully}",error: false,path:file.path );
                          }
                        },
                          child: downloadBtn())),


                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.no_data,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.r,
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
