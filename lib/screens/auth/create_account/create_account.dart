import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/password_item.dart';
import 'package:aphaa_app/screens/auth/create_account/Choosere.dart';
import 'package:aphaa_app/screens/auth/create_account/create_account_next.dart';
import 'package:aphaa_app/screens/auth/create_account/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/edittext_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAccount extends StatefulWidget {
  static String routeName = "/create_account";
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text( AppLocalizations.of(context)!.create_account,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2.r,
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
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
          Text(
            AppLocalizations.of(context)!.create_the_account_you_following_data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
           SizedBox(
            height: 20.h,
          ),
          EditTextItem('assets/images/Profile.svg',
              AppLocalizations.of(context)!.pasent_name),
          EditTextItem(
              'assets/images/Message.svg', AppLocalizations.of(context)!.email),
          EditTextItem(
              'assets/images/phone.svg', AppLocalizations.of(context)!.phone),
          PasswordItem('assets/images/Lock.svg',AppLocalizations.of(context)!.password),
          PasswordItem('assets/images/Lock.svg',AppLocalizations.of(context)!.re_password),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffF5F8FB),
                borderRadius: BorderRadius.circular(5.r)
              ),
                child: Choosere()),
          ),
          MyTextFeild(),
          BtnLayout(AppLocalizations.of(context)!.next, () => Navigator.pushNamed(context, CreateAccountNext.routeName)),
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
