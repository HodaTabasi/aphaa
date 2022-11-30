import 'dart:io';

import 'package:aphaa_app/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../helper/constant.dart';
import '../../../model/billResponse.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../done/done_screen.dart';

class PaymentMethod with Helpers1{
  var context;
  late PaymentSdkConfigurationDetails configuration;
  PaymentMethod(this.context){
    configuration =
    PaymentSdkConfigurationDetails();
  }

  void onBookClick(context) {
    //TODO : validate form
    // if (cardNameController.text.isEmpty) {
    //   //TODO : show error message for card name
    //   return;
    // }
    // if (cardNumberController.text.isEmpty) {
    //   //TODO : show error message for card number
    //   return;
    // }
    // if (cardDateController.text.isEmpty) {
    //   //TODO : show error message for card date
    //   return;
    // }
    // if (cardCVVController.text.isEmpty) {
    //   //TODO : show error message for cvv
    //   return;
    // }

    //TODO : [if pass] Start payment by calling startCardPayment method and handle the transaction details

    startPaymentWithCard(context);
  }

  void doPaymentConfiguration() {
    ///todo this data required to show payment page
    ///todo: here you need to add user data if exist at lest [*** user name and email]
    bool? isLogin = SharedPrefController()
        .getValueFor<bool>(key: PrefKeysPatient.isLoggedIn.name);
    if (isLogin != null && !isLogin) {
      return;
    }
    var firstName =
        "${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.firstName.name)}  ${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.lastName.name)}";
    var email = SharedPrefController()
        .getValueFor<String>(key: PrefKeysPatient.email.name) ??
        "t@t.com";
    var mobile = SharedPrefController()
        .getValueFor<String>(key: PrefKeysPatient.mobile.name) ??
        "+970111111111";
    if (email.isEmpty) {
      email = "t@t.com";
    }
    print("$firstName $email , $mobile");
    var billingDetails = BillingDetails("$firstName", "$email", "$mobile",
        "st. 12", "eg", "dubai", "dubai", "12345");
    var shippingDetails = ShippingDetails("$firstName", "$email", "$mobile",
        "st. 12", "eg", "dubai", "dubai", "12345");

    //todo this data required to show alternativePaymentMethods
    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);

    configuration = PaymentSdkConfigurationDetails(
        profileId: paymentProfileId,
        serverKey: paymentServerKey,
        clientKey: paymentClientKey,
        cartId: /*paymentCartIdLive*/ "${DateTime.now().microsecondsSinceEpoch}",
        showBillingInfo: false,
        transactionType: PaymentSdkTransactionType.SALE,
        transactionClass: PaymentSdkTransactionClass.ECOM,
        forceShippingInfo: false,
        cartDescription: "مستشفى أبها الخاص العالمي",
        merchantName: paymentMerchantName,
        screentTitle: "Pay with Card",
        billingDetails: billingDetails,
        shippingDetails: shippingDetails,
        locale: PaymentSdkLocale.EN,
        //PaymentSdkLocale.AR or PaymentSdkLocale.DEFAULT
        amount: double.parse("${NewAccountGetxController.to.timeResponse?.reqAmt}"),
        //release her amount
        currencyCode: "SAR",
        merchantCountryCode: "SA",
        alternativePaymentMethods: apms,
        linkBillingNameWithCardHolderName: false);

    //Options to show billing and shipping info
    configuration.showBillingInfo = true;
    configuration.showShippingInfo = false;

    //Set merchant logo from the project assets:
    if (Platform.isIOS) {
      var theme = IOSThemeConfigurations();
      theme.logoImage = "assets/images/logo.png";
      configuration.iOSThemeConfigurations = theme;
    }
  }

  void startPaymentWithCard(context) {
    //test card data todo 4111111111111111  || name = Visa || cvv = 123
    FlutterPaytabsBridge.startCardPayment(configuration, (event) {
        print(event);
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);

          if (transactionDetails["isSuccess"]) {
            print("successful transaction");
            //todo : here show  successful transaction message
            doIt();

          } else {
            //todo : here show  invalid card message
            showSnackBar(context, message: "failed transaction", error: true);
            print("failed transaction");
          }
        } else if (event["status"] == "error") {
          print(event);
          print("dsfsd ${NewAccountGetxController.to.timeResponse?.reqAmt}");
          showSnackBar(context, message:event["message"], error: true);
          // Handle error here.
        } else if (event["status"] == "event") {
          // Handle events here.
        }

    });
  }

  Future<void> doIt() async {
    billResponse? response = await HospitalApiController().setConsInv();
    if(response != null){
      Navigator.pushNamed(context, DoneScreens.routeName);
    } else {
      showSnackBar(context, message: " حصل خطا ",error: true);
    }
  }

}