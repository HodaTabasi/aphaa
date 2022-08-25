import 'package:aphaa_app/screens/in_level_screen/recordbookings/scedual_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RexcordBooking extends StatefulWidget {
  static String routeName = "/RexcordBooking";
  bool fromInLevel ;

  RexcordBooking({this.fromInLevel = true});

  @override
  State<RexcordBooking> createState() => _RexcordBookingState();
}

class _RexcordBookingState extends State<RexcordBooking> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.fromInLevel ?AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text('الحجوزات',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: Container(
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
        ) :null,
        body: Column(
          children: [
            const SizedBox(height: 15,),
            const Padding(
              padding:  EdgeInsets.only(left: 10.0,right: 10,top: 16,bottom: 0),
              child: Divider(
                height: 2,
                thickness: 1,
                endIndent: 16,
                indent: 16,
              ),
            ),
            // the tab bar with two items
            SizedBox(
              height: 60,
              child: TabBar(
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
                padding: const EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 8),
                indicatorColor: const Color(0xff058638),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal,
                ),
                labelColor: Colors.black,
                // controller: controller,
                tabs: const [
                  Tab(
                    text: 'الحجوزات المجدولة',
                  ),
                  Tab(
                    text: 'الحجوزات السابقة',
                  ),
                ],
              ),

            ),
            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return ScedualBookingItem();
                      }),
                  // // second tab bar viiew widget
                  ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return  ScedualBookingItem();
                      }),
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
