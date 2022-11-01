import 'package:aphaa_app/model/Patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/App_api_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aphaa_app/helper/helpers.dart';

import '../../../model/api_response.dart';

class EditProfile extends StatefulWidget {
  static String routeName = "/edit_profile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with Helpers1 {
  TextEditingController _pName = TextEditingController();
  TextEditingController _pEmail = TextEditingController();
  TextEditingController _pPhone = TextEditingController();
  TextEditingController _pEmployer = TextEditingController(text: "Employer");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.edit_profile,
            style: TextStyle(
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
            _pName.text = "${snapshot.data?.firstName} ${snapshot.data?.secondName} ${snapshot.data?.thirdName} ${snapshot.data?.lastName}";
            _pEmail.text = "${snapshot.data?.email}";
            _pPhone.text = "${snapshot.data?.mobile}";
            _pEmployer.text = "${snapshot.data?.Employer??''}";

            return ListView(
              // shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                EditTextItem('assets/images/Profile.svg',
                    AppLocalizations.of(context)!.pasent_name,
                    controler: _pName),
                EditTextItem('assets/images/Message.svg',
                    AppLocalizations.of(context)!.email,
                    controler: _pEmail),
                EditTextItem('assets/images/phone.svg',
                    AppLocalizations.of(context)!.phone,
                    controler: _pPhone),
                EditTextItem('assets/images/company.svg',
                    AppLocalizations.of(context)!.employer,
                    controler: _pEmployer),
                SizedBox(
                  height: 80.h,
                ),
                BtnLayout(AppLocalizations.of(context)!.save_change,
                    () => _performRegister(snapshot.data?.email ?? "")),
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

  Future<void> _performRegister(String email) async {
    if (_checkData()) {
      await _editProfile(email);
    }
  }

  bool _checkData() {
    if (_pName.text.isNotEmpty &&
        _pEmail.text.isNotEmpty &&
        _pPhone.text.isNotEmpty &&
        _pEmployer.text.isNotEmpty) {
      if (_pName.text.split(" ").length < 4) {
        showSnackBar(context, message: 'اكتب الاسم رباعي', error: true);
        return false;
      }

      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _editProfile(c_email) async {
    showLoaderDialog(context);
    List<String> name = _pName.text.split(" ");
    Patient p;
    bool flag;

    if (c_email != _pEmail.text) {
      print("ass");
      flag = true;
      p = Patient.ProfileData(
          firstName: name[0],
          secondName: name[1],
          thirdName: name[2],
          lastName: name[3],
          email:  _pEmail.text,
          mobile: _pPhone.text,
          Employer: _pEmployer.text);
    } else {
      flag = false;
      p = Patient.ProfileData1(
          firstName: name[0],
          secondName: name[1],
          thirdName: name[2],
          lastName: name[3],
          mobile: _pPhone.text,
          Employer: _pEmployer.text);
    }
    ApiResponse apiResponse = await AppApiController().editProfile( p,flag: flag,insuranceFlag: false);
    if (apiResponse.success) {
      Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, ButtomNavigations.routeName);
    }else{
      Navigator.pop(context);
    }

    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }

  @override
  void dispose() {
    _pName.dispose();
    _pEmail.dispose();
    _pPhone.dispose();
    _pEmployer.dispose();
    super.dispose();
  }
}
