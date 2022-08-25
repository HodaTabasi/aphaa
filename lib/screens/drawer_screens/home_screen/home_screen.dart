import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/drawer_screens/home_screen/my_medical_file_item.dart';
import 'package:aphaa_app/general/slider_wedgit.dart';
import 'package:aphaa_app/screens/drawer_screens/offers/offers_screen.dart';
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
      Service('assets/images/secment.svg','المؤشرات الحيوية','',VitalSigns.routeName),
      Service('assets/images/result.svg','نتائج الفحوصات','',TestResults.routeName),
      Service('assets/images/dco40714.svg','أطبائي','',MyDoctorsScreen.routeName),
      Service('assets/images/40714.svg','مرافقات التأمين','',InsuranceApprovals.routeName),
      Service('assets/images/407s14.svg','إجازاتي المرضية','',SickLeave.routeName),
      Service('assets/images/40697.svg','وصفاتي الطبية','',MedicalRecipes.routeName),
      Service('assets/images/d40714.svg','التطعيمات','',Vaccinations.routeName),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/Notification.svg',
                semanticsLabel: 'Acme Logo',
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Image.asset(
              'assets/images/logo.png',
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        // leadingWidth: 70.w,
        title: Text.rich(TextSpan(
            text: 'اهلا، ',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Tajawal'),
            children: [
              TextSpan(
                text: 'محمد محمود',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Tajawal'),
              )
            ])),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 2,
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return SliderWidget();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ملفي الطبي : ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 7,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 300/200
            ),
            itemBuilder: (context, index) {
              return MyMedicalFileItem(
                image: service[index].image,
                name: service[index].name,
                prsee: ()=>Navigator.pushNamed(context, service[index].routsName),
              );
            },
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ملف العائلة ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 300/200
            ),
            itemBuilder: (context, index) {
              return MyMedicalFileItem(
                image: 'assets/images/family.svg',
                name: 'عائلتي',
                prsee: ()=>Navigator.pushNamed(context, FamillyScreen.routeName),
              );
            },
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('سجل المواعيد ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 300/200
            ),
            itemBuilder: (context, index) {
              return MyMedicalFileItem(
                image: 'assets/images/apphistory.svg',
                name: 'سجل المواعيد',
                prsee: ()=>Navigator.pushNamed(context, RexcordBooking.routeName),
              );
            },
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('العروض الطبية ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 300/200
            ),
            itemBuilder: (context, index) {
              return MyMedicalFileItem(
                image: 'assets/images/offers.svg',
                name: 'العروض الطبية',
                prsee: ()=>Navigator.pushNamed(context, OfferScreen.routeName),
              );
            },
          ),
        ],
      )
        // bottomNavigationBar: BottomNavigationBar(),
    );
  }
}


