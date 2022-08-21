import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';

class ForgetPassword extends StatefulWidget {

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text('نسيت كلمة المرور',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: Container(
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
      body: Stack(
          children: [
            Column(
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
                    'أدخل رقم الجوال المسجل في ملفك الطبي ',
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
                    'assets/images/phone.svg', AppLocalizations.of(context)!.phone),

                const SizedBox(
                  height: 30,
                ),
                BtnLayout('استعادة كلمة المرور', () {}),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/images/image1.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
      ),
    );
  }
}
