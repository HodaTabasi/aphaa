import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:flutter/material.dart';

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
        title: Text('تعديل بيانات التأمين',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: Column(
            // shrinkWrap: true,
            children: [
              const SizedBox(
                height: 20,
              ),
              EditTextItem('assets/images/snum.svg',
                  'رقم التأمين'),
              EditTextItem(
                  'assets/images/Calendar.svg', 'تاريخ نهاية التأمين'),

              DropDownItem([],
                  'assets/images/company.svg', 'شركات التأمين'),
              const SizedBox(
                height: 80,
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
