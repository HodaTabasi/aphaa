import 'package:aphaa_app/screens/in_level_screen/vaccinations/p_vaccinations_item.dart';
import 'package:aphaa_app/screens/in_level_screen/vaccinations/vaccinations_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Vaccinations extends StatefulWidget {
  static String routeName = "/Vaccinations";
  @override
  State<Vaccinations> createState() => _VaccinationsState();
}

class _VaccinationsState extends State<Vaccinations>   with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.vaccsien,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: Container(
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
        body: Column(
          children: [
             SizedBox(height: 15.h,),
             Padding(
              padding:  EdgeInsets.only(left: 10.0.r,right: 10.r,top: 16.r,bottom: 0.r),
              child: Divider(
                height: 2.h,
                thickness: 1.w,
                endIndent: 16.w,
                indent: 16.w,
              ),
            ),
            // the tab bar with two items
            SizedBox(
              height: 60.h,
              child: TabBar(
                  indicatorWeight: 2,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  padding:  EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 8.r),
                  indicatorColor: const Color(0xff058638),
                  labelStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle:  TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.normal,
                  ),
                  labelColor: Colors.black,
                  // controller: controller,
                  tabs:  [
                    Tab(
                      text: AppLocalizations.of(context)!.scheduled_vaccinations,
                    ),
                    Tab(
                      text: AppLocalizations.of(context)!.previous_vaccinations,
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
                        return VaccinationItem();
                      }),
                  // // second tab bar viiew widget
                  ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return  P_VaccinationItem();
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
