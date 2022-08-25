import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/my_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../drawer_screens/Booking/my_appointment_booking.dart';
import '../../in_level_screen/medical_recipes/medical_recipes.dart';
import '../../in_level_screen/test_results/test_results.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoctorDetails extends StatefulWidget {
  static String routeName = "/doctor_details";

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  late VideoPlayerController _controller;
  bool v = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

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
          ]),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 260.h,
            margin: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.8.r),
            ),
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0.r),
                child: Image.network(
                  'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                  // width: 144,
                  // height: 114,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                 EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'د. محمد محمود',
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'طبيب أسنان',
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0.r, vertical: 8.r),
            child: MySeparator(color: Color(0xff058638)),
          ),
           SizedBox(
            height: 30.h,
          ),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              AppLocalizations.of(context)!.about_me,
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15.r,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              'هذا النص افتراض ، هذا النص افتراض ، هذا النص افتراضي ، هذا النص افتراضي',
              style:  TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal',
                  height: 2
                  // fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.date_of_visit,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, MedicalRecipes.routeName),
                    child: SvgPicture.asset(
                      'assets/images/image4.svg',
                      semanticsLabel: 'Acme Logo',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, MedicalRecipes.routeName),
                  child: SvgPicture.asset(
                    'assets/images/image3.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
            child: Row(
              children: [
                Expanded(
                    child: BtnLayout(
                        AppLocalizations.of(context)!.book_an_appointment,
                        () => Navigator.pushNamed(
                            context, MyAppointmentBooking.routeName))),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: InkWell(
                    onTap: () {
                      showVidetAlertDialog(context);
                    },
                    child: SvgPicture.asset(
                      'assets/images/image5.svg',
                      semanticsLabel: 'Acme Logo',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  showVidetAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffF2F2F2),
      content: Container(
          width: 300.w,height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        // padding: EdgeInsets.all(16),
        child: Stack(children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(width: 300.w,height: 200.h,
            ),
          ),
          Opacity(
            opacity: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();

                    // v = !v;
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
          ),
        ]),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
