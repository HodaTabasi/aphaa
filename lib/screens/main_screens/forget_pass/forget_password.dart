import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/screens/main_screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../firebase/fb_auth_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';

class ForgetPassword extends StatefulWidget {
  static String routeName = "/ForgetPassword";

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _pPhone = TextEditingController(text: "0597046766");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.forgot_your_password,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding:  EdgeInsets.all(5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              )),
        ),
      ),
      body: ListView(
          children: [
            Column(
              children: [
                 SizedBox(
                  height: 40.h,
                ),
                SvgPicture.asset(
                    'assets/images/chanfe_pass.svg',
                    semanticsLabel: 'Acme Logo'
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0.r,vertical: 8.r),
                  child: Text(
                    AppLocalizations.of(context)!.mobile_registered_your_medical_file,
                    style:  TextStyle(
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
                    'assets/images/phone.svg', AppLocalizations.of(context)!.phone,controler: _pPhone),

                 SizedBox(
                  height: 30.h,
                ),
                BtnLayout(AppLocalizations.of(context)!.restore_password,
                      () {
                        NewAccountGetxController.to.isReset = true;
                        FireBaseAuthController().verifyPhoneNumber1(context: context,userPhone: _pPhone);
                        // Navigator.pushNamed(context, OTPScreen.routeName);
                      }
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
      ),
      bottomSheet: Image.asset(
        "assets/images/image1.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
