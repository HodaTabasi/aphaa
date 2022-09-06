import 'package:aphaa_app/screens/main_screens/Doctor/DoctorItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../api/controllers/App_api_controller.dart';
import '../../../model/doctor.dart';
import '../Appointment Booking/doctor_filtter.dart';

class MyDoctorsScreen extends StatefulWidget {
  static String routeName = "/my_doctor";
  @override
  State<MyDoctorsScreen> createState() => _MyDoctorsScreenState();
}

class _MyDoctorsScreenState extends State<MyDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.my_doctor,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding:  EdgeInsets.all(5.0.r),
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
        ),
          actions: [
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ]
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(height: 10.h,),
          FutureBuilder<List<Doctor>>(
            future: AppApiController().getAllDoctors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return  Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:  EdgeInsets.symmetric(horizontal: 10.r),
                    scrollDirection: Axis.vertical,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w,
                        childAspectRatio: 240/330
                    ),
                    itemBuilder: (context, index) {
                      return  DoctorItem(snapshot.data![index]);
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
          // Padding(
          //   padding:  EdgeInsets.all(8.0.r),
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     itemCount: 4,
          //     physics: const NeverScrollableScrollPhysics(),
          //     padding:  EdgeInsets.symmetric(horizontal: 10.r),
          //     scrollDirection: Axis.vertical,
          //     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       mainAxisSpacing: 15.h,
          //       crossAxisSpacing: 15.w,
          //       childAspectRatio: 240/330
          //     ),
          //     itemBuilder: (context, index) {
          //       return  DoctorItem();
          //     },
          //   ),
          // ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
