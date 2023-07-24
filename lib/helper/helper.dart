import 'package:aphaa_app/helper/helpers.dart';
import 'package:aphaa_app/screens/drawer_screens/Booking/payment_methods.dart';
import 'package:aphaa_app/screens/drawer_screens/buttom_navication.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../api/controllers/hospital_controller.dart';
import '../get/new_account_getx_controller.dart';
import '../model/PaymentPermssion.dart';
import '../preferences/shared_pref_controller.dart';

mixin Helpers implements Helpers1{
  showAlertDialog(BuildContext context, {f1=false,flag = false,message="",message2=""}) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text(flag?message:AppLocalizations.of(context)!.thanks,
              style: TextStyle(
                  fontSize: 14.sp, fontFamily: 'Tajawal', color: Colors.green)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );
    Widget continueButton1 = Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0.0.r),
        child: Text(
          message2,
          style: TextStyle(
              fontSize: 14.sp, fontFamily: 'Tajawal', color: Colors.black45),
          textAlign: TextAlign.center,
        ),
      ),
    );

    Widget continueButton2 = Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.0.r),
        child: InkWell(
          onTap: () async {
            showLoaderDialog(context);
            PaymentMethod paymentMethod = PaymentMethod(context);
            /*resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode*/
            PaymentPermssion? response = await HospitalApiController().getPymtPerms(doctorCode: NewAccountGetxController.to.doctorCode,resDate: NewAccountGetxController.to.resDate,resNo: NewAccountGetxController.to.resNo,patientCode: SharedPrefController().getValueFor(key: "p_code"));
            Navigator.pop(context);
            paymentMethod.doPaymentConfiguration(response?.reqAmt,permsNo: response?.permsNo);
            if(response?.permsStatus =="true"){
              if(response?.reqAmt == null || response?.reqAmt == "0"){
                //TODO 1قطع فاتورة حتى لو صفر
                var map = {
                  'permsNo': '${response?.permsNo}',
                  'lang': SharedPrefController()
                      .getValueFor<String>(key: PrefKeys.lang.name) ??
                      "ar",
                };
                paymentMethod.doIt(map);
              }else {
                // paymentMethod.doPaymentConfiguration(NewAccountGetxController.to.timeResponse?.reqAmt,permsNo: response?.permsNo);
                Navigator.pop(context);
                paymentMethod.onBookClick(context,response?.reqAmt,permsNo: response?.permsNo);
                // paymentMethod.onBookClick(context,NewAccountGetxController.to.timeResponse?.reqAmt,permsNo: response?.permsNo);

              }
            }else {
              //TODO قطع فاتورة حتى لو فاضية
              var map = {
                'permsNo': '${response?.permsNo}',
                'lang': SharedPrefController()
                    .getValueFor<String>(key: PrefKeys.lang.name) ??
                    "ar",
              };
              paymentMethod.doIt(map);
            }
          },
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                  'assets/images/card_pay.svg',height: 30.h,width: 30.w),
              SizedBox(
                width: 8,
              ),
              Text(
                  AppLocalizations.of(context)!
                      .continue_to_pay,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      color: Colors.black))
            ],
          ),
        ),
      ),

    //
    //   Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: ElevatedButton(
    //         onPressed: () async {
    //      showLoaderDialog(context);
    //      PaymentMethod paymentMethod = PaymentMethod(context);
    // /*resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode*/
    //    PaymentPermssion? response = await HospitalApiController().getPymtPerms(doctorCode: NewAccountGetxController.to.doctorCode,resDate: NewAccountGetxController.to.resDate,resNo: NewAccountGetxController.to.resNo,patientCode: SharedPrefController().getValueFor(key: "p_code"));
    //   Navigator.pop(context);
    //      paymentMethod.doPaymentConfiguration(response?.reqAmt,permsNo: response?.permsNo);
    //      if(response?.permsStatus =="true"){
    //   if(response?.reqAmt == null || response?.reqAmt == "0"){
    //     //TODO 1قطع فاتورة حتى لو صفر
    //     var map = {
    //       'permsNo': '${response?.permsNo}',
    //           'lang': SharedPrefController()
    //               .getValueFor<String>(key: PrefKeys.lang.name) ??
    //           "ar",
    //           };
    //     paymentMethod.doIt(map);
    //   }else {
    //     // paymentMethod.doPaymentConfiguration(NewAccountGetxController.to.timeResponse?.reqAmt,permsNo: response?.permsNo);
    //     Navigator.pop(context);
    //     paymentMethod.onBookClick(context,response?.reqAmt,permsNo: response?.permsNo);
    //     // paymentMethod.onBookClick(context,NewAccountGetxController.to.timeResponse?.reqAmt,permsNo: response?.permsNo);
    //
    //   }
    //   }else {
    //   //TODO قطع فاتورة حتى لو فاضية
    //        var map = {
    //          'permsNo': '${response?.permsNo}',
    //          'lang': SharedPrefController()
    //              .getValueFor<String>(key: PrefKeys.lang.name) ??
    //              "ar",
    //        };
    //        paymentMethod.doIt(map);
    // }
    //            },
    //         child: Text(AppLocalizations.of(context)!.continue_to_pay,
    //             style: TextStyle(
    //                 fontSize: 16, fontFamily: 'Tajawal', color: Colors.white))),
    //   ),
    );

    Widget continueButton4 = Center(
      child: InkWell(
        onTap:  () async {
          showLoaderDialog(context);
          PaymentMethod paymentMethod = PaymentMethod(context);
          /*resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode*/
          PaymentPermssion? response = await HospitalApiController().getPymtPerms(doctorCode: NewAccountGetxController.to.doctorCode,resDate: NewAccountGetxController.to.resDate,resNo: NewAccountGetxController.to.resNo,patientCode: SharedPrefController().getValueFor(key: "p_code"));
          paymentMethod.doPaymentConfiguration(response?.reqAmt,permsNo: response?.permsNo);
          Navigator.pop(context);
          if(response?.permsStatus =="true"){
            if(response?.reqAmt == null || response?.reqAmt == "0"){
              //TODO 1قطع فاتورة حتى لو صفر
              var map = {
                'permsNo': '${response?.permsNo}',
                'lang': SharedPrefController()
                    .getValueFor<String>(key: PrefKeys.lang.name) ??
                    "ar",
              };
              paymentMethod.doIt(map);
            }else {
              Navigator.pop(context);
              paymentMethod.onBookClickApply(context,response?.reqAmt,permsNo: response?.permsNo);
            }
          }else {
            //TODO قطع فاتورة حتى لو فاضية
            var map = {
              'permsNo': '${response?.permsNo}',
              'lang': SharedPrefController()
                  .getValueFor<String>(key: PrefKeys.lang.name) ??
                  "ar",
            };
            paymentMethod.doIt(map);
          }

        },
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 5.0.r),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                  'assets/images/apple_pay.svg',height: 30.h,width: 30.w),
              SizedBox(
                width: 8,
              ),
              Text(
                  AppLocalizations.of(context)!
                      .continue_to_pay1,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      color: Colors.black))
            ],
          ),
        ),
      ),


      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ElevatedButton(
      //       onPressed: () async {
      //         showLoaderDialog(context);
      //         PaymentMethod paymentMethod = PaymentMethod(context);
      //         /*resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode*/
      //         PaymentPermssion? response = await HospitalApiController().getPymtPerms(doctorCode: NewAccountGetxController.to.doctorCode,resDate: NewAccountGetxController.to.resDate,resNo: NewAccountGetxController.to.resNo,patientCode: SharedPrefController().getValueFor(key: "p_code"));
      //         paymentMethod.doPaymentConfiguration(response?.reqAmt,permsNo: response?.permsNo);
      //         Navigator.pop(context);
      //         if(response?.permsStatus =="true"){
      //           if(response?.reqAmt == null || response?.reqAmt == "0"){
      //             //TODO 1قطع فاتورة حتى لو صفر
      //             var map = {
      //               'permsNo': '${response?.permsNo}',
      //               'lang': SharedPrefController()
      //                   .getValueFor<String>(key: PrefKeys.lang.name) ??
      //                   "ar",
      //             };
      //             paymentMethod.doIt(map);
      //           }else {
      //             Navigator.pop(context);
      //             paymentMethod.onBookClickApply(context,response?.reqAmt,permsNo: response?.permsNo);
      //           }
      //         }else {
      //           //TODO قطع فاتورة حتى لو فاضية
      //           var map = {
      //             'permsNo': '${response?.permsNo}',
      //             'lang': SharedPrefController()
      //                 .getValueFor<String>(key: PrefKeys.lang.name) ??
      //                 "ar",
      //           };
      //           paymentMethod.doIt(map);
      //         }
      //
      //         },
      //       child: Text(AppLocalizations.of(context)!.continue_to_pay1,
      //           style: TextStyle(
      //               fontSize: 16, fontFamily: 'Tajawal', color: Colors.white))),
      // ),
    );


    Widget continueButton3 = Center(
      child: ElevatedButton(
          onPressed: () {
            if(f1){
              Navigator.pop(context);
              Navigator.pop(context);
            }else{
              Navigator.pop(context);
            }

            // Navigator.popAndPushNamed(context, ButtomNavigations.routeName);
          },
          child: Text(AppLocalizations.of(context)!.back,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.white))),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        // padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 40.r,
                  color: Colors.green,
                ),
                continueButton,
              ],
            ),
            Divider(
              color: Colors.grey.shade500,
            ),
            Visibility(
              visible: flag,
              child: Text(
               'طريقة الدفع',
                style: TextStyle(
                    fontSize: 14.sp, fontFamily: 'Tajawal', color: Colors.black45),
                textAlign: TextAlign.center,
              ),
            ),
            Visibility(visible: !flag,child: continueButton1),
            Visibility(visible: flag, child: continueButton2),
            Visibility(visible: flag, child: continueButton4),
            Divider(
              color: Colors.grey.shade500,
            ),
            continueButton3
          ],
        ),
      ),
      // actions: [
      //   Visibility(visible: !flag,child: continueButton1),
      //   Visibility(visible: flag, child: continueButton2),
      //   Visibility(visible: flag, child: continueButton4),
      //   continueButton3
      // ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog1(BuildContext context, {flag = false,message="",message2="شكرا لكم، تم استلام طلبكم  وسوف نقوم بالرد في اقرب وقت"}) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text(flag?message:'تـم الــإرســـال بـــنـــجــاح!',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.green)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );
    Widget continueButton1 = Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message2,
          style: TextStyle(
              fontSize: 16, fontFamily: 'Tajawal', color: Colors.black45),
          textAlign: TextAlign.center,
        ),
      ),
    );


    Widget continueButton3 = Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.popAndPushNamed(context, ButtomNavigations.routeName);
          },
          child: Text("عودة",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.white))),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.check_circle,
          size: 60,
          color: Colors.green,
        ),
      ),
      actions: [
        continueButton,
        Visibility(visible: !flag,child: continueButton1),
        continueButton3
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showRigectAlertDialog(BuildContext context) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text(AppLocalizations.of(context)!.this_date_is_not_available,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.black)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );
    Widget continueButton1 = Center(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.ok,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.error,
          size: 60,
          color: Colors.red,
        ),
      ),
      actions: [
        continueButton,
        continueButton1,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog2(BuildContext context, {flag = false,message="",message2="شكرا لكم، تم استلام طلبكم  وسوف نقوم بالرد في اقرب وقت"}) {
    Widget continueButton = Center(
      child: TextButton(
          child: Text(message,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.green)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
    );


    Widget continueButton3 = Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.popAndPushNamed(context, ButtomNavigations.routeName);
          },
          child: Text("عودة",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Tajawal', color: Colors.white))),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.check_circle,
          size: 60,
          color: Colors.green,
        ),
      ),
      actions: [
        continueButton,
        continueButton3
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
