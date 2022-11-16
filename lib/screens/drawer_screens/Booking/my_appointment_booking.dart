import 'dart:io';

import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/model/time_avilable_response/AvailableTime.dart';
import 'package:aphaa_app/model/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkApms.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../api/controllers/hospital_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/dropdown_item.dart';
import '../../../general/edittext_item.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../helper/constant.dart';
import '../../../model/Clinic.dart';
import '../../../model/billResponse.dart';
import '../../../model/doctor.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../main_screens/Appointment Booking/time_appoiment_item.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper;

import '../done/done_screen.dart';

class MyAppointmentBooking extends StatefulWidget {
  bool? flag;
  static String routeName = "/my_booking_screen";

  MyAppointmentBooking({this.flag});

  @override
  State<MyAppointmentBooking> createState() => _MyAppointmentBookingState();
}

class _MyAppointmentBookingState extends State<MyAppointmentBooking>
    with Helpers, myHelper.Helpers1 {
  List<Clinic> myData = [];
  List<Doctor> myDataDoctor = [];

  late TextEditingController dateText;

  DateTime? _currentDate;

  var _value = 0;
  bool isLoading = false;

  PaymentSdkConfigurationDetails configuration =
      PaymentSdkConfigurationDetails();

  @override
  void initState() {
    dateText = TextEditingController();
    super.initState();
    // doPaymentConfiguration();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getListsData();
  }

  getListsData() async {
    isLoading = true;
    myData = await HospitalApiController().getClList() ?? [];
    setState(() {
      isLoading = false;
    });
    // Future.delayed(Duration.zero, () async {
    //   await HospitalApiController().getClDrs(clinicCode: myData[0].clinicCode).then((value) {
    //     NewAccountGetxController.to.changeMyDoctorList(value!.doctors!);
    //     myDataDoctor = value.doctors!;
    //     setState(() {
    //       isLoading = false;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.flag!
          ? null
          : AppBar(
              elevation: 0,
              // leadingWidth: 40,
              title: Text(AppLocalizations.of(context)!.appointment,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )),
              titleSpacing: 2,
              centerTitle: true,
              // leading: Container(
              //     margin: const EdgeInsets.all(15.0),
              //     padding: const EdgeInsets.all(5.0),
              //     // alignment: Alignment.bottomLeft,
              //     // width: 80,
              //     // height: 500,
              //     decoration: BoxDecoration(
              //         color: const Color(0xff006F2C),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: const Icon(
              //       Icons.arrow_back_ios,
              //       color: Colors.white,
              //       size: 15,
              //     )),
            ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GetBuilder<NewAccountGetxController>(
              builder: (value) => ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppLocalizations.of(context)!.head_of_appoitment_screen,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        DropDownItem(myData, 'assets/images/hospital.svg',
                            AppLocalizations.of(context)!.clenice_choesse),
                        DoctorDropDownItem(
                            value.doctorsList,
                            'assets/images/docgreen.svg',
                            AppLocalizations.of(context)!.dovtor_choesse),
                        Visibility(
                          visible: value.global != null,
                          child: EditTextItem('assets/images/Calendar.svg',
                              AppLocalizations.of(context)!.appoitment_date,
                              b: false, controler: dateText),
                        ),
                        if (!value.isChangeLoading)
                          Stack(
                            children: [
                              Visibility(
                                  visible: value.avilableDate.isEmpty &&
                                      !value.isChangeLoading,
                                  child: Center(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Image.asset("assets/images/calendar.png"),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text("لا يوجد مواعيد متاحة"),
                                    ],
                                  ))),
                              Visibility(
                                  visible: value.global != null ||
                                      value.avilableDate.isNotEmpty,
                                  child: widget1(value.avilableDate, value)),
                            ],
                          ),
                        Visibility(
                            visible: value.isChangeLoading,
                            child: const Center(
                                child: CircularProgressIndicator())),
                        Visibility(
                          visible: value.avilableTime.isNotEmpty,
                          child: Padding(
                            padding: EdgeInsets.all(16.0.r),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.green,
                                  size: 23.sp,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.r, 8.r, 8.r, 0.r),
                                  child: Text(
                                    AppLocalizations.of(context)!.time,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        if (!value.isChangeLoading)
                          Visibility(
                            visible: value.avilableDate.isNotEmpty,
                            child: Stack(
                              children: [
                                Visibility(
                                    visible: value.avilableTime.isEmpty &&
                                        !value.isChangeTimeLoading,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Image.asset(
                                            "assets/images/free_time.png"),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text("لا يوجد اوقات متاحة"),
                                      ],
                                    ))),
                                Visibility(
                                    visible: value.isChangeTimeLoading,
                                    child: const Center(
                                        child: CircularProgressIndicator())),
                                if (!value.isChangeTimeLoading)
                                  Column(
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.red),
                                              text: "  ${value.timeResponse?.reqAmt??''} ريال ",
                                              children: [
                                                TextSpan(text: value.timeResponse?.paymentNotice??''),
                                              ])),
                                      // Text(
                                      //   value.timeResponse!.paymentNotice ?? "",
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0.r),
                                        child: SizedBox(
                                          height: 100.h,
                                          // width: 80,
                                          child: Visibility(
                                            visible:
                                                value.avilableTime.isNotEmpty,
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  value.avilableTime.length,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h),
                                              scrollDirection: Axis.horizontal,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 1,
                                                      mainAxisSpacing: 10.h,
                                                      crossAxisSpacing: 10.w,
                                                      childAspectRatio:
                                                          280 / 200),
                                              itemBuilder: (context, index) {
                                                return TimeAppoitmentItem(
                                                    data: value
                                                        .avilableTime[index],
                                                    title: "",
                                                    value: index,
                                                    groupValue: _value,
                                                    onChanged: (value) =>
                                                        setState(() {
                                                          _value = value;
                                                        }));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Visibility(
                      visible: value.avilableTime.isNotEmpty &&
                          value.avilableTime.isNotEmpty,
                      child: BtnLayout(
                          AppLocalizations.of(context)!.appointment,
                          () => _performAction(value))),
                  // Image.asset(
                  //   "assets/images/image1.png",
                  //   fit: BoxFit.fitWidth,
                  // ),
                ],
              ),
            ),
    );
  }

  Widget widget1(List<String> markedDateMap, NewAccountGetxController value) {
    List<DateTime> event = markedDateMap.map((e) {
      return DateTime.parse(e);
    }).toList();
    print(event);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.h),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<Event>(
          locale: SharedPrefController()
                  .getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
          pageScrollPhysics: const NeverScrollableScrollPhysics(),
          onCalendarChanged: (DateTime date) {
            print(" ${date.year} ${date.month}");
            NewAccountGetxController.to.getDoctorSchedules(
                NewAccountGetxController.to.doctorCode, date.month, date.year);
          },
          onDayPressed: (DateTime date, List<Event> events) async {
            this.setState(() {
              _currentDate = date;
              dateText.text =
                  "${_currentDate!.year}-${_currentDate!.month}-${_currentDate!.day}";
            });
            if (event.contains(_currentDate)) {
              await HospitalApiController().getDoctorSchedDtl(
                  clinicCode: value.clinicCode,
                  doctorCode: value.doctorCode,
                  availableDay: _currentDate);
            } else {
              showRigectAlertDialog(context);
            }
          },
          weekendTextStyle: const TextStyle(
            color: Colors.black,
          ),
          thisMonthDayBorderColor: Colors.transparent,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
          customDayBuilder: (
            /// you can provide your own build function to make custom day containers
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
            /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
            /// This way you can build custom containers for specific days only, leaving rest as default.

            // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
            // if (day.day == 15) {
            //   return Center(
            //     child: Icon(Icons.local_airport),
            //   );
            // } else {
            //   return null;
            // }
          },
          weekFormat: false,
          // markedDatesMap: _markedDateMap,
          height: 340.0.h,
          width: 350.h,
          todayButtonColor: Colors.green,
          todayBorderColor: Colors.green,
          daysTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
          ),
          // showIconBehindDayText: true,
          // selectedDateTime: _currentDate,
          headerTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
          ),
          selectedDateTime: _currentDate,
          selectedDayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w700,
          ),
          weekdayTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
          ),
          weekDayBackgroundColor: Color(0xffEBF6EF),
          weekDayPadding: EdgeInsets.all(5.5),
          weekDayFormat: WeekdayFormat.standaloneShort,
          dayPadding: 8.w,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          daysHaveCircularBorder: true,
          showHeaderButton: true,
          headerMargin: EdgeInsets.all(16),
          isScrollable: true,
          multipleMarkedDates: MultipleMarkedDates(
              markedDates: event.map((e) {
            return MarkedDate(
                color: Color(0xffedeef5),
                date: e,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal,
                ));
          }).toList()),

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }

  Future<void> _performAction(value) async {
    if (_checkData(value)) {
      doPaymentConfiguration();
      await _performRigestration(value.clinicCode, value.doctorCode,
          dateText.text, value.avilableTime[_value]);
    }
  }

  bool _checkData(value) {
    if (value.clinicCode.isNotEmpty &&
        value.doctorCode.isNotEmpty &&
        dateText.text.isNotEmpty &&
        value.avilableTime[_value] != null) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  _performRigestration(String clinicCode, String doctorCode, String dateText,
      AvailableTime avilableTime) async {
    showLoaderDialog(context);
    ApiResponse response = await HospitalApiController().addAppoitment(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        clinicCode: clinicCode,
        doctorCode: doctorCode,
        patientName: SharedPrefController()
            .getValueFor(key: PrefKeysPatient.firstName.name),
        consultTime24: avilableTime.consultTime24,
        patientId: SharedPrefController()
            .getValueFor(key: PrefKeysPatient.identityNumber.name),
        patientMOB: SharedPrefController()
            .getValueFor(key: PrefKeysPatient.mobile.name),
        resDate: dateText,
        consultSNo: avilableTime.consultSNo,
        resRemarks: "lap-lap");
    print(response.success);
    if (response.success) {
      Navigator.pop(context);
      onBookClick(context);
      // showAlertDialog(context);
    } else {
      Navigator.pop(context);
      showSnackBar(context, message: response.message, error: true);
    }
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
        amount: NewAccountGetxController.to.timeResponse?.reqAmt??0.0,
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
      setState(()  {
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
