import 'package:aphaa_app/api/controllers/auth_api_controller.dart';
import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/items.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/notificaton_item.dart';
import 'package:aphaa_app/screens/in_level_screen/edit_insurance_data/edit_profile.dart';
import 'package:aphaa_app/screens/in_level_screen/edit_profile/edit_profile.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_record/payment_record.dart';
import 'package:aphaa_app/screens/main_screens/change_password/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../preferences/shared_pref_controller.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper;

class ProfileScreen extends StatefulWidget {

  static String routeName = "/profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with myHelper.Helpers{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   // leadingWidth: 40,
      //   title: Text('الملف الشخصي',
      //       style: const TextStyle(
      //         color: Colors.white,
      //         fontSize: 16,
      //         fontFamily: 'Tajawal',
      //         fontWeight: FontWeight.bold,
      //       )),
      //   titleSpacing: 2,
      //   centerTitle: true,
      //   // leading: Container(
      //   //     margin: const EdgeInsets.all(15.0),
      //   //     padding: const EdgeInsets.all(5.0),
      //   //     // alignment: Alignment.bottomLeft,
      //   //     // width: 80,
      //   //     // height: 500,
      //   //     decoration: BoxDecoration(
      //   //         color: const Color(0xff006F2C),
      //   //         borderRadius: BorderRadius.circular(5)),
      //   //     child: const Icon(
      //   //       Icons.arrow_back_ios,
      //   //       color: Colors.white,
      //   //       size: 15,
      //   //     )),
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color:  Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(80.0.r)),
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0.w,
                ),

              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://www.kindpng.com/picc/m/685-6851196_person-icon-grey-hd-png-download.png'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(SharedPrefController()
              .getValueFor<String>(key: PrefKeysPatient.firstName.name)??" " ,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),textAlign: TextAlign.center,),
          Text(SharedPrefController()
              .getValueFor<String>(key: PrefKeysPatient.lastName.name)??" ",
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),textAlign: TextAlign.center,),
          SizedBox(
            height: 20.h,
          ),
          TextItem('assets/images/EditSquare.svg',AppLocalizations.of(context)!.edit_profile,()=>Navigator.pushNamed(context, EditProfile.routeName)),
          TextItem('assets/images/pagemetrecord.svg',AppLocalizations.of(context)!.pay_book,()=>Navigator.pushNamed(context, PaymentRecord.routeName)),
          TextItem('assets/images/editf.svg',AppLocalizations.of(context)!.edit_insurance_data,()=>Navigator.pushNamed(context, EditInsuranceData.routeName)),
          TextItem('assets/images/Lock.svg',AppLocalizations.of(context)!.change_password,()=>Navigator.pushNamed(context, ChangePassword.routeName)),
          NotificationItem('assets/images/Notification.svg',AppLocalizations.of(context)!.notifications),
          TextItem('assets/images/Logout.svg',AppLocalizations.of(context)!.logout,isVisable: true,() async {
            showLoaderDialog(context);
            await AuthApiController().logout().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                CupertinoPageRoute(
                    builder: (context) => LoginScreen()
                ),
                    (_) => false,
              );
            });

            }),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: DecoratedBox(decoration: BoxDecoration(
              color: Color(0xff1E934C),
              borderRadius: BorderRadius.circular(8.r),
            ),
              child: Padding(
                padding:  EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                        'assets/images/youtube.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/inata.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/facebook.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/twetter.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/site.svg',
                        semanticsLabel: 'Acme Logo'
                    )
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
