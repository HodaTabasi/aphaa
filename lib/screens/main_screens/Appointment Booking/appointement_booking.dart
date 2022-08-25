import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/screens/main_screens/Appointment%20Booking/time_appoiment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../general/dropdown_item.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class AppointmentBooking extends StatefulWidget {
  static String routeName = "/appointment_booking";
  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> with Helpers {
  var myData = ['اختر العيادة', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(5.0),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              )),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.head_of_appoitment_screen,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Form(
            child: Column(
              children: [
                EditTextItem('assets/images/Profile.svg',
                    AppLocalizations.of(context)!.pasent_name),
                EditTextItem('assets/images/Message.svg',
                    AppLocalizations.of(context)!.email),
                EditTextItem('assets/images/phone.svg',
                    AppLocalizations.of(context)!.phone),
                DropDownItem(myData, 'assets/images/hospital.svg',
                    AppLocalizations.of(context)!.clenice_choesse),
                DropDownItem(myData, 'assets/images/docgreen.svg',
                    AppLocalizations.of(context)!.dovtor_choesse),
                EditTextItem('assets/images/Calendar.svg', AppLocalizations.of(context)!.appoitment_date),
                widget1(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: Colors.green,
                        size: 23,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          AppLocalizations.of(context)!.time,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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
                    height: 100,
                    // width: 80,
                    child: GridView.builder(
                      itemCount: 3,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        childAspectRatio: 280/200
                      ),
                      itemBuilder: (context, index) {
                        return TimeAppoitmentItem() ;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BtnLayout(AppLocalizations.of(context)!.appointment, () {
            showAlertDialog(context);
          }),
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
          locale: 'ar',
          pageScrollPhysics: const NeverScrollableScrollPhysics(),
          onDayPressed: (DateTime date, List<Event> events) {
            // this.setState(() => _currentDate = date);
          },
          weekendTextStyle: const TextStyle(
            color: Colors.green,
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
          height: 370.0,
          // selectedDateTime: _currentDate,
          daysHaveCircularBorder: false,

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
