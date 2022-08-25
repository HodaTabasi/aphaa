import 'package:aphaa_app/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';

class OpeningMedicalFile extends StatefulWidget {
  static String routeName = "/open_media_file";

  @override
  State<OpeningMedicalFile> createState() => _OpeningMedicalFileState();
}

class _OpeningMedicalFileState extends State<OpeningMedicalFile> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.opening_medical_file,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
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
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: Text(
              AppLocalizations.of(context)!.head_of_consult_screen,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Form(
            child: Column(
              children: [
                EditTextItem('assets/images/Profile.svg',
                    AppLocalizations.of(context)!.pasent_name),
                EditTextItem('assets/images/id.svg', AppLocalizations.of(context)!.identity_iqama),
                EditTextItem('assets/images/phone.svg',
                    AppLocalizations.of(context)!.phone),
                EditTextItem('assets/images/scure.svg', AppLocalizations.of(context)!.insurance_company_cash),
                EditTextItem(
                    'assets/images/scureId.svg', AppLocalizations.of(context)!.insurance_policy_number),
                Container(
                  width: double.infinity,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
                  ),
                  margin: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      SvgPicture.asset('assets/images/Upload.svg',
                          semanticsLabel: 'Acme Logo'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(AppLocalizations.of(context)!.attach_a_copy_of_your_id,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          )),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          BtnLayout(AppLocalizations.of(context)!.opening_medical_file, () {
            showAlertDialog(context);
          }),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
