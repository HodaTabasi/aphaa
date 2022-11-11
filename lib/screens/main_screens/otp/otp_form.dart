import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/SizeConfig.dart';
import '../../../helper/constant.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(45.w),
                child: TextFormField(
                  controller: NewAccountGetxController.to.num1Controller,
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode!);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(46.w),
                child: TextFormField(
                  controller: NewAccountGetxController.to.num2Controller,
                  focusNode: pin2FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(45.w),
                child: TextFormField(
                  controller: NewAccountGetxController.to.num3Controller,
                  focusNode: pin3FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(45.w),
                child: TextFormField(
                  controller: NewAccountGetxController.to.num4Controller,
                  focusNode: pin5FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(45.w),
                child: TextFormField(
                  controller: NewAccountGetxController.to.num5Controller,
                  focusNode: pin6FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(45.w),
                child: TextFormField(
                  controller: NewAccountGetxController.to.num6Controller,
                  focusNode: pin4FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 16.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
