import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../get/language_getx_controller.dart';
import '../../../helper/SizeConfig.dart';
import '../../../model/service.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../auth/login1/login_screen.dart';
import '../Appointment Booking/appointement_booking.dart';
import '../Doctor/doctors_screen.dart';
import '../open_medocal/opening_medical_file.dart';
import '../send_consult/consult_screen.dart';

class QuickServices extends StatelessWidget {
  static String routeName = "/quick_services";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Service> service = [
      Service(
          'assets/images/consult.svg',
          AppLocalizations.of(context)!.consultation_request,
          AppLocalizations.of(context)!.consultDec,
          SendConsultScreen.routeName),
      Service(
          'assets/images/date.svg',
          AppLocalizations.of(context)!.appointment,
          AppLocalizations.of(context)!.appointment_dec,
          AppointmentBooking.routeName),
      Service('assets/images/doctor.svg', AppLocalizations.of(context)!.doctors,
          AppLocalizations.of(context)!.doctor_desc, DoctorsScreen.routeName),
      Service(
          'assets/images/report.svg',
          AppLocalizations.of(context)!.opening_medical_file,
          AppLocalizations.of(context)!.opening_medical_file_dec,
          OpeningMedicalFile.routeName),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 90.w,
        leading: InkWell(
          onTap: (){
            LanguageGetxController.to.changeLanguage();
          },
          child: Container(
            margin: EdgeInsets.all(10.0.r),
            // padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
                color: const Color(0xff006F2C),
                borderRadius: BorderRadius.circular(10.r)),
            child: Text(SharedPrefController()
                              .getValueFor<String>(key: PrefKeys.lang.name) ==
                          'ar'
                      ? " English"
                      : "العربية",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 185.w,
            height: 150.h,
          ),
          // SizedBox(
          //   height: 8.h,
          // ),
          // Text(
          //   AppLocalizations.of(context)!.welcome,
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 15.sp,
          //     fontFamily: 'Tajawal',
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          // SizedBox(
          //   height: 8.h,
          // ),
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Text(
              AppLocalizations.of(context)!.quick_service,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.w,
              crossAxisSpacing: 5.h,
            ),
            itemBuilder: (context, index) {
              return ServiceItem(
                image: service[index].image,
                name: service[index].name,
                decration: service[index].decration,
                prsee: () {
                  if (service[index].routsName == OpeningMedicalFile.routeName)
                    QuickServiceGetxController.to.requestType = '1';
                  Navigator.pushNamed(context, service[index].routsName);
                },
              );
            },
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          // Text(
          //   AppLocalizations.of(context)!.welcome2,
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 15.sp,
          //     fontFamily: 'Tajawal',
          //     // fontWeight: FontWeight.normal,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: 20.h,),
          Row(
            children: [
              Spacer(),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, LoginScreen1.routeName);
              },
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5.h,
                      fontSize: 14.0.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      /* letterSpacing: 0.0, */
                    ),
                  ),style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xff0E4C8F)
                      )
                    ) ,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      // padding: EdgeInsets.all(14.r),
                      fixedSize: Size(140.w, 44.h),
                  )),
              Spacer()
            ],
          ),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 15.r),
          //   child: Directionality(
          //     textDirection: TextDirection.rtl,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         InkWell(
          //             onTap: () =>
          //                 Navigator.pushNamed(context, LoginScreen1.routeName),
          //             child: GeneratedGroup40943Widget()),
          //         // OrWidget(),
          //         // InkWell(
          //         //   onTap: () =>
          //         //       Navigator.pushNamed(context, NewAccountFirst.routeName),
          //         //   child: GeneratedGroup40944Widget(),
          //         // )
          //       ],
          //     ),
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
