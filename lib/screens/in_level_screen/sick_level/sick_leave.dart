import 'package:aphaa_app/model/SickLeaves/SickLeaves.dart';
import 'package:aphaa_app/model/SickLeaves/SickLeavesResponse.dart';
import 'package:aphaa_app/screens/in_level_screen/sick_level/sick_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../general/my_separator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../preferences/shared_pref_controller.dart';

class SickLeave extends StatefulWidget {
  static String routeName = "/SickLeave";

  @override
  State<SickLeave> createState() => _SickLeaveState();
}

class _SickLeaveState extends State<SickLeave> {
  int selectedPageNumber = 1;

  String offSet = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,AppLocalizations.of(context)!.date_of_visit
          title: Text(AppLocalizations.of(context)!.sick_leaves,
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
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ]),
      body: FutureBuilder<SickLeavesResponse?>(
        future: HospitalApiController().getSickLeaves(
            patientCode: SharedPrefController().getValueFor(key: "p_code")),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.leaves!.length,
                      itemBuilder: (context, index) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.leaves!.length,
                            itemBuilder: (context, index) {
                              return SickItem(
                                leaveId: snapshot.data!.leaves![index].leaveId!,
                                sickDate:
                                    snapshot.data!.leaves![index].repDate!,
                                sickDocName: snapshot
                                    .data!.leaves![index].doctor!.doctorName!,
                                sickName:
                                    snapshot.data!.leaves![index].leaveId!,
                              );
                            });
                      }),
                ),
                Visibility(
                  visible: snapshot.data!.pages!.length > 1,
                  child: NumberPagination(
                    onPageChanged: (int pageNumber) {
                      //do somthing for selected page
                      setState(() {
                        selectedPageNumber = pageNumber;
                        offSet = snapshot
                            .data!.pages![selectedPageNumber - 1].offset!;
                      });
                    },
                    pageTotal: snapshot.data!.pages!.length,
                    pageInit: selectedPageNumber,
                    // picked number when init page
                    colorPrimary: Colors.green,
                    colorSub: Colors.white,
                    fontFamily: 'Tajawal',
                  ),
                ),
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
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
