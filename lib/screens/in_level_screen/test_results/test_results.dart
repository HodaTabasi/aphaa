import 'package:aphaa_app/helper/FileProcess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../helper/nerwork_connectivity.dart';
import 'Rab_result.dart';
import 'lab_result.dart';

class TestResults extends StatefulWidget {
  static String routeName = "/TestResults";

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  @override
  Widget build(BuildContext context) {
    FileProcess.checkDocumentFolder();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.test_results,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Container(
                margin: EdgeInsets.all(15.0.r),
                padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
                decoration: BoxDecoration(
                    color: const Color(0xff006F2C),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15.sp,
                )),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0.r, right: 10.r, top: 16.r, bottom: 0),
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
                onTap: (index) {
                },
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
                padding:
                EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 8.r),
                indicatorColor: const Color(0xff058638),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal,
                ),
                labelColor: Colors.black,
                // controller: controller,
                tabs: [
                  Tab(
                    text: AppLocalizations.of(context)!.lab_test,
                  ),
                  Tab(
                    text: AppLocalizations.of(context)!.rab_test,
                  ),
                ],
              ),
            ),
            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  LabResult(_networkConnectivity),
                  // // second tab bar viiew widget
                  RabResult(_networkConnectivity),
                ],
              ),
            ),


          ],
        ),
        // bottomSheet: Image.asset("assets/images/image1.png",fit: BoxFit.cover),
      ),
    );
  }
}
