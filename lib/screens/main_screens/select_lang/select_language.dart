import 'package:aphaa_app/screens/main_screens/select_lang/selected_item.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../get/language_getx_controller.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../quick_services/quick_services.dart';

class SelectLanguage extends StatefulWidget {
  static String routeName = "/select_lang";

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  var _value =  SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) != null? SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ?0 :1 : 0;
  String s =SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == null ?"العربية":SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar'? "العربية" :"English" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 90.w,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          // padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
              color: const Color(0xff006F2C),
              borderRadius: BorderRadius.circular(10)),
          child: Text(SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == null ?"العربية":SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar'? "العربية" :"English",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              'assets/images/logo.png',
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              AppLocalizations.of(context)!.q1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SelectedItem(
                title: AppLocalizations.of(context)!.ar,
                value: 0,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    LanguageGetxController.to.changeLanguage();
                  });
                }),
            SelectedItem(
                title: AppLocalizations.of(context)!.en,
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    LanguageGetxController.to.changeLanguage();
                  });
                }),
            SizedBox(
              height: 30.h,
            ),
            AvatarGlow(
              endRadius: 35.0,
              showTwoGlows: true,
              glowColor: const Color(0xff8CABCD),
              animate: true,
              curve: Curves.easeInCubic,
              child: InkWell(
                onTap: () {
                  SharedPrefController().setfirstLanch(true);
                  Navigator.pushReplacementNamed(context, QuickServices.routeName);
                },
                child: Image.asset(
                  'assets/images/icon1.png',
                  height: 50.h,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Image.asset("assets/images/image1.png",fit: BoxFit.cover),
    );
      
    //   Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     elevation: 0,
    //     leadingWidth: 90.w,
    //     leading: Container(
    //       margin: const EdgeInsets.all(10.0),
    //       // padding: EdgeInsets.all(10.0),
    //       alignment: Alignment.center,
    //       width: 80.w,
    //       height: 80.h,
    //       decoration: BoxDecoration(
    //           color: const Color(0xff006F2C),
    //           borderRadius: BorderRadius.circular(10)),
    //       child: Text(
    //         SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar'? "العربية" :"English",
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontSize: 14.sp,
    //           fontFamily: 'Tajawal',
    //           fontWeight: FontWeight.bold,
    //         ),
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   ),
    //   body: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('assets/images/back1.png'),
    //         fit: BoxFit.fill,
    //       )
    //     ),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 30.h,
    //           ),
    //           Image.asset(
    //             'assets/images/logo.png',
    //           ),
    //           const SizedBox(
    //             height: 50,
    //           ),
    //           Text(
    //             AppLocalizations.of(context)!.q1,
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 14.sp,
    //               fontFamily: 'Tajawal',
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 10.h,
    //           ),
    //           SelectedItem(
    //               title: AppLocalizations.of(context)!.ar,
    //               value: 0,
    //               groupValue: _value,
    //               onChanged: (value) {
    //                 setState(() {
    //                   _value = value;
    //                   LanguageGetxController.to.changeLanguage();
    //                 });
    //               }),
    //           SelectedItem(
    //               title: AppLocalizations.of(context)!.en,
    //               value: 1,
    //               groupValue: _value,
    //               onChanged: (value) {
    //                 setState(() {
    //                   _value = value;
    //                   LanguageGetxController.to.changeLanguage();
    //                 });
    //               }),
    //           SizedBox(
    //             height: 30.h,
    //           ),
    //           AvatarGlow(
    //             endRadius: 35.0,
    //             showTwoGlows: true,
    //             glowColor: const Color(0xff8CABCD),
    //             animate: true,
    //             curve: Curves.easeInCubic,
    //             child: InkWell(
    //               onTap: () {
    //                 SharedPrefController().setfirstLanch(true);
    //                 Navigator.pushReplacementNamed(context, QuickServices.routeName);
    //                 },
    //               child: Image.asset(
    //                 'assets/images/icon1.png',
    //                 height: 50.h,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
