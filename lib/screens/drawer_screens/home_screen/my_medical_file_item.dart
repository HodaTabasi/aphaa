import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyMedicalFileItem extends StatelessWidget {

  String image;
  String name;
  late VoidCallback prsee;

  MyMedicalFileItem({required this.image, required this.name,required this.prsee});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: prsee,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Color(0xff0E4C8F),width: 0.5.r),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 10),
          //     blurRadius: 70,
          //     color: Colors.grey.withOpacity(0.23),
          //   ),
          // ],
        ),
        padding: EdgeInsets.all(16),
        margin:  EdgeInsets.all(5),
        child: Column(
          children: [
            // Spacer(),
            SvgPicture.asset(
                image,
                semanticsLabel: 'Acme Logo'
            ),
             SizedBox(
              height: 15.h,
            ),
            Text(name,
              style:  TextStyle(
                color: Color(0xff2B2B2B),
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600,
              ),),

            // Spacer(),
          ],
        ),
      ),
    );
  }
}
