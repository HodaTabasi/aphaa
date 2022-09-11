import 'package:aphaa_app/api/controllers/App_api_controller.dart';
import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/screens/main_screens/Appointment%20Booking/time_appoiment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper ;

import '../../../api/controllers/quick_service_api_controller.dart';
import '../../../general/dropdown_item.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

import '../../../get/quick_service_getx_controller.dart';
import '../../../model/api_response.dart';
import '../../../preferences/shared_pref_controller.dart';

class AppointmentBooking extends StatefulWidget {
  static String routeName = "/appointment_booking";

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking>
    with Helpers, myHelper.Helpers {
  var myData = ["شركة1", "شركة2", "شركة3"];
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
    getAllDoctors();
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
              padding: EdgeInsets.all(5.0.r),
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
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
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
                // DropDownItem(myData, 'assets/images/hospital.svg',
                //     AppLocalizations.of(context)!.clenice_choesse,
                //     dropIntValue: 3),
                DoctorDropDownItem(myDataDoctor, 'assets/images/docgreen.svg',
                    AppLocalizations.of(context)!.dovtor_choesse,
                    dropIntValue: 2),
                EditTextItem(
                  'assets/images/Calendar.svg',
                  AppLocalizations.of(context)!.appoitment_date,
                  b: false,
                  controler: dateText,
                ),
                widget1(),
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
                        padding: EdgeInsets.fromLTRB(8.r, 8.r, 8.r, 0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100.h,
                    // width: 80,
                    child: GridView.builder(
                      itemCount: 3,
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10.r,
                          childAspectRatio: 280 / 200),
                      itemBuilder: (context, index) {
                        return TimeAppoitmentItem(
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
          BtnLayout(AppLocalizations.of(context)!.appointment, () =>_performAction()),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  Widget widget1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<Event>(
          locale: SharedPrefController()
                  .getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
          pageScrollPhysics: const NeverScrollableScrollPhysics(),
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() {
              _currentDate = date;
              dateText.text =
                  "${_currentDate!.year}-${_currentDate!.month}-${_currentDate!.day}";
            });
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

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }

  Future<void> _performAction() async {
    if (_checkData()) {
      await _sendConsult();
    }
  }

  bool _checkData() {

    if (email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        name.text.isNotEmpty  &&
        name.text.isNotEmpty  &&
        dateText.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _sendConsult() async {
    showLoaderDialog(context);
    ApiResponse apiResponse = await QuickServiceApiController().appointment(email: email.text,mobile: phone.text,name: name.text,date: dateText.text,clinic: QuickServiceGetxController.to.clinicName,doctor: QuickServiceGetxController.to.doctorId,time: "11:00");
    if (apiResponse.success) {
      Navigator.pop(context);
      showAlertDialog(context);
    }
    Navigator.pop(context);
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }


}
