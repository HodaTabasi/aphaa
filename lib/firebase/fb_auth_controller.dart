import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/screens/main_screens/change_password/change_password.dart';
import 'package:aphaa_app/screens/main_screens/otp/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../api/controllers/auth_api_controller.dart';
import '../model/api_response.dart';
import '../preferences/shared_pref_controller.dart';
import '../screens/auth/create_account/create_account_next.dart';
import 'package:aphaa_app/helper/helpers.dart';

import '../screens/drawer_screens/buttom_navication.dart';

class FireBaseAuthController with Helpers1{
  FirebaseAuth _fbAuth = FirebaseAuth.instance;
  static FireBaseAuthController? _inestance ;
  FireBaseAuthController._();

  factory FireBaseAuthController(){
    return _inestance ??=FireBaseAuthController._();
  }

  Future<void> verifyPhoneNumber({phoneNumber,context}) async {

    await _fbAuth.verifyPhoneNumber(
      phoneNumber: '+966$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {
        NewAccountGetxController.to.smsCode = credential.smsCode!;
        Navigator.pushNamed(context, OTPScreen.routeName);
        //save data code
        print("success ${credential.smsCode}");

      },
      verificationFailed: (FirebaseAuthException e) {

      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        print("ggggggggtg $verificationId");
        // Sign the user in (or link) with the credential
        await _fbAuth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );

  }

  Future<void> verifyPhoneNumber1({userPhone, context,flag}) async {
    print("gggggggggggg ${userPhone}");
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    // String userPhoneNumber = "+91 " + _phoneNumberController.text.toString().trim();
    // print(userPhoneNumber);
    //  +970123456789

    /// Handle This
    // oTPPinTrials.value += 1 ;

    /// if Phone Auto Handled OTP Received Message
    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential _phoneAuthCredential ) async {
      print('verificationCompleted');
      print(_phoneAuthCredential);
      // Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
      afterPhoneVerification (context,flag) ;
      // if(  Provider.of<MainProvider>(context,
      //     listen: false).isReset){
      //   PhoneAuthCredential _phoneAuthCredential =
      //   PhoneAuthProvider.credential(verificationId: Provider.of<NewUserProvider>(context, listen: false).verificationId , smsCode: "" );
      //   Provider.of<MainProvider>(context,
      //       listen: false).smsCode = _phoneAuthCredential.smsCode!;
      // }else{
      //   afterPhoneVerification (context) ;
      // }
    }

    void verificationFailed( FirebaseAuthException _e) {
      print('verificationFailed');
      print(_e);
      print(_e.code);

    }


    /// if Phone Didn't Handled OTP Received Message Automaticly
    // void codeSent(String verificationId, [int code]) {
    void codeSent(String _verificationId, int? _resendToken ) async {
      print( 'codeSent' );
      print( _verificationId );
      print( 'resendToken' );
      print( _resendToken.toString() );

     NewAccountGetxController.to.verificationId = _verificationId ;


      Navigator.pushNamed(context, OTPScreen.routeName);
    }

    void codeAutoRetrievalTimeout(String _verificationId ) {
      print('codeAutoRetrievalTimeout');
      // _authController.registerRefuseReason.value = errorOTPTimeOut ;
      print( _verificationId );

    }

    await _fbAuth.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: "+970$userPhone" ,
      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      // timeout: Duration(milliseconds: 10000),
      timeout: const Duration(seconds: 120),
      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      // verificationCompleted: verificationCompleted ,
      /// Called when the verification is failed
      verificationFailed: verificationFailed ,
      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent ,
      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  },
    ); // All the callbacks are above


  }

  Future<void> handleManualOTP (String _otpCode ,context,flag) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential _phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: NewAccountGetxController.to.verificationId! , smsCode: _otpCode );

    print(_phoneAuthCredential.smsCode);

    if(NewAccountGetxController.to.isReset){
      // Provider.of<MainProvider>(context,
      //     listen: false).smsCode = _phoneAuthCredential.smsCode!;
      // String phone = Provider.of<NewUserProvider>(context, listen: false)
      //     .phoneController
      //     .text;
      //
      // String countryCode = Provider.of<NewUserProvider>(context, listen: false)
      //     .countryCode;
      //
      // print(phone+countryCode);
      // sendSMS(countryCode+phone,_phoneAuthCredential.smsCode,context);

    }else{
      afterPhoneVerification (context,flag) ;
    }
  }


  Future<void> afterPhoneVerification(context,flag) async {
    if(NewAccountGetxController.to.isReset) {
      Navigator.pushReplacementNamed(context, ChangePassword.routeName);
    } else {
      showLoaderDialog(context);
      ApiResponse apiResponse = await AuthApiController()
          .register(student: NewAccountGetxController.to.patient, flag: flag);

      if (apiResponse.success) {
        SharedPrefController()
            .setValuePCode(pCode: NewAccountGetxController.to.patient.p_code!);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, ButtomNavigations.routeName);
      } else {
        Navigator.pop(context);
        showSnackBar(
          context,
          message: apiResponse.message,
          error: !apiResponse.success,
        );
      }
    }
  }
}