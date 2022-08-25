
import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/drawer_screens/Booking/my_appointment_booking.dart';
import 'package:aphaa_app/screens/drawer_screens/home_screen/my_medical_file_item.dart';
import 'package:aphaa_app/general/slider_wedgit.dart';
import 'package:aphaa_app/screens/drawer_screens/offers/offers_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/profile_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/Insurance_approvals/Insurance_approvals.dart';
import 'package:aphaa_app/screens/in_level_screen/family/family_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/medical_recipes/medical_recipes.dart';
import 'package:aphaa_app/screens/in_level_screen/test_results/test_results.dart';
import 'package:aphaa_app/screens/in_level_screen/vaccinations/vaccinations.dart';
import 'package:aphaa_app/screens/in_level_screen/vital_signs/vital_signs.dart';
import 'package:aphaa_app/screens/main_screens/Doctor/my_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/service.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../in_level_screen/recordbookings/RecordBooking.dart';
import '../../in_level_screen/sick_level/sick_leave.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    List<Service> service = [
      Service('assets/images/secment.svg', AppLocalizations.of(context)!.vital_signs, '',
          VitalSigns.routeName),
      Service('assets/images/result.svg', AppLocalizations.of(context)!.test_results, '',
          TestResults.routeName),
      Service('assets/images/dco40714.svg', AppLocalizations.of(context)!.ny_doctor, '',
          MyDoctorsScreen.routeName),
      Service('assets/images/40714.svg', AppLocalizations.of(context)!.insurance_approvals, '',
          InsuranceApprovals.routeName),
      Service('assets/images/407s14.svg', AppLocalizations.of(context)!.my_sick_leave, '',
          SickLeave.routeName),
      Service('assets/images/40697.svg', AppLocalizations.of(context)!.my_medical_recipes, '',
          MedicalRecipes.routeName),
      Service(
          'assets/images/d40714.svg', AppLocalizations.of(context)!.vaccsien, '', Vaccinations.routeName),
    ];

    return  ListView(
          children: [
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                  itemCount: 2,
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SliderWidget();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.medical_file,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 7,
              physics: const NeverScrollableScrollPhysics(),
              padding:  EdgeInsets.symmetric(horizontal: 10.r),
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  childAspectRatio: 300 / 200),
              itemBuilder: (context, index) {
                return MyMedicalFileItem(
                  image: service[index].image,
                  name: service[index].name,
                  prsee: () =>
                      Navigator.pushNamed(context, service[index].routsName),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.family_file,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              padding:  EdgeInsets.symmetric(horizontal: 10.r),
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  childAspectRatio: 300 / 200),
              itemBuilder: (context, index) {
                return MyMedicalFileItem(
                  image: 'assets/images/family.svg',
                  name: AppLocalizations.of(context)!.my_family,
                  prsee: () =>
                      Navigator.pushNamed(context, FamillyScreen.routeName),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Text(AppLocalizations.of(context)!.appointment_book,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              padding:  EdgeInsets.symmetric(horizontal: 10.r),
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  childAspectRatio: 300 / 200),
              itemBuilder: (context, index) {
                return MyMedicalFileItem(
                  image: 'assets/images/apphistory.svg',
                  name: AppLocalizations.of(context)!.appointment_book,
                  prsee: () =>
                      Navigator.pushNamed(context, RexcordBooking.routeName),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Text(AppLocalizations.of(context)!.medical_offers,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              padding:  EdgeInsets.symmetric(horizontal: 10.r),
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  childAspectRatio: 300 / 200),
              itemBuilder: (context, index) {
                return MyMedicalFileItem(
                  image: 'assets/images/offers.svg',
                  name: AppLocalizations.of(context)!.medical_offers,
                  prsee: () =>
                      Navigator.pushNamed(context, OfferScreen.routeName),
                );
              },
            ),
          ],
        );
  }
}
