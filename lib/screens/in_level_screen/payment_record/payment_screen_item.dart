import 'dart:io';

import 'package:aphaa_app/helper/helpers.dart';
import 'package:aphaa_app/model/patent_payment_record/PatientPaymentRecord.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_record/print_payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../helper/FileProcess.dart';
import '../../../model/getPDF.dart';
import '../../../preferences/shared_pref_controller.dart';

class PaymentScreenItem extends StatelessWidget with Helpers1{
  PatientPaymentRecord patientPaymentRecord;
  PaymentScreenItem(this.patientPaymentRecord);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width - 50,
      // height: 150.h,
      padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 10.r, bottom: 10.r),
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      // margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.invoices_type,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${patientPaymentRecord.invType}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//نوع الفاتورة
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.payment_time ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${patientPaymentRecord.invNo}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//رقم الفاتورة
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.net_cash,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ${patientPaymentRecord.cashAmt} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//صافي النقدي
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
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
                              text: '  ${patientPaymentRecord.clinicName}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//العيادة
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.physician,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ${patientPaymentRecord.doctorName} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ), //الطبيب المعالج
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.cons_date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ${patientPaymentRecord.consDate} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//تاريخ الاستشارة

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                        child: Text.rich(
                          TextSpan(
                            text: AppLocalizations.of(context)!.payment_time ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'Tajawal'),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  ${patientPaymentRecord.invNo}  ',
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
                    ), // فاضي
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.payment_date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${patientPaymentRecord.invDate}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//تاريخ الفاتورة
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.net_term,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ${patientPaymentRecord.creditAmt} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//صافي الاجل
                    Opacity(
                      opacity: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                        child: Text.rich(
                          TextSpan(
                            text: AppLocalizations.of(context)!.payment_time ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontFamily: 'Tajawal'),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  ${patientPaymentRecord.invNo}  ',
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
                    ), // فاضي
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.cons_no ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${patientPaymentRecord.consNo}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//رقم لاستشارة
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.r,10.r, 10.r,10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.exp_time ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${patientPaymentRecord.expTime}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),//الوقت المتوقع
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
              visible: patientPaymentRecord.pdfStatus == "1",
              child: InkWell(
                onTap: () async {
                  showLoaderDialog(context);
                  PdfClass? base64 = await HospitalApiController().getPdfFile(
                      patientCode:
                      SharedPrefController().getValueFor(key: "p_code"),
                      // clinicCode: patientPaymentRecord!.clinicCode,
                      serviceType: patientPaymentRecord.serviceType,
                      fileName: patientPaymentRecord.pdfName);
                  // Navigator.pop(context);
                  if (base64 == null) {
                    Navigator.pop(context);
                    showSnackBarFloating(context,
                        message: AppLocalizations.of(context)!.no_file_find,
                        error: true);
                  }else {
                    Navigator.pop(context);
                    File file =  await FileProcess.downloadFile(base64.pdfFile, patientPaymentRecord.pdfName!.split("/").last);
                    Share.shareFiles(['${file.path}'], text: 'ShreFile');
                    // showSnackBarAction(context, message: "${AppLocalizations.of(context)!.download_successfully}",error: false,path:file.path );
                  }
                  },
                child: SvgPicture.asset(
                  'assets/images/arrow.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
              SizedBox(
                width: 8.w,
              ),
              Visibility(
                visible: patientPaymentRecord.pdfStatus == "1",
                child: InkWell(
                  onTap: () async {
                    showLoaderDialog(context);
                    PdfClass? base64 = await HospitalApiController().getPdfFile(
                        patientCode:
                        SharedPrefController().getValueFor(key: "p_code"),
                        // clinicCode: patientPaymentRecord!.clinicCode,
                        serviceType: patientPaymentRecord.serviceType,
                        fileName: patientPaymentRecord.pdfName);
                    // Navigator.pop(context);
                    if (base64 == null) {
                      Navigator.pop(context);
                      showSnackBar(context,
                          message: AppLocalizations.of(context)!.no_file_find,
                          error: true);
                    } else {
                      Navigator.pop(context);
                      File file =  await FileProcess.downloadFile(base64.pdfFile, patientPaymentRecord.pdfName!.split("/").last);
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
                  child: SvgPicture.asset(
                    'assets/images/Group40855.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: true,

                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => PrintPaymentDitailsButtomSheet(patientPaymentRecord.refNo!),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/show.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
