
import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/screens/drawer_screens/Booking/my_appointment_booking.dart';
import 'package:aphaa_app/screens/drawer_screens/home_screen/my_medical_file_item.dart';
import 'package:aphaa_app/general/slider_wedgit.dart';
import 'package:aphaa_app/screens/drawer_screens/offers/offers_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/profile_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/Insurance_approvals/Insurance_approvals.dart';
import 'package:aphaa_app/screens/in_level_screen/family/family_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/medical_recipes/medical_recipes.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_record/payment_record.dart';
import 'package:aphaa_app/screens/in_level_screen/test_results/test_results.dart';
import 'package:aphaa_app/screens/in_level_screen/vaccinations/vaccinations.dart';
import 'package:aphaa_app/screens/in_level_screen/vital_signs/vital_signs.dart';
import 'package:aphaa_app/screens/main_screens/Doctor/my_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/App_api_controller.dart';
import '../../../model/offer.dart';
import '../../../model/service.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../in_level_screen/offer_ditails/offer_details.dart';
import '../../in_level_screen/recordbookings/RecordBooking.dart';
import '../../in_level_screen/sick_level/sick_leave.dart';
import '../../main_screens/Doctor/doctors_screen.dart';
import '../../main_screens/send_consult/consult_screen.dart';

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
          'assets/images/droup.svg', AppLocalizations.of(context)!.doctors, '', DoctorsScreen.routeName),
      Service(
          'assets/images/app_hestory.svg', AppLocalizations.of(context)!.appointment_book, '', RexcordBooking.routeName),
      Service(
          'assets/images/family.svg', AppLocalizations.of(context)!.my_family, '', FamillyScreen.routeName),

      Service(
          'assets/images/offers.svg', AppLocalizations.of(context)!.medical_offers, 'offers', OfferScreen.routeName),

      Service(
          'assets/images/paybook.svg', AppLocalizations.of(context)!.pay_book, '', PaymentRecord.routeName),
      Service(
          'assets/images/consult1.svg',
          AppLocalizations.of(context)!.my_medical_consultation,
          'consult',
          SendConsultScreen.routeName),
    ];

    // image: 'assets/images/offers.svg',
    // name: AppLocalizations.of(context)!.medical_offers,
    // prsee: () {
    // QuickServiceGetxController.to.fromHome = true;
    // Navigator.pushNamed(context, OfferScreen.routeName);
    //
    return  ListView(
          children: [
            SizedBox(
              height: 200.h,
              child:  FutureBuilder<List<Offers>>(
                future: AppApiController().getOffers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Center(child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, OfferDetails.routeName,arguments:{"data":snapshot.data![index]} );
                            },
                            child: SliderWidget(offers: snapshot.data![index],)));
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_data,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(AppLocalizations.of(context)!.medical_file,
            //       style:  TextStyle(
            //         color: Colors.black,
            //         fontSize: 16.sp,
            //         fontFamily: 'Tajawal',
            //         fontWeight: FontWeight.bold,
            //       )),
            // ),
            SizedBox(
              height: 8.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: service.length,
              physics: const NeverScrollableScrollPhysics(),
              padding:  EdgeInsets.symmetric(horizontal: 10.r,vertical: 8.r),
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  childAspectRatio: 300.w / 210.h),
              itemBuilder: (context, index) {
                return MyMedicalFileItem(
                  image: service[index].image,
                  name: service[index].name,
                  prsee: () {
                    if(service[index].decration =="offers" || service[index].decration == "consult")
                      QuickServiceGetxController.to.fromHome = true;

                    Navigator.pushNamed(context, service[index].routsName);
                  }
                      ,
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(AppLocalizations.of(context)!.family_file,
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 16.sp,
            //         fontFamily: 'Tajawal',
            //         fontWeight: FontWeight.bold,
            //       )),
            // ),
            // GridView.builder(
            //   shrinkWrap: true,
            //   itemCount: 1,
            //   physics: const NeverScrollableScrollPhysics(),
            //   padding:  EdgeInsets.symmetric(horizontal: 10.r),
            //   scrollDirection: Axis.vertical,
            //   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10.r,
            //       crossAxisSpacing: 10.r,
            //       childAspectRatio: 300 / 200),
            //   itemBuilder: (context, index) {
            //     return MyMedicalFileItem(
            //       image: 'assets/images/family.svg',
            //       name: AppLocalizations.of(context)!.my_family,
            //       prsee: () =>
            //           Navigator.pushNamed(context, FamillyScreen.routeName),
            //     );
            //   },
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // Padding(
            //   padding:  EdgeInsets.all(8.0.r),
            //   child: Text(AppLocalizations.of(context)!.appointment_book,
            //       style:  TextStyle(
            //         color: Colors.black,
            //         fontSize: 16.sp,
            //         fontFamily: 'Tajawal',
            //         fontWeight: FontWeight.bold,
            //       )),
            // ),
            // GridView.builder(
            //   shrinkWrap: true,
            //   itemCount: 1,
            //   physics: const NeverScrollableScrollPhysics(),
            //   padding:  EdgeInsets.symmetric(horizontal: 10.r),
            //   scrollDirection: Axis.vertical,
            //   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10.r,
            //       crossAxisSpacing: 10.r,
            //       childAspectRatio: 300 / 200),
            //   itemBuilder: (context, index) {
            //     return MyMedicalFileItem(
            //       image: 'assets/images/apphistory.svg',
            //       name: AppLocalizations.of(context)!.appointment_book,
            //       prsee: () =>
            //           Navigator.pushNamed(context, RexcordBooking.routeName),
            //     );
            //   },
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // Padding(
            //   padding:  EdgeInsets.all(8.0.r),
            //   child: Text(AppLocalizations.of(context)!.medical_offers,
            //       style:  TextStyle(
            //         color: Colors.black,
            //         fontSize: 16.sp,
            //         fontFamily: 'Tajawal',
            //         fontWeight: FontWeight.bold,
            //       )),
            // ),
            // GridView.builder(
            //   shrinkWrap: true,
            //   itemCount: 1,
            //   physics: const NeverScrollableScrollPhysics(),
            //   padding:  EdgeInsets.symmetric(horizontal: 10.r),
            //   scrollDirection: Axis.vertical,
            //   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10.r,
            //       crossAxisSpacing: 10.r,
            //       childAspectRatio: 300 / 200),
            //   itemBuilder: (context, index) {
            //     return MyMedicalFileItem(
            //       image: 'assets/images/offers.svg',
            //       name: AppLocalizations.of(context)!.medical_offers,
            //       prsee: () {
            //         QuickServiceGetxController.to.fromHome = true;
            //           Navigator.pushNamed(context, OfferScreen.routeName);},
            //     );
            //   },
            // ),
          ],
        );
  }
}
