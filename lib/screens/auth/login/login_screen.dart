import 'package:aphaa_app/screens/drawer_screens/home_screen/home_screen.dart';
import 'package:aphaa_app/screens/main_screens/forget_pass/forget_password.dart';
import 'package:flutter/material.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../general/password_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text('تسجيل دخول ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(5.0),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              )),
        ),
      ),
      body: ListView(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: Text(
              'ادخل بيانات الدخول، للوصول لخدماتنا :',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          EditTextItem(
              'assets/images/Message.svg', AppLocalizations.of(context)!.email),
          PasswordItem('assets/images/Lock.svg', 'كلمة المرور'),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 0,top: 8),
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
                      'تذكرني لاحقا',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
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
                    'نسيت كلمة المرور؟',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          BtnLayout('تسجيل دخول', () =>
        Navigator.pushNamed(context, HomeScreen.routeName),),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, CreateAccount.routeName),
              child: Text.rich(
                TextSpan(
                  text: 'ليس لديك حساب ؟  ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Tajawal'
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' انشاء حساب  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xff058638),
                        fontSize: 14,
                        fontFamily: 'Tajawal'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
