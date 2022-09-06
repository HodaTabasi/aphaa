import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/App_api_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aphaa_app/helper/helpers.dart';

import '../../../model/Patient.dart';
import '../../../model/api_response.dart';

class EditInsuranceData extends StatefulWidget {

  static String routeName = "/edit_profile_insurance";

  @override
  State<EditInsuranceData> createState() => _EditInsuranceDataState();
}

class _EditInsuranceDataState extends State<EditInsuranceData> with Helpers {

  TextEditingController _insurance_number = TextEditingController();
  TextEditingController _insurance_name = TextEditingController();
  TextEditingController _insurance_date = TextEditingController();

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
      body: FutureBuilder<Patient>(
        future: AppApiController().getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            _insurance_name.text =
            "${snapshot.data?.insuranceName}";
            _insurance_date.text = "${snapshot.data?.insuranceDate}";
          _insurance_number.text = "${snapshot.data?.insuranceNumber}";

            return  ListView(
              // shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                EditTextItem('assets/images/snum.svg',
                  AppLocalizations.of(context)!.insurance_number,controler: _insurance_number,),
                EditTextItem(
                    'assets/images/Calendar.svg', AppLocalizations.of(context)!.insurance_end_date,b: false,controler: _insurance_date),

                DropDownItem(["m1","m2"],
                    'assets/images/company.svg', AppLocalizations.of(context)!.insurance_companies,dropIntValue: 1),
                SizedBox(
                  height: 80.h,
                ),
                BtnLayout('حفظ التعديلات', () =>_performEdit()),
                // Spacer(),
                // Image.asset(
                //   "assets/images/image1.png",
                //   fit: BoxFit.fitWidth,
                // ),
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
      bottomSheet: Image.asset(
        "assets/images/image1.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Future<void> _performEdit() async {
    if (_checkData()) {
      await _editProfile();
    }
  }

  bool _checkData() {
    if (_insurance_number.text.isNotEmpty &&
        _insurance_date.text.isNotEmpty &&
        _insurance_name.text.isNotEmpty ) {

      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _editProfile() async {
    showLoaderDialog(context);
    Patient p;

      p = Patient.insuranceData(
          insuranceNumber: _insurance_number.text,
          insuranceDate: _insurance_date.text,
          insuranceName: _insurance_name.text,);

    // print(p);
    ApiResponse apiResponse = await AppApiController().editProfile(p,insuranceFlag: true);
    if (apiResponse.success) {
      Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, ButtomNavigations.routeName);
    }
    Navigator.pop(context);
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }

  @override
  void dispose() {
    _insurance_name.dispose();
    _insurance_date.dispose();
    _insurance_number.dispose();
    super.dispose();
  }
}
