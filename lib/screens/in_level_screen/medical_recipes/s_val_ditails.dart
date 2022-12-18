import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SVDitails extends StatelessWidget {
  num? val;
  String? desc;

  SVDitails(this.desc,{this.val});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            desc!,
            style:  TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 14.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: Text(
              // ' ر.س ',
              '  ${val??0.0}ر.س  ',
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
