import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/splach/screen_2_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'get/language_getx_controller.dart';
import 'helper/constant.dart';
import 'helper/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LanguageGetxController languageGetxController =
      Get.put<LanguageGetxController>(LanguageGetxController());

  final NewAccountGetxController newAccountGetxController =
  Get.put<NewAccountGetxController>(NewAccountGetxController());
  final QuickServiceGetxController quickServiceGetxController =
  Get.put<QuickServiceGetxController>(QuickServiceGetxController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 781.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
    return Obx((){
      return GetMaterialApp(
        localizationsDelegates:  const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales:  const [
          Locale('ar'),
          Locale('en'),
        ],
        // supportedLocales: AppLocalizations.supportedLocales,
        // locale: Locale(Provider.of<LanguageProvider>(context).language),
        // locale: Locale(context.watch<LanguageProvider>().language),
        locale: Locale(languageGetxController.language.value),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: colorCustom,
        ),
        initialRoute: Screen2Splash.routeName,
        routes: routes,
      );
    } );
    });
  }
}
