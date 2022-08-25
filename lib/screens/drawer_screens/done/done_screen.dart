import 'package:aphaa_app/screens/drawer_screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/btn_layout.dart';

class DoneScreens extends StatelessWidget {
  static String routeName = "/done";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
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
              ))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo.png',
          ),
          SizedBox(
            height: 20,
          ),
          Spacer(),
          Text(
            'تـــهــــانــــيــــنـــــا !',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text('تـــمـــت عـــمـــلـــيــة الـــدفــع بـــنــجـــأح',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 30,),
          Spacer(),
          BtnLayout('الرئيسية', () {
                Navigator.pushNamed(context, HomeScreen.routeName);
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
