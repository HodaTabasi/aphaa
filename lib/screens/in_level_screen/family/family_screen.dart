import 'package:aphaa_app/model/FamillyMember.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../api/controllers/hospital_controller.dart';
import 'familly_item.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FamillyScreen extends StatefulWidget {

  static String routeName = "/family";

  @override
  State<FamillyScreen> createState() => _FamillyScreenState();
}

class _FamillyScreenState extends State<FamillyScreen> {

  @override
  void initState() {
    // TODO: implement initState
    print("fesfrwa");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.my_family,
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
                  borderRadius: BorderRadius.circular(5)),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
          actions: [
            Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ]),
      body: ListView(
        children: [
          FutureBuilder<List<FamillyMember>>(
            future: HospitalApiController().getFamilyMembers(SharedPrefController().getValueFor(key: "medicalId")),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return  Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child:  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return FamillyItem(snapshot.data![index]);
                      }),
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
        ],
      ),
      bottomSheet:  Image.asset(
        "assets/images/image1.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
