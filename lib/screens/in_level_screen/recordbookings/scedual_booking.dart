import 'package:aphaa_app/model/Appointment/Appointments.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../get/login_getx_controller.dart';
import '../../../helper/helpers.dart' ;
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
              Padding(
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
                          text: '  ${appointments.resDate}  ',
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
                        text: '  ${appointments.resStatus}  ',
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
            visible: SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'en'?appointments.resStatus == "Not Confirmed" :appointments.resStatus == "غير مؤكد",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    PaymentMethod paymentMethod = PaymentMethod(context);
                    paymentMethod.doPaymentConfiguration(50);
                    paymentMethod.onBookClick(context,50);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.r, 0, 16.r, 10.r),
                    child: SvgPicture.asset(
                      'assets/images/Group40855.svg',
                      semanticsLabel: 'Acme Logo',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    _displayDialog(context);
                      },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.r, 0, 0.r, 10.r),
                    child: SvgPicture.asset(
                      'assets/images/Group40855.svg',
                      semanticsLabel: 'Acme Logo',
                    ),
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
                  Navigator.pop(context);
                  showLoaderDialog(context);
                  ApiResponse response = await HospitalApiController().setCxlRes(resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode);
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
