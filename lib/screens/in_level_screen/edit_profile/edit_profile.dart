import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfile extends StatefulWidget {

  static String routeName = "/edit_profile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.edit_profile,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: Column(
            // shrinkWrap: true,
            children: [
               SizedBox(
                height: 20.h,
              ),
              EditTextItem('assets/images/Profile.svg',
                  AppLocalizations.of(context)!.pasent_name),
              EditTextItem(
                  'assets/images/Message.svg', AppLocalizations.of(context)!.email),
              EditTextItem(
                  'assets/images/phone.svg', AppLocalizations.of(context)!.phone),
              EditTextItem(
                  'assets/images/company.svg', AppLocalizations.of(context)!.employer),
              SizedBox(
                height: 80.h,
              ),
              BtnLayout(AppLocalizations.of(context)!.save_change, () { }),
              Spacer(),
              Image.asset(
                "assets/images/image1.png",
                fit: BoxFit.fitWidth,
              ),
            ],
          ),

    );
  }
}
