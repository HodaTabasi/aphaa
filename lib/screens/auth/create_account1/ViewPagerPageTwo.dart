import 'package:flutter/material.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../firebase/fb_auth_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../general/password_item.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../model/Patient.dart';

class ViewPagerPageTow extends StatefulWidget {
  var controller;

  ViewPagerPageTow({this.controller});

  @override
  State<ViewPagerPageTow> createState() => _ViewPagerPageTowState();
}

class _ViewPagerPageTowState extends State<ViewPagerPageTow>
    with myHelper.Helpers1 {
  TextEditingController _pName = TextEditingController(
      text: NewAccountGetxController.to.eligibility?.patientName);
  TextEditingController _pEmail = TextEditingController(text: "hhh@gmail.com");
  TextEditingController _pPhone = TextEditingController(
      text: NewAccountGetxController.to.eligibility?.patientMOB);
  TextEditingController _pPassword = TextEditingController(text: "123456789");
  TextEditingController _pRepassword = TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          'assets/images/logo.png',
          width: 203.w,
          height: 161.h,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          AppLocalizations.of(context)!.create_the_account_you_following_data,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        EditTextItem('assets/images/Profile.svg',
            AppLocalizations.of(context)!.pasent_name,
            controler: _pName),
        EditTextItem(
          'assets/images/Message.svg',
          AppLocalizations.of(context)!.email,
          controler: _pEmail,
        ),
        EditTextItem(
          'assets/images/phone.svg',
          AppLocalizations.of(context)!.phone,
          controler: _pPhone,
        ),
        PasswordItem(
          'assets/images/Lock.svg',
          AppLocalizations.of(context)!.password,
          controler: _pPassword,
        ),
        PasswordItem(
          'assets/images/Lock.svg',
          AppLocalizations.of(context)!.re_password,
          controler: _pRepassword,
        ),
        BtnLayout(AppLocalizations.of(context)!.next, () => _performRegister()),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          "assets/images/image1.png",
          fit: BoxFit.fitWidth,
        ),
      ],
    ));
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _next();
    }
  }

  bool _checkData() {
    if (_pName.text.isNotEmpty &&
        _pEmail.text.isNotEmpty &&
        _pPhone.text.isNotEmpty &&
        _pPassword.text.isNotEmpty &&
        _pRepassword.text.isNotEmpty) {
      if (_pName.text.split(" ").length < 4) {
        showSnackBar(context, message: 'اكتب الاسم رباعي', error: true);
        return false;
      }
      if (_pPassword.text != _pRepassword.text) {
        showSnackBar(context,
            message: 'كلمتا المرور ليسا متطابقين', error: true);
        return false;
      }
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  Future<void> _next() async {
    String isCitizen;
    List<String> name = _pName.text.split(" ");
    NewAccountGetxController.to.isCitizen.value
        ? isCitizen = "citizen"
        : isCitizen = "resident";
    Patient p = Patient.BaseData(
        firstName: name[0],
        secondName: name[1],
        thirdName: name[2],
        lastName: name[3],
        email: _pEmail.text,
        password: _pPassword.text,
        patientType: isCitizen,
        identityNumber: NewAccountGetxController.to.pID.text,
        mobile: _pPhone.text);
        p.p_code = NewAccountGetxController.to.eligibility?.patientCode;
    NewAccountGetxController.to.addPatient(p);
   // if (NewAccountGetxController.to.eligibility!.isInsured == "true") {
      widget.controller.nextPage(
          duration: const Duration(microseconds: 100), curve: Curves.bounceIn);

    // FireBaseAuthController().verifyPhoneNumber1(
    //     context: context, userPhone: 0597046766);
    // Navigator.pushNamed(context, CreateAccountNext.routeName);
  }

  @override
  void dispose() {
    _pName.dispose();
    _pEmail.dispose();
    _pPhone.dispose();
    _pPassword.dispose();
    _pRepassword.dispose();
    super.dispose();
  }
}
