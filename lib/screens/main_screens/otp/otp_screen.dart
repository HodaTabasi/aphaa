import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/main_screens/otp/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../change_password/change_password.dart';

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
        title: Text('تغيير كلمة المرور ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
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
            height: 40,
          ),
          SvgPicture.asset(
              'assets/images/chanfe_pass.svg',
              semanticsLabel: 'Acme Logo'
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Text(
              'أدخل الكود OTP',
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Text(
              'قم بادخال رمز التحقق الذي ارسلناه الي جوالك',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: OtpForm(),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: BtnLayout('التالي', () {
              Navigator.pushNamed(context, ChangePassword.routeName);
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 66.0),
            child: DecoratedBox(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xff0E4C8F),width: 0.5)
            ),
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('اعادة الارسال',style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
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
