import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditInsuranceData extends StatefulWidget {

  static String routeName = "/edit_profile_insurance";

  @override
  State<EditInsuranceData> createState() => _EditInsuranceDataState();
}

class _EditInsuranceDataState extends State<EditInsuranceData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.edit_insurance_data,
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
              EditTextItem('assets/images/snum.svg',
                  AppLocalizations.of(context)!.insurance_number),
              EditTextItem(
                  'assets/images/Calendar.svg', AppLocalizations.of(context)!.insurance_end_date),

              DropDownItem([],
                  'assets/images/company.svg', AppLocalizations.of(context)!.insurance_companies),
               SizedBox(
                height: 80.h,
              ),
              BtnLayout('حفظ التعديلات', () { }),
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
