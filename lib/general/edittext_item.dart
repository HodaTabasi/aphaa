import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditTextItem extends StatelessWidget {
  String icon;
  String hint;
  bool b = true;

  TextEditingController? controler;
  EditTextItem(this.icon,this.hint, {this.controler ,this.b = true}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0E4C8F),width: 0.5.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.0.r),
              child:  SvgPicture.asset(
                  icon,
                  semanticsLabel: 'Acme Logo'
              ),
            ),
             VerticalDivider(
                width:2.w,
                thickness:0.5.w,
                color:Color(0xff0E4C8F)
            ),
            Expanded(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
              child: TextFormField(
                controller: controler,
                enabled: b,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}