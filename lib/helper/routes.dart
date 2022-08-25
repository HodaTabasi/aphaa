import 'package:aphaa_app/screens/auth/create_account/create_account.dart';
import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/main_screens/Appointment%20Booking/appointement_booking.dart';
import 'package:aphaa_app/screens/main_screens/Doctor/doctors_screen.dart';
import 'package:aphaa_app/screens/main_screens/open_medocal/opening_medical_file.dart';
import 'package:flutter/widgets.dart';
import '../screens/main_screens/Doctor/doctor_details.dart';
import '../screens/main_screens/quick_services/quick_services.dart';
import '../screens/main_screens/select_lang/select_language.dart';
import '../screens/main_screens/send_consult/consult_screen.dart';
import '../screens/splach/screen_2_splash.dart';
import '../screens/splach/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => SplashScreen(),
  SelectLanguage.routeName: (context) => SelectLanguage(),
  Screen2Splash.routeName: (context) => Screen2Splash(),
  QuickServices.routeName: (context) => QuickServices(),
  ////////////////
  AppointmentBooking.routeName: (context) => AppointmentBooking(),
  OpeningMedicalFile.routeName: (context) => OpeningMedicalFile(),
  DoctorsScreen.routeName: (context) => DoctorsScreen(),
  SendConsultScreen.routeName: (context) => SendConsultScreen(),
  //////////
  DoctorDetails.routeName: (context) => DoctorDetails(),
  LoginScreen.routeName: (context) => LoginScreen(),
  CreateAccount.routeName: (context) => CreateAccount(),
  // SelectCard.routeName: (context) => SelectCard(),
  // Payment.routeName: (context) => Payment(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
  // OrderScreen.routeName: (context) => OrderScreen(),
  // SideMenuScreen.routeName: (context) => SideMenuScreen(),
  // MainZoom.routeName: (context) => MainZoom(),
  // Extra.routeName: (context) => Extra(),
  // ChosserWayReset.routeName: (context) => ChosserWayReset(),
  // WebViewPage.routeName: (context) => WebViewPage(),
};
