import 'package:aphaa_app/model/ServiceTest.dart';
import 'package:aphaa_app/screens/in_level_screen/test_results/test_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../preferences/shared_pref_controller.dart';

class TestResults extends StatefulWidget {
  static String routeName = "/TestResults";

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: Container(
            margin: EdgeInsets.all(15.0.r),
            padding: EdgeInsets.all(5.0.r),
            // alignment: Alignment.bottomLeft,
            // width: 80,
            // height: 500,
            decoration: BoxDecoration(
                color: const Color(0xff006F2C),
                borderRadius: BorderRadius.circular(5.r)),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15.sp,
            )),
      ),
      body: FutureBuilder<List<ServiceTest>>(
        future: HospitalApiController().getLabReports(patientCode: SharedPrefController().getValueFor(key: "p_code")),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return TestResultItem(serviceTest: snapshot.data![index]);
                    }),
                Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.fitWidth,
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                    fontFamily: 'Tajawal'),
              ),
            );
          }
        },
      ),
    );
  }
}
