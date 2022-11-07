import 'package:aphaa_app/screens/in_level_screen/recordbookings/next_booking.dart';
import 'package:aphaa_app/screens/in_level_screen/recordbookings/prev_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../helper/nerwork_connectivity.dart';


class RexcordBooking extends StatefulWidget {
  static String routeName = "/RexcordBooking";
  bool fromInLevel;

  RexcordBooking({this.fromInLevel = true});

  @override
  State<RexcordBooking> createState() => _RexcordBookingState();
}

class _RexcordBookingState extends State<RexcordBooking> {
  int selectedPageNumber = 1;

  String offSet = "1";

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.fromInLevel
            ? AppBar(
                elevation: 0,
                title: Text(AppLocalizations.of(context)!.reservations,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                    )),
                titleSpacing: 2,
                leading: Container(
                    margin: EdgeInsets.all(15.0.r),
                    padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
                    decoration: BoxDecoration(
                        color: const Color(0xff006F2C),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15.sp,
                    )),
              )
            : null,
        body: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0.r, right: 10.r, top: 16.r, bottom: 0),
              child: Divider(
                height: 2.h,
                thickness: 1.w,
                endIndent: 16.w,
                indent: 16.w,
              ),
            ),
            // the tab bar with two items
            SizedBox(
              height: 60.h,
              child: TabBar(
                onTap: (index) {
                  selectedPageNumber = 1;
                  offSet = "1";
                },
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
                padding:
                    EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 8.r),
                indicatorColor: const Color(0xff058638),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal,
                ),
                labelColor: Colors.black,
                // controller: controller,
                tabs: [
                  Tab(
                    text: AppLocalizations.of(context)!.scheduled_reservations,
                  ),
                  Tab(
                    text: AppLocalizations.of(context)!.previous_bookings,
                  ),
                ],
              ),
            ),
            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  NextBooking(_networkConnectivity),
                  // // second tab bar viiew widget
                  PrevBooking(_networkConnectivity)
                ],
              ),
            ),
            // Expanded(
            //   child: Image.asset(
            //     "assets/images/image1.png",
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
