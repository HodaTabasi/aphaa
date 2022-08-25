import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/edittext_item.dart';
import 'package:aphaa_app/screens/drawer_screens/done/done_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_screen/payment_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentScreen extends StatefulWidget {
  static String routeName = "/PaymentScreen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text('بيانات الدفع',
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ]),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(height: 20,),
                SvgPicture.asset(
                  'assets/images/visa1.svg',
                  semanticsLabel: 'Acme Logo',
                ),
                SizedBox(height: 20,),
                EditTextItem('assets/images/Profile.svg', 'الاسم على البطاقة'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      MyPaymentTextFeild('1111 1111 1111 1111',MediaQuery.of(context).size.width/2),
                      MyPaymentTextFeild('07/22',MediaQuery.of(context).size.width/4.2),
                      MyPaymentTextFeild('123',MediaQuery.of(context).size.width/4.7),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width/3,),
                BtnLayout('ادفع الآن', () {
                  Navigator.pushNamed(context, DoneScreens.routeName);
                }),
              ],
            ),
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
