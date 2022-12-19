import 'dart:io';

import 'package:aphaa_app/helper/helpers.dart';
import 'package:aphaa_app/model/patent_payment_record/PatientPaymentRecord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

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
                    text: AppLocalizations.of(context)!.payment_data ,
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
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.payment_time,
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
                    text: AppLocalizations.of(context)!.the_doctor,
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
              ),
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
              ),
            ],
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
                    PdfClass base64 = await HospitalApiController().getPdfFile(
                        patientCode:
                        SharedPrefController().getValueFor(key: "p_code"),
                        // clinicCode: patientPaymentRecord!.clinicCode,
                        serviceType: patientPaymentRecord.serviceType,
                        fileName: patientPaymentRecord.pdfName);
                    if (base64 == null)
                      showSnackBar(context, message: AppLocalizations.of(context)!.no_file_find,error: true);
                    else {
                      Navigator.pop(context);
                      File file =  await FileProcess.downloadFile(base64.pdfFile, patientPaymentRecord.pdfName!.split("/").last);
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
                  // showModalBottomSheet(
                  //   isScrollControlled: true,
                  //
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (context) => PrintMedicalRecipesButtomSheet(prescriptionlist),
                  // );
                },
                child: SvgPicture.asset(
                  'assets/images/show.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
