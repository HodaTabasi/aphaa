import 'package:aphaa_app/screens/drawer_screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../in_level_screen/recordbookings/RecordBooking.dart';
import 'Booking/my_appointment_booking.dart';
import 'home_screen/home_screen.dart';
import 'offers/offers_screen.dart';

class ButtomNavigations extends StatefulWidget {
  static String routeName = "/bottom_navigation";

  @override
  State<ButtomNavigations> createState() => _ButtomNavigationsState();
}

class _ButtomNavigationsState extends State<ButtomNavigations> {

  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    RexcordBooking(fromInLevel: false),
    MyAppointmentBooking(),
    OfferScreen(),
    ProfileScreen(),
  ];

  List<String> pageName = [
    '',
    'الحجوزات',
    'اضافة موعد',
    'العروض',
    'الملف الشخصي',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: pageIndex == 0?AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/logo.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
          // leadingWidth: 70.w,
          title: Text.rich(TextSpan(
              text: 'اهلا، ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Tajawal'),
              children: [
                TextSpan(
                  text: 'محمد محمود',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Tajawal'),
                )
              ])),
        ) :AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(pageName[pageIndex],
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
        body: pages[pageIndex],
        bottomNavigationBar:  Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              // primaryColor: Colors.red,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.blue))), // sets the inactive color of the `BottomNavigationBar`
          child :BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (val){
              setState(() {
                pageIndex = val;
              });
            },
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/images/apphome.svg',
                  color: pageIndex == 0 ?Color(0xff0E4C8F) :Colors.grey,
                  semanticsLabel: 'Acme Logo'
              ),label: ''),
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/images/appdate.svg',
                  semanticsLabel: 'Acme Logo',
                color: pageIndex == 1 ?Color(0xff0E4C8F) :Colors.grey,
              ),label: ''),
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/images/appApp.svg',
                  height: 45,
                  semanticsLabel: 'Acme Logo',
                // color: pageIndex == 2 ?Color(0xff0E4C8F) :Colors.grey,
              ),label: ''),
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/images/appoffers.svg',
                  semanticsLabel: 'Acme Logo',
                color: pageIndex == 3 ?Color(0xff0E4C8F) :Colors.grey,
              ),label: ''),
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/images/appprofile.svg',
                  semanticsLabel: 'Acme Logo',
                color: pageIndex == 4 ?Color(0xff0E4C8F) :Colors.grey,
              ),label: ''),
            ],
          ),
        )
    );
  }
}
