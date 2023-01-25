import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../firebase/fb_auth_controller.dart';
import '../../../helper/SizeConfig.dart';
import '../../../helper/constant.dart';
import '../../../helper/helpers.dart';
import '../../../model/sms/send_model.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> with Helpers1{
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  FocusNode? pin4FocusNode;
  late String myCode;
  late String smsCode;
  late List<String> numbers;

  onPress() async {
    myCode = NewAccountGetxController.to.makeCode();
    showLoaderDialog(context);
    SMSSndModel? response = await HospitalApiController().checkSMSCode(otpCode: myCode,patientId: NewAccountGetxController.to.identityNumber!);
    if(response?.otpFlag == 'true'){
      await FireBaseAuthController().afterPhoneVerification(context,1);
    }else {
      Navigator.pop(context);
      showSnackBar(
          context, message: response?.rejReason??'',
          error: true);
    }
  }

  void _getClipboardText() async {
    // final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    // String? clipboardText = clipboardData?.text;
    // numbers = clipboardText!.split("");
    // if (numbers.length == 4) {
    //   NewAccountGetxController.to.num1Controller.text = numbers[0];
    //   NewAccountGetxController.to.num2Controller.text = numbers[1];
    //   NewAccountGetxController.to.num3Controller.text = numbers[2];
    //   NewAccountGetxController.to.num6Controller.text = numbers[3];
    //   setState(() {
    //     onPress();
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void deactivate() {
    NewAccountGetxController.to.num1Controller.clear();
    NewAccountGetxController.to.num2Controller.clear();
    NewAccountGetxController.to.num3Controller.clear();
    NewAccountGetxController.to.num6Controller.clear() ;
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    controller:NewAccountGetxController.to.num1Controller,
                    autofocus: true,
                    focusNode: pin1FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode!);
                      // _getClipboardText();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: getProportionateScreenWidth(46),
                  child: TextFormField(
                    controller: NewAccountGetxController.to.num2Controller,
                    focusNode: pin2FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value){
                      nextField(value, pin3FocusNode!);
                      // if(value.length == 0){
                      //   pin2FocusNode!.requestFocus();
                      // }
                    // _getClipboardText();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    controller: NewAccountGetxController.to.num3Controller,
                    focusNode: pin3FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value) {
                      nextField(value, pin5FocusNode!);
                      // if(value.length == 0){
                      //   pin2FocusNode!.requestFocus();
                      // }
                    // _getClipboardText();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: getProportionateScreenWidth(45),
                  child: TextFormField(
                    controller: NewAccountGetxController.to.num6Controller,
                    focusNode: pin5FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin5FocusNode!.unfocus();

                        // if(value.length == 0){
                        //   pin3FocusNode!.requestFocus();
                        // }
                        // _getClipboardText();
                        if(validation())
                          onPress();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool validation() {
    if( NewAccountGetxController.to.num1Controller.text.isNotEmpty &&
    NewAccountGetxController.to.num2Controller.text.isNotEmpty &&
    NewAccountGetxController.to.num3Controller.text.isNotEmpty &&
    NewAccountGetxController.to.num6Controller.text.isNotEmpty){
      return true;
    }
    return false;
  }
}
