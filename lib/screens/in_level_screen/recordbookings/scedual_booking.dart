import 'package:aphaa_app/model/Appointment/Appointments.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../get/change_name_getx_controller.dart';
import '../../../get/login_getx_controller.dart';
import '../../../helper/helpers.dart' ;
import '../../../model/PaymentPermssion.dart';
import '../../../model/api_response.dart';
import '../../drawer_screens/Booking/payment_methods.dart';


class ScedualBookingItem extends StatelessWidget with Helpers1 {
  Appointments appointments;
  ScedualBookingItem(this.appointments);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: !ChangeGetxController.to.flagPrevAppt,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.req_number,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  ${appointments.resNo}  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.booking_date,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ChangeGetxController.to.flagPrevAppt ?'  ${appointments.date}  ':'  ${appointments.resDate}  ',
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
                Visibility(
                  visible: appointments.time!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                    child: Text.rich(
                      TextSpan(
                        text: AppLocalizations.of(context)!.booking_time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal'),
                        children: <TextSpan>[
                          TextSpan(
                            text: '  ${appointments.time}  ',
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
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                        text: '  ${appointments.clinic!.clinicName}  ',
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
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
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
                        text: ' ${appointments.doctor!.doctorName}  ',
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
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.app_status,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ChangeGetxController.to.flagPrevAppt ?'  ${appointments.reservationStatus}  ':'  ${appointments.resStatus}  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'en'?appointments.resStatus == "Not Confirmed" :appointments.resStatus == "?????? ????????",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    showLoaderDialog(context);
                    /*resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode*/
                    PaymentPermssion? response = await HospitalApiController().getPymtPerms(doctorCode: appointments.doctor?.doctorCode,resDate: appointments.resDate,resNo: appointments.resNo,patientCode: SharedPrefController().getValueFor(key: "p_code"));
                    Navigator.pop(context);
                    if(response?.permsStatus =="true"){
                      PaymentMethod paymentMethod = PaymentMethod(context);
                      paymentMethod.doPaymentConfiguration(response?.reqAmt,permsNo: response?.permsNo);
                      paymentMethod.onBookClick(context,response?.reqAmt,permsNo: response?.permsNo);
                    } else {
                      showSnackBar(context, message: response?.paymentNotice??"", error: true);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.r, 0, 0.r, 10.r),
                    child: Row(children: [
                      Icon(Icons.payment_rounded,color: Color(0xff0E4C8F),size: 20,),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(AppLocalizations.of(context)!.payment,style: TextStyle(color: Color(0xff0E4C8F),fontFamily: 'Tajawal',fontSize: 12.r,fontWeight: FontWeight.w200),)
                    ],),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () async {
                    _displayDialog(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.r, 0, 16.r, 10.r),
                    child: Row(children: [
                      Icon(Icons.cancel,color: Colors.red,size: 20,),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(AppLocalizations.of(context)!.cancel_record,style: TextStyle(color: Colors.red,fontFamily: 'Tajawal',fontSize: 12.r,fontWeight: FontWeight.w200),)
                    ],),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content:  Text(AppLocalizations.of(context)!.dialog_mm),
            actions: <Widget>[
              TextButton(
                child:  Text(
                  AppLocalizations.of(context)!.conferm,
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () async {
                  // Navigator.pop(context);
                  showLoaderDialog(context);
                  ApiResponse response = await HospitalApiController().setCxlRes(resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode);
                  Navigator.pop(context);
                  if(response.success){
                    LoginGetXController.to.delete(appointments);
                    Navigator.pop(context);
                  }

                  showSnackBar(context, message: response.message, error: !response.success);

                },
              ),
              TextButton(
                child:  Text(
                  AppLocalizations.of(context)!.cancel,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
