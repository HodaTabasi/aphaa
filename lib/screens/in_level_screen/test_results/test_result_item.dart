import 'dart:io';

import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/helper/FileProcess.dart';
import 'package:aphaa_app/helper/helpers.dart';
import 'package:aphaa_app/model/lab_rad_result/ServiceTest.dart';
import 'package:aphaa_app/model/getPDF.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../../helper/share_buttom_sheet.dart';

class TestResultItem extends StatelessWidget with Helpers1 {
  ServiceTest? serviceTest;

  TestResultItem({this.serviceTest});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 10.r),
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
            padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 10.r),
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
                    text: '   ${serviceTest?.serviceName}   ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.physician,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '   ${serviceTest?.doctorName}   ',
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
                onTap: () async {
                  showLoaderDialog(context);
                  PdfClass? base64 = await HospitalApiController().getPdfFile(
                      patientCode:
                      SharedPrefController().getValueFor(key: "p_code"),
                      clinicCode: serviceTest!.clinicCode,
                      serviceType: serviceTest!.serviceType,
                      fileName: serviceTest!.fileName);
                  // Navigator.pop(context);
                  if (base64 == null) {
                    Navigator.pop(context);
                    showSnackBarFloating(context,
                        message: AppLocalizations.of(context)!.no_file_find,
                        error: true);
                  }else {
                    File file =  await FileProcess.downloadFile(base64.pdfFile, serviceTest!.fileName);
                    Navigator.pop(context);
                    if(Platform.isAndroid) {
                      Share.shareFiles(['${file.path}'], text: 'ShreFile');
                    }else {
                      if (file != null) {
                        await Share.shareXFiles(
                          [XFile(file.path)],
                          sharePositionOrigin: Rect.fromCircle(
                            radius: MediaQuery.of(context).size.width * 0.25,
                            center: const Offset(0, 0),
                          ),
                        );
                      } else {
                        showSnackBarAction(context, message: "Failed to share",error: true);
                      }
                    }
                    // showSnackBarAction(context, message: "${AppLocalizations.of(context)!.download_successfully}",error: false,path:file.path );
                  }

                  // showModalBottomSheet(
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (context) => PrintMedicalRecipesButtomSheet(),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.r, 0, 10.r, 10.r),
                  child: SvgPicture.asset(
                    'assets/images/arrow.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  showLoaderDialog(context);
                  PdfClass? base64 = await HospitalApiController().getPdfFile(
                      patientCode:
                          SharedPrefController().getValueFor(key: "p_code"),
                      clinicCode: serviceTest!.clinicCode,
                      serviceType: serviceTest!.serviceType,
                      fileName: serviceTest!.fileName);
                  // Navigator.pop(context);
                  if (base64 == null) {
                    Navigator.pop(context);
                    showSnackBar(context,
                        message: AppLocalizations.of(context)!.no_file_find,
                        error: true);
                  }else {
                    File file =  await FileProcess.downloadFile(base64.pdfFile, serviceTest!.fileName);
                    Navigator.pop(context);
                    // showModalBottomSheet(
                    //     isScrollControlled: false,
                    //     backgroundColor: Colors.transparent,
                    //     context: context,
                    //     builder: (_) => ShareButtomSheet(file.path) );
                    showSnackBarAction(context, message: "${AppLocalizations.of(context)!.download_successfully}",error: false,path:file.path );
                  }

                  // showModalBottomSheet(
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (context) => PrintMedicalRecipesButtomSheet(),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.r, 0, 16.r, 10.r),
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
