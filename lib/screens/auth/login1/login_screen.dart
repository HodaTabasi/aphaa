import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/screens/main_screens/forget_pass/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/auth_api_controller.dart';
import '../../../api/controllers/hospital_controller.dart';
import '../../../firebase/fb_auth_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../general/password_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../get/login_getx_controller.dart';
import '../../../model/Eligibility.dart';
import '../../../model/api_response.dart';
import '../../drawer_screens/buttom_navication.dart';
import 'package:aphaa_app/helper/helpers.dart';

import '../../main_screens/open_medocal/opening_medical_file.dart';
import '../create_account1/new_account_first.dart';

class LoginScreen1 extends StatefulWidget {

  static String routeName = "/login1";
  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> with Helpers1{
  var value = false;
  // var _emailTextController = TextEditingController();
  var _emailTextController = TextEditingController(text: "2320128214");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:false ,
      appBar: AppBar(
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.login,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin: EdgeInsets.all(15.0.r),
              padding: EdgeInsets.all(5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 203.w,
            height: 161.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.h,vertical: 8.w),
            child: Text(
              AppLocalizations.of(context)!.enter_login_information_access_services,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          EditTextItem(
              'assets/images/id.svg', AppLocalizations.of(context)!.identity_number,controler: _emailTextController),
          Padding(
            padding:  EdgeInsets.only(left: 16.0.w,right: 0,top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(color: Colors.green.shade900),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusColor: Colors.green.shade800,
                      // hoverColor: white,
                      checkColor: Colors.white,
                      activeColor: Colors.green.shade800,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.remember_me_later,
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: () => Navigator.pushNamed(context, ForgetPassword.routeName),
                //   child: Text(
                //     AppLocalizations.of(context)!.forget_pass_hl,
                //     style:  TextStyle(
                //       color: Colors.black,
                //       fontSize: 13.sp,
                //       fontFamily: 'Tajawal',
                //       fontWeight: FontWeight.w700,
                //     ),
                //     textAlign: TextAlign.start,
                //   ),
                // ),
              ],
            ),
          ),
           SizedBox(
            height: 60.h,
          ),
          BtnLayout(AppLocalizations.of(context)!.login, () =>_performLogin(),),
          SizedBox(
            height: 10.h,
          ),
          // Center(
          //   child: InkWell(
          //     onTap: () =>
          //         Navigator.pushNamed(context, NewAccountFirst.routeName),
          //     child: Text.rich(
          //       TextSpan(
          //         text: AppLocalizations.of(context)!.no_account_have,
          //         style: TextStyle(
          //             fontWeight: FontWeight.w700,
          //             color: Colors.black,
          //             fontSize: 14.sp,
          //             fontFamily: 'Tajawal'
          //         ),
          //         children: <TextSpan>[
          //           TextSpan(
          //             text: AppLocalizations.of(context)!.create_account,
          //             style: TextStyle(
          //               fontWeight: FontWeight.w700,
          //               color: Color(0xff058638),
          //               fontSize: 14.sp,
          //               fontFamily: 'Tajawal'
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
           SizedBox(
            height: 20.h,
          ),
        ],
      ),
      bottomSheet:  Image.asset(
        "assets/images/image1.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
  Future<void> _performLogin() async {
    if (_checkData()) {
      await checkEligibility();
    }
  }

  bool _checkData() {

    if (_emailTextController.text.isNotEmpty ) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.enter_required_data, error: true);
    return false;
  }

  Future<void> checkEligibility() async {
    showLoaderDialog(context);

    Eligibility? eg = await HospitalApiController().getPtElg(
        patientId: _emailTextController.text);
    Navigator.pop(context);
    if (eg != null) {
      NewAccountGetxController.to.eligibility = eg;
      if (eg.isEligible == "true") {
        NewAccountGetxController.to.identityNumber = _emailTextController.text;
        FireBaseAuthController().afterPhoneVerification(context,1);
        // await FireBaseAuthController().signOut();
        // await FireBaseAuthController().verifyPhoneNumber1(
        //     context: context, userPhone:  597046766);

        // FireBaseAuthController().verifyPhoneNumber1(
        //     context: context, userPhone: eg.patientMOB?.substring(1));

      } else {
        QuickServiceGetxController.to.requestType = '1';
        Navigator.pushReplacementNamed(context, OpeningMedicalFile.routeName);
      }
    }else {
        showSnackBar(
            context, message: AppLocalizations.of(context)!.something_wrong,
            error: true);
      }
  }

  Future<void> _login() async {
    showLoaderDialog(context);
    // LoginGetXController.to.changeFelidText(_emailTextController.text, _passwordTextController.text);

    // FireBaseAuthController().verifyPhoneNumber1(
    //     context: context, userPhone: _emailTextController.text.substring(1));


    // ApiResponse apiResponse = await AuthApiController().login(
    //     mobile: _emailTextController.text,
    //     password: _passwordTextController.text);
    // if (apiResponse.success) {
    //   Navigator.pop(context);
    //   Navigator.pushReplacementNamed(context, ButtomNavigations.routeName);
    // }else {
    //   Navigator.pop(context);
    //   showSnackBar(
    //     context,
    //     message: apiResponse.message,
    //     error: !apiResponse.success,
    //   );
    // }
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }
}
