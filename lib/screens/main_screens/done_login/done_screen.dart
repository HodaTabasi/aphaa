import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginDoneScreens extends StatelessWidget {
  static String routeName = "/done1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          leading: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
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
              ))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            'assets/images/logo.png',
          ),
          SizedBox(
            height: 20.h,
          ),
          Spacer(),
          Text(
            AppLocalizations.of(context)!.password_update,
            style:  TextStyle(
              color: Colors.green,
              fontSize: 20.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(AppLocalizations.of(context)!.password_updated_successfully,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 30.h,),
          Spacer(),
          BtnLayout(AppLocalizations.of(context)!.login, () {
                //Navigator.pushNamed(context, LoginScreen.routeName);
          }),
          Spacer(),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
