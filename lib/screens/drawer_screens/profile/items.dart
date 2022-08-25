import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextItem extends StatelessWidget {
  String icon;
  String hint;
  bool isVisable = false;
  late VoidCallback prsee;

  TextItem(this.icon,this.hint ,this.prsee,{this.isVisable = false}) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: prsee,
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0E4C8F),width: 0.5.r),
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
                  thickness:0.5,
                  color:Color(0xff0E4C8F)
              ),
              Expanded(child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 16.r),
                child: Text(
                  hint,
                  style:  TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              Opacity(
                child: Padding(
                  padding:  EdgeInsets.all(16.0.r),
                  child: Icon(Icons.arrow_forward_ios,color: Color(0xff058638),size: 20.sp,),
                ),
                opacity: isVisable ?0:1,
              )
            ],
          ),
        ),
      ),
    );
  }
}