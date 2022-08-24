import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/drawer_screens/home_screen/my_medical_file_item.dart';
import 'package:aphaa_app/general/slider_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/service.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    List<Service> service = [
      Service('assets/images/secment.svg','المؤشرات الحيوية',''),
      Service('assets/images/result.svg','نتائج الفحوصات',''),
      Service('assets/images/dco40714.svg','أطبائي',''),
      Service('assets/images/40714.svg','مرافقات التأمين',''),
      Service('assets/images/407s14.svg','إجازاتي المرضية',''),
      Service('assets/images/40697.svg','وصفاتي الطبية',''),
      Service('assets/images/d40714.svg','التطعيمات',''),
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
              );
            },
          ),
        ],
      )
        // bottomNavigationBar: BottomNavigationBar(),
    );
  }
}


