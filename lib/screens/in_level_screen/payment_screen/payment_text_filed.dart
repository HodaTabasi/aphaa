import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPaymentTextFeild extends StatelessWidget {

  String hint ;
  double h;
   final TextEditingController? controller;
  MyPaymentTextFeild(this.hint,this.h,{Key? key,this.controller, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: h,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          maxLines: 1,
          controller:  controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(
                    color: Color(0xff0E4C8F), width: 0.3.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: Color(0xff0E4C8F), width: 0.3.w),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,
              )),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
