import 'dart:io';

import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/edittext_item.dart';
import 'package:aphaa_app/helper/constant.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/drawer_screens/done/done_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_screen/payment_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentScreen extends StatefulWidget {
  static String routeName = "/PaymentScreen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNameController =
      TextEditingController(text: "VISA");
  TextEditingController cardNumberController =
      TextEditingController(text: "4000000000000002");
  TextEditingController cardDateController =
      TextEditingController(text: "12/22");
  TextEditingController cardCVVController = TextEditingController(text: "123");
  // PaymentSdkConfigurationDetails configuration =
  //     PaymentSdkConfigurationDetails();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   //after create page do configurations for payment
  //   // if(mounted){
  //   doPaymentConfiguration();
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.payment_data,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: InkWell(
              onTap: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Container(
                  margin: EdgeInsets.all(15.0.r),
                  padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
                  // alignment: Alignment.bottomLeft,
                  // width: 80,
                  // height: 500,
                  decoration: BoxDecoration(
                      color: const Color(0xff006F2C),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 15.sp,
                  )),
            ),
          ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/logo.png',
                width: 34.w,
                height: 30.h,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ],
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.all(8.0.r),
          //     child: InkWell(
          //       onTap: () {},
          //       child: SvgPicture.asset(
          //         'assets/images/Notification.svg',
          //         semanticsLabel: 'Acme Logo',
          //       ),
          //     ),
          //   ),
          // ]
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SvgPicture.asset(
                  'assets/images/visa1.svg',
                  semanticsLabel: 'Acme Logo',
                ),
                SizedBox(
                  height: 20.h,
                ),
                EditTextItem(
                  'assets/images/Profile.svg',
                  AppLocalizations.of(context)!.the_name_on_the_card,
                  controler: cardNameController,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                  child: Row(
                    children: [
                      MyPaymentTextFeild(
                        '1111 1111 1111 1111',
                        MediaQuery.of(context).size.width / 2.w,
                        controller: cardNumberController,
                      ),
                      MyPaymentTextFeild(
                        '07/22',
                        MediaQuery.of(context).size.width / 4.2.w,
                        controller: cardDateController,
                      ),
                      MyPaymentTextFeild(
                        '123',
                        MediaQuery.of(context).size.width / 4.7.w,
                        controller: cardCVVController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3.w,
                ),
                BtnLayout(AppLocalizations.of(context)!.pay_now, () {

                  // onBookClick(context);
                  // Navigator.pushNamed(context, DoneScreens.routeName);
                }),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/images/image1.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
  //
  // void onBookClick(context) {
  //   //TODO : validate form
  //   if (cardNameController.text.isEmpty) {
  //     //TODO : show error message for card name
  //     return;
  //   }
  //   if (cardNumberController.text.isEmpty) {
  //     //TODO : show error message for card number
  //     return;
  //   }
  //   if (cardDateController.text.isEmpty) {
  //     //TODO : show error message for card date
  //     return;
  //   }
  //   if (cardCVVController.text.isEmpty) {
  //     //TODO : show error message for cvv
  //     return;
  //   }
  //
  //   //TODO : [if pass] Start payment by calling startCardPayment method and handle the transaction details
  //
  //   startPaymentWithCard(context);
  // }
  //
  // void doPaymentConfiguration() {
  //  ///todo this data required to show payment page
  //   ///todo: here you need to add user data if exist at lest [*** user name and email]
  //   bool? isLogin = SharedPrefController().getValueFor<bool>(key: PrefKeysPatient.isLoggedIn.name);
  //   if(isLogin != null && !isLogin){
  //     return;
  //   }
  //   var firstName = "${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.firstName.name)}  ${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.lastName.name)}";
  //   var email = SharedPrefController().getValueFor<String>(key: PrefKeysPatient.email.name) ??"t@t.com";
  //   var mobile = SharedPrefController().getValueFor<String>(key: PrefKeysPatient.mobile.name) ??"+970111111111";
  //   if(email.isEmpty){
  //     email = "t@t.com";
  //   }
  //   print("$firstName $email , $mobile");
  //   var billingDetails = BillingDetails("$firstName", "$email",
  //       "$mobile", "st. 12", "eg", "dubai", "dubai", "12345");
  //   var shippingDetails = ShippingDetails("$firstName", "$email",
  //       "$mobile", "st. 12", "eg", "dubai", "dubai", "12345");
  //
  //   //todo this data required to show alternativePaymentMethods
  //   List<PaymentSdkAPms> apms = [];
  //   apms.add(PaymentSdkAPms.AMAN);
  //
  //   configuration = PaymentSdkConfigurationDetails(
  //       profileId: paymentProfileId,
  //       serverKey: paymentServerKey,
  //       clientKey: paymentClientKey,
  //       cartId: /*paymentCartIdLive*/"${DateTime.now().microsecondsSinceEpoch}",
  //       showBillingInfo: false,
  //       transactionType: PaymentSdkTransactionType.SALE,
  //        transactionClass: PaymentSdkTransactionClass.ECOM,
  //       forceShippingInfo: false,
  //       cartDescription: "مستشفى أبها الخاص العالمي",
  //       merchantName: paymentMerchantName,
  //       screentTitle: "Pay with Card",
  //        billingDetails: billingDetails,
  //        shippingDetails: shippingDetails,
  //       locale: PaymentSdkLocale.EN,
  //       //PaymentSdkLocale.AR or PaymentSdkLocale.DEFAULT
  //       amount: 1.00, //release her amount
  //       currencyCode: "SAR",
  //       merchantCountryCode: "SA",
  //       alternativePaymentMethods: apms,
  //       linkBillingNameWithCardHolderName: false);
  //
  //   //Options to show billing and shipping info
  //   configuration.showBillingInfo = true;
  //   configuration.showShippingInfo = false;
  //
  //   //Set merchant logo from the project assets:
  //   if (Platform.isIOS) {
  //     var theme = IOSThemeConfigurations();
  //     theme.logoImage = "assets/images/logo.png";
  //     configuration.iOSThemeConfigurations = theme;
  //   }
  // }
  //
  // void startPaymentWithCard(context) {
  //   //test card data todo 4111111111111111  || name = Visa || cvv = 123
  //   FlutterPaytabsBridge.startCardPayment(configuration, (event) {
  //     setState(() {
  //       print(event);
  //       if (event["status"] == "success") {
  //         // Handle transaction details here.
  //         var transactionDetails = event["data"];
  //         print(transactionDetails);
  //
  //         if (transactionDetails["isSuccess"]) {
  //           print("successful transaction");
  //           //todo : here show  successful transaction message
  //           Navigator.pushNamed(context, DoneScreens.routeName);
  //         } else {
  //           //todo : here show  invalid card message
  //           print("failed transaction");
  //         }
  //       } else if (event["status"] == "error") {
  //         // Handle error here.
  //       } else if (event["status"] == "event") {
  //         // Handle events here.
  //       }
  //     });
  //   });
  // }

}
