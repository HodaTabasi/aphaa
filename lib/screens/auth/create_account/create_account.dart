import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/password_item.dart';
import 'package:aphaa_app/model/Patient.dart';
import 'package:aphaa_app/screens/auth/create_account/Choosere.dart';
import 'package:aphaa_app/screens/auth/create_account/create_account_next.dart';
import 'package:aphaa_app/screens/auth/create_account/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:aphaa_app/helper/helpers.dart';

import '../../../general/edittext_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../get/new_account_getx_controller.dart';

class CreateAccount extends StatefulWidget {
  static String routeName = "/create_account";

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> with Helpers {
  TextEditingController _pName = TextEditingController(text: "huda mohammed ahmed tabasi");
  TextEditingController _pEmail = TextEditingController(text: "hhh@gmail.com");
  TextEditingController _pPhone = TextEditingController(text: "0568523654");
  TextEditingController _pPassword = TextEditingController(text: "123456789");
  TextEditingController _pRepassword = TextEditingController(text: "123456789");
  TextEditingController _pID = TextEditingController(text: "1523");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.create_account,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2.r,
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
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
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xffF5F8FB),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Choosere()),
          ),
          MyTextFeild(_pID),
          BtnLayout(AppLocalizations.of(context)!.next, () => _performRegister()),
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
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
        _pRepassword.text.isNotEmpty &&
        _pID.text.isNotEmpty) {
      if (_pName.text.split(" ").length < 4) {
        print("object");
        showSnackBar(context, message: 'اكتب الاسم رباعي', error: true);
        return false;
      }
      if(_pPassword.text != _pRepassword.text){
        showSnackBar(context, message: 'كلمتا المرور ليسا متطابقين', error: true);
        return false;
      }
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _next() async {
    String isCitizen;
    List<String> name = _pName.text.split(" ");
    NewAccountGetxController.to.isCitizen.value ?isCitizen = "citizen" :isCitizen = "resident";
    Patient p = Patient.BaseData(firstName: name[0],secondName: name[1],thirdName: name[2],lastName: name[3],email: _pEmail.text,password: _pPassword.text,patientType: isCitizen,identityNumber: _pID.text,mobile: _pPhone.text);
    NewAccountGetxController.to.addPatient(p);
    Navigator.pushNamed(context, CreateAccountNext.routeName);
  }

  @override
  void dispose() {
    _pName.dispose();
    _pEmail.dispose();
    _pPhone.dispose();
    _pPassword.dispose();
    _pRepassword.dispose();
    _pID.dispose();
    super.dispose();
  }
}
