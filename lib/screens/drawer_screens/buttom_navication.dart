import 'dart:io';

import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../get/change_name_getx_controller.dart';
import '../in_level_screen/recordbookings/RecordBooking.dart';
import 'Booking/my_appointment_booking.dart';
import 'home_screen/home_screen.dart';
import 'offers/offers_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    MyAppointmentBooking(flag: true),
    OfferScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ChangeGetxController.to.changeName(SharedPrefController().getValueFor(key: PrefKeysPatient.firstName.name), "");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> pageName = [
      '',
      AppLocalizations.of(context)!.reservations,
      AppLocalizations.of(context)!.add_appointment,
      AppLocalizations.of(context)!.offers,
      AppLocalizations.of(context)!.profile_personly,
    ];

    return GetX<ChangeGetxController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: pageIndex == 0
                ? AppBar(
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
                    // ],
                    leading: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: CircleAvatar(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 30.w,
                          height: 28.h,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    // leadingWidth: 70.w,
                    title: Text.rich(TextSpan(
                        text: '${AppLocalizations.of(context)!.hello}، ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Tajawal'),
                        children: [
                          TextSpan(
                            text: '${controller.getName}',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'Tajawal'),
                          )
                        ])),
                  )
                : AppBar(
                    elevation: 0,
                    // leadingWidth: 40,
                    title: Text(pageName[pageIndex],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        )),
                    titleSpacing: 2,
                    centerTitle: true,
              leading:
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
                    actions: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, ButtomNavigations.routeName, (route) => false);
                        },
                        child: Visibility(
                          visible: pageName[pageIndex] == AppLocalizations.of(context)!.add_appointment,
                          child: Padding(
                            padding: EdgeInsets.all(16.0.r),
                            child: Text(AppLocalizations.of(context)!.exit1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ),
                      )
                    ],

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
            body: WillPopScope(child: pages[pageIndex], onWillPop: onWillPop),
            // resizeToAvoidBottomInset: false,

            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  // sets the background color of the `BottomNavigationBar`
                  canvasColor: Colors.white,
                  // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                  // primaryColor: Colors.red,
                  textTheme: Theme.of(context)
                      .textTheme
                      .copyWith(caption: new TextStyle(color: Colors.blue))),
              // sets the inactive color of the `BottomNavigationBar`
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                onTap: (val) {

                    setState(() {
                      pageIndex = val;
                    });

                },

                elevation: 10,
                // selectedItemColor: Colors.blue,
                // unselectedItemColor: Colors.grey,
                currentIndex: pageIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/apphome.svg',
                          color:
                          pageIndex == 0 ? Color(0xff0E4C8F) : Colors.grey,
                          semanticsLabel: 'Acme Logo'),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/appdate.svg',
                        semanticsLabel: 'Acme Logo',
                        color: pageIndex == 1 ? Color(0xff0E4C8F) : Colors.grey,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/appApp.svg',
                        height: 45,
                        semanticsLabel: 'Acme Logo',
                        // color: pageIndex == 2 ?Color(0xff0E4C8F) :Colors.grey,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/appoffers.svg',
                        semanticsLabel: 'Acme Logo',
                        color: pageIndex == 3 ? Color(0xff0E4C8F) : Colors.grey,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/appprofile.svg',
                        semanticsLabel: 'Acme Logo',
                        color: pageIndex == 4 ? Color(0xff0E4C8F) : Colors.grey,
                      ),
                      label: ''),


                ],
              ),
            ));
      },
    );
  }
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      _displayDialog(context);
      // print("exit double click");
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content:  Text(AppLocalizations.of(context)!.dialog_m),
            actions: <Widget>[
              TextButton(
                child:  Text(
                  AppLocalizations.of(context)!.exit,
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () async {
                  exit(0);
                },
              ),
              TextButton(
                child:  Text(
                  AppLocalizations.of(context)!.cancel,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
  // exit(0);
}
