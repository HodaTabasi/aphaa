import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/main_screens/otp/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../change_password/change_password.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OTPScreen extends StatefulWidget {
  static String routeName = "/otp";

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.change_password,
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
              margin:  EdgeInsets.all(15.0.r),
              padding:  EdgeInsets.all(5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
        ),
      ),
      body: ListView(
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
            padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 8.r),
            child: Text(
              '${AppLocalizations.of(context)!.enter_code} OTP',
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 8.r),
            child: Text(
              AppLocalizations.of(context)!.enter_the_verification_code_that_we_sent_to_your_mobile,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(15.0.r),
            child: OtpForm(),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 50.0.r),
            child: BtnLayout(AppLocalizations.of(context)!.next, () {
              Navigator.pushNamed(context, ChangePassword.routeName);
            }),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 66.0.r),
            child: DecoratedBox(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Color(0xff0E4C8F),width: 0.5.w)
            ),
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding:  EdgeInsets.all(18.0.r),
                child: Text(AppLocalizations.of(context)!.re_transmitter,style:  TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),textAlign: TextAlign.center,),
              ),
            ),),
          )
        ],
      ),
      bottomSheet: Image.asset(
        "assets/images/image1.png",
        // fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
    );
  }
}
