import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ServiceItem extends StatelessWidget {
   String image;
   String name;
   String decration;
   VoidCallback prsee;

   ServiceItem({required this.image, required this.name, required this.decration,required this.prsee});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: prsee,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Color(0xff0E4C8F)),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 10),
          //     blurRadius: 70,
          //     color: Colors.grey.withOpacity(0.23),
          //   ),
          // ],
        ),
        padding: EdgeInsets.all(16.r),
        margin:  EdgeInsets.all(5.r),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
            image,
            semanticsLabel: 'Acme Logo'
        ),
            const SizedBox(
              height: 15,
            ),
            Text(name,
              style:  TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),),
             SizedBox(
              height: 15.h,
            ),
            Text(decration,
              style:  TextStyle(
                color: Color(0xff595959),
                fontSize: 12.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
