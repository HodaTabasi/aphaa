import 'package:aphaa_app/api/controllers/auth_api_controller.dart';
import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/done/done_screen.dart';
import 'package:aphaa_app/screens/main_screens/done_login/done_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';
import '../../../general/password_item.dart';
import '../../../model/api_response.dart';
import '../../drawer_screens/buttom_navication.dart';
import 'package:aphaa_app/helper/helpers.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePassword extends StatefulWidget {

  static String routeName = "/changepass";

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with Helpers{

  TextEditingController _pPassword = TextEditingController();
  TextEditingController _prePassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.change_password,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r,vertical: 8.r),
            child: Text(
              AppLocalizations.of(context)!.change_password,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          PasswordItem('assets/images/Lock.svg', AppLocalizations.of(context)!.password,controler: _pPassword,),
          PasswordItem('assets/images/Lock.svg', AppLocalizations.of(context)!.re_password,controler: _prePassword),
          Padding(
            padding:  EdgeInsets.only(left: 16.0.r,right: 0.r,top: 8.r),
          ),
          SizedBox(
            height: 30.h,
          ),
          BtnLayout(AppLocalizations.of(context)!.change_password, () =>_performChangePassword() ,),
           SizedBox(
            height: 10.h,
          ),

        ],
      ),
      bottomSheet:  Image.asset(
        "assets/images/image1.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
  Future<void> _performChangePassword() async {
    if (_checkData()) {
      await _editProfile();
    }
  }

  bool _checkData() {
    if (_pPassword.text.isNotEmpty &&
        _prePassword.text.isNotEmpty ) {

      if(_pPassword.text != _prePassword.text){
        showSnackBar(context, message: 'كلمتا المرور ليسا متطابقين', error: true);
        return false;
      }

      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _editProfile() async {
    showLoaderDialog(context);

    ApiResponse apiResponse = await AuthApiController().changePassword(password:_pPassword.text,rePassword: _prePassword.text );
    if (apiResponse.success) {
      Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, LoginDoneScreens.routeName);
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
    _prePassword.dispose();
    _pPassword.dispose();
    super.dispose();
  }
}
