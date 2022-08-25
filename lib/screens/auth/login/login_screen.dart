import 'package:aphaa_app/screens/main_screens/forget_pass/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../general/password_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../drawer_screens/buttom_navication.dart';
import '../create_account/create_account.dart';

class LoginScreen extends StatefulWidget {

  static String routeName = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.login,
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
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sw,
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
              'assets/images/Message.svg', AppLocalizations.of(context)!.email),
          PasswordItem('assets/images/Lock.svg', AppLocalizations.of(context)!.password),
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
                InkWell(
                  onTap: () => Navigator.pushNamed(context, ForgetPassword.routeName),
                  child: Text(
                    AppLocalizations.of(context)!.forget_pass_hl,
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            height: 30.h,
          ),
          BtnLayout(AppLocalizations.of(context)!.login, () =>
        Navigator.pushNamed(context, ButtomNavigations.routeName),),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, CreateAccount.routeName),
              child: Text.rich(
                TextSpan(
                  text: AppLocalizations.of(context)!.no_account_have,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal'
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLocalizations.of(context)!.create_account,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xff058638),
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
