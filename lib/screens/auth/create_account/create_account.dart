import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/password_item.dart';
import 'package:aphaa_app/screens/auth/create_account/Choosere.dart';
import 'package:aphaa_app/screens/auth/create_account/create_account_next.dart';
import 'package:aphaa_app/screens/auth/create_account/text_filed.dart';
import 'package:flutter/material.dart';
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
        title: Text('انشاء حساب',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 203,
            height: 161,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'لإنشاء الحساب ، يجب عليك تعبئة البيانات التالية',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          EditTextItem('assets/images/Profile.svg',
              AppLocalizations.of(context)!.pasent_name),
          EditTextItem(
              'assets/images/Message.svg', AppLocalizations.of(context)!.email),
          EditTextItem(
              'assets/images/phone.svg', AppLocalizations.of(context)!.phone),
          PasswordItem('assets/images/Lock.svg','كلمة المرور'),
          PasswordItem('assets/images/Lock.svg','تأكيد كلمة المرور'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffF5F8FB),
                borderRadius: BorderRadius.circular(5)
              ),
                child: Choosere()),
          ),
          MyTextFeild(),
          BtnLayout('التالي', () => Navigator.pushNamed(context, CreateAccountNext.routeName)),
          const SizedBox(
            height: 20,
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
