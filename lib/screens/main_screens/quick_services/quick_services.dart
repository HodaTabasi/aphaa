import 'package:aphaa_app/helper/constant.dart';
import 'package:aphaa_app/screens/auth/create_account/create_account.dart';
import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/or_widget.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/register_button/both_togther.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/service.dart';
import '../Appointment Booking/appointement_booking.dart';
import '../Doctor/doctors_screen.dart';
import '../open_medocal/opening_medical_file.dart';
import '../send_consult/consult_screen.dart';
import 'login_button/togther.dart';

class QuickServices extends StatelessWidget {
  static String routeName = "/quick_services";

  @override
  Widget build(BuildContext context) {
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
        leading: Container(
          margin:  EdgeInsets.all(10.0.r),
          // padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
              color: const Color(0xff006F2C),
              borderRadius: BorderRadius.circular(10.r)),
          child:  Text(
            "العربية",
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
           SizedBox(
            height: 30.h,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 203.w,
            height: 161.h,
          ),
           SizedBox(
            height: 15.h,
          ),
          Text(
            AppLocalizations.of(context)!.welcome,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
           SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: Text(
              AppLocalizations.of(context)!.quick_service,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           SizedBox(
            height: 5.h,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            padding:  EdgeInsets.symmetric(horizontal: 10.r),
            scrollDirection: Axis.vertical,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
            ),
            itemBuilder: (context, index) {
              return ServiceItem(
                image: service[index].image,
                name: service[index].name,
                decration: service[index].decration,
                prsee: () {
                  Navigator.pushNamed(context, service[index].routsName);
                },
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.welcome2,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Tajawal',
              // fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 25.r),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, LoginScreen.routeName),
                      child: Directionality(textDirection: TextDirection.ltr,child: GeneratedGroup40943Widget())),
                  OrWidget(),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, CreateAccount.routeName),
                    child: GeneratedGroup40944Widget(),
                  )
                ],
              ),
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
}
