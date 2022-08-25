import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/main_screens/done_login/done_screen.dart';
import 'package:flutter/material.dart';

import '../../../general/btn_layout.dart';
import '../../../general/password_item.dart';
import '../../drawer_screens/buttom_navication.dart';

class ChangePassword extends StatefulWidget {

  static String routeName = "/changepass";

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text('تغيير كلمة المرور ',
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
              'تغيير كلمة المرور',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordItem('assets/images/Lock.svg', ' كلمة المرور'),
          PasswordItem('assets/images/Lock.svg', ' إعادة كلمة المرور'),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 0,top: 8),
          ),
          const SizedBox(
            height: 30,
          ),
          BtnLayout('تغيير كلمة المرور', () =>
              Navigator.pushNamed(context, LoginDoneScreens.routeName),),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
      bottomSheet:  Image.asset(
        "assets/images/image1.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
