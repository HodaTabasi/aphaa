import 'dart:io';

import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:aphaa_app/helper/constant.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/drawer_screens/done/done_screen.dart';

class ReservationData extends StatefulWidget {
  static String routeName = "/ReservationData";
  @override
  State<ReservationData> createState() => _ReservationDataState();
}

class _ReservationDataState extends State<ReservationData> with Helpers1{
  var instalation;

  PaymentSdkConfigurationDetails configuration =
  PaymentSdkConfigurationDetails();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //after create page do configurations for payment
    // if(mounted){
    // }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs1 =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if(routeArgs1 != null){
      instalation = routeArgs1['data'];
      print('instalation ${instalation?.price}');
      doPaymentConfiguration();
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.reservation_data,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
          // actions: [
          //   Padding(
          //     padding:  EdgeInsets.all(8.0.r),
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
      body: ListView(
        children: [
          SizedBox(height: 50.h),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              AppLocalizations.of(context)!.reservation_data,
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(10.0.r),
            child: Stack(children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xffF5F8FB),
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0.r),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0.r),
                        child: Image.network(
                          instalation.image,
                          width: 80.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        instalation.title,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${instalation.clinic}',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 13.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: 0,
                top: 20.h,
                // bottom: 0,
                // left: 0,
                child: Container(
                  // width: 30,
                  // height: 35,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8.r),
                  decoration: BoxDecoration(
                      color: Color(0xff0E4C8F),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.r),
                          topRight: Radius.circular(8.r))),
                  child: Text(
                    "${AppLocalizations.of(context)!.the_total} : ${instalation.price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 20.h),
          //  Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
          //   child: Text(
          //     AppLocalizations.of(context)!.payment_method,
          //     style:  TextStyle(
          //       color: Color(0xff2D2D2D),
          //       fontSize: 15.sp,
          //       fontFamily: 'Tajawal',
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // // ListView.builder(
          // //   itemCount: 2,
          // //   shrinkWrap: true,
          // //     physics: NeverScrollableScrollPhysics(),
          // //     itemBuilder: (context,index){
          // //   return PaymentSelectedItem(
          // //     title: 'مدى',
          // //     value: 0,
          // //     groupValue: _value,
          // //     onChanged: (value) => setState(() => _value = value),
          // //   );
          // // }),
          // //
          // PaymentSelectedItem(
          //   title: 'مدى',
          //   value: 0,
          //   groupValue: _value,
          //   onChanged: (value) => setState(() => _value = value),
          // ),
          // PaymentSelectedItem(
          //   title: 'فيزا',
          //   value: 1,
          //   groupValue: _value,
          //   onChanged: (value) => setState(() => _value = value),
          // ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       SvgPicture.asset(
          //         'assets/images/add.svg',
          //         semanticsLabel: 'Acme Logo',
          //       ),
          //       Padding(
          //         padding:  EdgeInsets.all(8.0.r),
          //         child: Text(
          //           AppLocalizations.of(context)!.add_a_new_payment_card,
          //           style: TextStyle(
          //               fontFamily: 'Tajawal', color: Colors.black, fontSize: 13.sp),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              AppLocalizations.of(context)!.request_summary,
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.order_cost,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${instalation.price} ر.س ',
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.tax,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Text(
                    '${instalation.price *0.15}  ر.س ',
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.total_bill,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Text(
                    '${instalation.price *0.15}  ر.س ',
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
           SizedBox(height: 20.h,),
          BtnLayout(AppLocalizations.of(context)!.continue_to_pay, () {
            onBookClick(context);
            // Navigator.pushNamed(context, PaymentScreen.routeName);
          }),
           SizedBox(height: 10.h,),
        ],
      ),
    );
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
    bool? isLogin = SharedPrefController().getValueFor<bool>(key: PrefKeysPatient.isLoggedIn.name);
    if(isLogin != null && !isLogin){
      return;
    }
    var firstName = "${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.firstName.name)}  ${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.lastName.name)}";
    var email = SharedPrefController().getValueFor<String>(key: PrefKeysPatient.email.name) ??"t@t.com";
    var mobile = SharedPrefController().getValueFor<String>(key: PrefKeysPatient.mobile.name) ??"+970111111111";
    if(email.isEmpty){
      email = "t@t.com";
    }
    print("$firstName $email , $mobile");
    var billingDetails = BillingDetails("$firstName", "$email",
        "$mobile", "st. 12", "eg", "dubai", "dubai", "12345");
    var shippingDetails = ShippingDetails("$firstName", "$email",
        "$mobile", "st. 12", "eg", "dubai", "dubai", "12345");

    //todo this data required to show alternativePaymentMethods
    List<PaymentSdkAPms> apms = [];
    apms.add(PaymentSdkAPms.AMAN);

    configuration = PaymentSdkConfigurationDetails(
        profileId: paymentProfileId,
        serverKey: paymentServerKey,
        clientKey: paymentClientKey,
        cartId: /*paymentCartIdLive*/"${DateTime.now().microsecondsSinceEpoch}",
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
        amount: instalation.price *0.15, //release her amount
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
      setState(() {
        print(event);
        if (event["status"] == "success") {
          // Handle transaction details here.
          var transactionDetails = event["data"];
          print(transactionDetails);

          if (transactionDetails["isSuccess"]) {
            print("successful transaction");
            //todo : here show  successful transaction message
            Navigator.pushNamed(context, DoneScreens.routeName);
          } else {
            //todo : here show  invalid card message
            showSnackBar(context, message: "failed transaction",error: true);
            print("failed transaction");
          }
        } else if (event["status"] == "error") {
          // Handle error here.
        } else if (event["status"] == "event") {
          // Handle events here.
        }
      });
    });
  }
}
