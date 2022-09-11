import 'package:aphaa_app/screens/in_level_screen/medical_recipes/medical_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../model/prescriptionList.dart';

class MedicalRecipes extends StatefulWidget {
  static String routeName = "/MedicalRecipes";

  @override
  State<MedicalRecipes> createState() => _MedicalRecipesState();
}

class _MedicalRecipesState extends State<MedicalRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.medical_file_number,
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
          FutureBuilder<List<prescriptionList>>(
            future: HospitalApiController().getRxList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return  Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child:    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return MedicalRecipesItem(snapshot.data![index]);
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
