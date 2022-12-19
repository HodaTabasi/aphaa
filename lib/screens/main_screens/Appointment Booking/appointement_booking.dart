import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/model/time_avilable_response/AvailableTime.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/screens/main_screens/Appointment%20Booking/time_appoiment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper ;
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../api/controllers/quick_service_api_controller.dart';
import '../../../general/dropdown_item.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

import '../../../get/new_account_getx_controller.dart';
import '../../../get/quick_service_getx_controller.dart';
import '../../../model/Clinic.dart';
import '../../../model/api_response.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../drawer_screens/Booking/edittext_item_calender.dart';

class AppointmentBooking extends StatefulWidget {
  static String routeName = "/appointment_booking";

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking>
    with Helpers, myHelper.Helpers1 {
  List<Clinic> myData = [];
  List<Doctor> myDataDoctor = [];

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController dateText;


  bool isLoading = false;


  @override
  void initState() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    dateText = TextEditingController();
    super.initState();
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
        appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.appointment,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Container(
                margin: EdgeInsets.all(15.0.r),
                padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
                // alignment: Alignment.bottomLeft,
                // width: 80,
                // height: 500,
                decoration: BoxDecoration(
                    color: const Color(0xff006F2C),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15.sp,
                )),
          ),
        ),
        body: isLoading ? Center(child: CircularProgressIndicator(),)
            : GetBuilder<NewAccountGetxController>(
          builder: (value) =>ListView(
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
                    EditTextItem(
                      'assets/images/Profile.svg',
                      AppLocalizations.of(context)!.pasent_name,
                      controler: name,
                    ),
                    EditTextItem(
                      'assets/images/Message.svg',
                      AppLocalizations.of(context)!.email,
                      controler: email,
                    ),
                    EditTextItem(
                      'assets/images/phone.svg',
                      AppLocalizations.of(context)!.phone,
                      controler: phone,
                    ),
                    DropDownItem(myData, 'assets/images/hospital.svg',
                        AppLocalizations.of(context)!.clenice_choesse),
                    DoctorDropDownItem(value.doctorsList, 'assets/images/docgreen.svg',
                        AppLocalizations.of(context)!.dovtor_choesse),
                    // Visibility(
                    //   visible: value.doctorsList.isNotEmpty,
                    //   child: DoctorDropDownItem(value.doctorsList, 'assets/images/docgreen.svg',
                    //       AppLocalizations.of(context)!.dovtor_choesse),
                    // ),
                    Visibility(
                      visible: value.global != null,
                      child: EditTextItemCalender('assets/images/Calendar.svg',
                          AppLocalizations.of(context)!.appoitment_date,
                          b: false, controler: dateText),),

                    if (!value.isChangeLoading)
                      Stack(
                        children: [
                          Visibility(
                              visible: value.avilableDate.isEmpty &&
                                  !value.isChangeLoading || value.global == null,
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
                              visible: value.global != null &&
                                  value.avilableDate.isNotEmpty && value.avilableTime.isEmpty,
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
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                value.changeClaenderVisabiltyFlag();
                                value.currentDate = null;
                                value.GroupValue = -1;
                              },
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 14.0.r),
                                child:   SvgPicture.asset(
                                    'assets/images/Calendar.svg',
                                    semanticsLabel: 'Acme Logo'
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
                                        Image.asset("assets/images/free_time.png"),
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
                                  Visibility(
                                    visible:
                                    value.avilableTime.isNotEmpty,
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(color: Colors.red),
                                            text: "  ${value.timeResponse?.reqAmt??''} ريال ",
                                            children: [
                                              TextSpan(text: value.timeResponse?.paymentNotice??''),
                                            ])),
                                  ),
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
                                                groupValue: value.GroupValue,
                                                onChanged: (value1) =>
                                                    setState(() {
                                                      value.GroupValue = value1;
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
                  visible: value.avilableTime.isNotEmpty && value.avilableTime.isNotEmpty,
                  child: BtnLayout(AppLocalizations.of(context)!.appointment, ()=>_performAction(value.avilableTime[NewAccountGetxController.to.GroupValue]))),
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
              NewAccountGetxController.to.currentDate = date;
              dateText.text =
              "${NewAccountGetxController.to.currentDate!.year}-${NewAccountGetxController.to.currentDate!.month}-${NewAccountGetxController.to.currentDate!.day}";
            });
            if (event.contains(NewAccountGetxController.to.currentDate)) {
              await HospitalApiController().getDoctorSchedDtl(
                  clinicCode: value.clinicCode,
                  doctorCode: value.doctorCode,
                  availableDay: NewAccountGetxController.to.currentDate);
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
          todayButtonColor: Colors.white,
          todayBorderColor: Colors.green,
          todayTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
          ),
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
          selectedDateTime: NewAccountGetxController.to.currentDate,
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

  Future<void> _performAction(AvailableTime avilableTime) async {
    if (_checkData()) {
      await _sendConsult(avilableTime);
    }
  }

  bool _checkData() {

    if (phone.text.isNotEmpty &&
        name.text.isNotEmpty  &&
        name.text.isNotEmpty  &&
        dateText.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.enter_required_data, error: true);
    return false;
  }

  Future<void> _sendConsult(AvailableTime avilableTime) async {
    showLoaderDialog(context);
    ApiResponse apiResponse = await QuickServiceApiController().appointment(email: email.text,mobile: phone.text,name: name.text,date: dateText.text,clinic: QuickServiceGetxController.to.clinicName,doctor: QuickServiceGetxController.to.doctorName,time: avilableTime.consultTime24,cost: "3.1");
    if (apiResponse.success) {
      Navigator.pop(context);
      NewAccountGetxController.to.GroupValue = -1;
      this.dateText.text = "";
      name.text = "";
      email.text = "";
      phone.text = "";
      NewAccountGetxController.to.clearData();
      showAlertDialog1(context,message: "تم حجز الموعد بنجاح",message2: "في حال تم لم يتم تاكيد الحجز خلال ساعتين سيتم الغاء الحجز",flag: true);
    }else {
      Navigator.pop(context);
      showSnackBar(
        context,
        message: apiResponse.message,
        error: !apiResponse.success,
      );
    }
  }

  @override
  void deactivate() {
    NewAccountGetxController.to.clearDataBeforeSend();
    super.deactivate();
  }

}
