import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewWidgetNetworkFirst extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/network_connect.svg",
            semanticsLabel: 'Acme Logo',
            color: Colors.green,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(" تحقق من اتصالك بالانترنت واضغط هنا لاعادة التحميل ",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14.sp,
              fontFamily: 'Tajawal'
          ),)
        ],
      ),
    );
  }
}