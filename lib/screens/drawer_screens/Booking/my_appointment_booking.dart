import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../api/controllers/App_api_controller.dart';
import '../../../api/controllers/hospital_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/dropdown_item.dart';
import '../../../general/edittext_item.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../model/Clinic.dart';
import '../../../model/doctor.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../main_screens/Appointment Booking/time_appoiment_item.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper ;

class MyAppointmentBooking extends StatefulWidget {
  bool? flag;
  static String routeName = "/my_booking_screen";

  MyAppointmentBooking({this.flag});

  @override
  State<MyAppointmentBooking> createState() => _MyAppointmentBookingState();
}

class _MyAppointmentBookingState extends State<MyAppointmentBooking>
    with Helpers ,myHelper.Helpers {
  List<Clinic> myData = [];
  List<Doctor> myDataDoctor = [];

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController dateText;

  DateTime? _currentDate;

  var _value = 0;


  @override
  void initState() {
    name = TextEditingController(text: "aisal yosef alsawaf");
    email = TextEditingController(text: "aisal@hotmail.com");
    phone = TextEditingController(text: "0154421157");
    dateText = TextEditingController(text: "1997-05-02");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getListsData();
  }
  getListsData() async {
    myData = await HospitalApiController().getClList() ?? [];
    Future.delayed(Duration.zero, () async {
      await HospitalApiController().getClDrs(clinicCode: myData[0].clinicCode).then((value) {
        NewAccountGetxController.to.changeMyDoctorList(value!.doctors!);
        myDataDoctor = value.doctors!;
      });
    });
  }

  Future<void> getAllDoctors() async {
    myDataDoctor = await AppApiController().getAllDoctors();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.flag! ?null:AppBar(
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
      body: GetBuilder<NewAccountGetxController>(
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
                  DropDownItem(myData, 'assets/images/hospital.svg',
                      AppLocalizations.of(context)!.clenice_choesse),
                  DoctorDropDownItem(value.doctorsList, 'assets/images/docgreen.svg',
                      AppLocalizations.of(context)!.dovtor_choesse),
                  EditTextItem('assets/images/Calendar.svg',
                      AppLocalizations.of(context)!.appoitment_date,b: false,controler: dateText),
                  widget1(value.avilableDate,value),
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.green,
                          size: 23.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.r, 8.r, 8.r, 0.r),
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
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: SizedBox(
                      height: 100.h,
                      // width: 80,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: value.avilableTime.length,
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 280 / 200),
                        itemBuilder: (context, index) {
                          return TimeAppoitmentItem(
                            data:value.avilableTime[index],
                              title: "",
                              value: index,
                              groupValue: _value,
                              onChanged: (value) => setState(() {
                                    _value = value;
                                  }));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            BtnLayout(AppLocalizations.of(context)!.appointment, () {
              showAlertDialog(context);
            }),
            Image.asset(
              "assets/images/image1.png",
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget widget1(List<String> markedDateMap, NewAccountGetxController value) {

    List<DateTime> event = markedDateMap.map((e){
      return DateTime.parse(e);
    }).toList();
    print(event);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<Event>(
          locale: SharedPrefController()
              .getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
          pageScrollPhysics: const NeverScrollableScrollPhysics(),
          onDayPressed: (DateTime date, List<Event> events) async {
            this.setState(()  {
              _currentDate = date;
              dateText.text =
              "${_currentDate!.year}-${_currentDate!.month}-${_currentDate!.day}";
            });
            if(event.contains(_currentDate)){
              await HospitalApiController().getDoctorSchedDtl(clinicCode: value.clinicCode,doctorCode: value.doctorCode,availableDay: _currentDate);
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
            fontSize: 16.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
          ),
          // showIconBehindDayText: true,
          // selectedDateTime: _currentDate,
          headerTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
          ),
          selectedDateTime: _currentDate,
          selectedDayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
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
          dayPadding: 8,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          daysHaveCircularBorder: true,
          showHeaderButton: false,
          headerMargin: EdgeInsets.all(16),
          isScrollable: true,
          multipleMarkedDates: MultipleMarkedDates(markedDates:event.map((e) {
            return MarkedDate(color: Color(0xffedeef5), date: e,textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.normal,
            ));
          }).toList() ),
          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
