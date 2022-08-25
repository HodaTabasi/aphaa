import 'package:aphaa_app/helper/constant.dart';
import 'package:aphaa_app/screens/auth/create_account/create_account.dart';
import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/or_widget.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/register_button/both_togther.dart';
import 'package:aphaa_app/screens/main_screens/quick_services/service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        leadingWidth: 90,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          // padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xff006F2C),
              borderRadius: BorderRadius.circular(10)),
          child: const Text(
            "العربية",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
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
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 203,
            height: 161,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.welcome,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.quick_service,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Tajawal',
              // fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                    child: GeneratedGroup40943Widget()),
                OrWidget(),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, CreateAccount.routeName),
                  child: GeneratedGroup40944Widget(),
                )
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
}
