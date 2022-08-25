import 'package:aphaa_app/screens/auth/create_account/create_account.dart';
import 'package:aphaa_app/screens/auth/login/login_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/home_screen/home_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/offers/offers_screen.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/profile_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/edit_insurance_data/edit_profile.dart';
import 'package:aphaa_app/screens/in_level_screen/edit_profile/edit_profile.dart';
import 'package:aphaa_app/screens/in_level_screen/family/family_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/medical_recipes/medical_recipes.dart';
import 'package:aphaa_app/screens/in_level_screen/offer_ditails/offer_details.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_record/payment_record.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_screen/payment_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/vaccinations/vaccinations.dart';
import 'package:aphaa_app/screens/in_level_screen/vital_signs/vital_signs.dart';
import 'package:aphaa_app/screens/main_screens/Appointment%20Booking/appointement_booking.dart';
import 'package:aphaa_app/screens/main_screens/Doctor/doctors_screen.dart';
import 'package:aphaa_app/screens/main_screens/change_password/change_password.dart';
import 'package:aphaa_app/screens/main_screens/done_login/done_screen.dart';
import 'package:aphaa_app/screens/main_screens/forget_pass/forget_password.dart';
import 'package:aphaa_app/screens/main_screens/open_medocal/opening_medical_file.dart';
import 'package:aphaa_app/screens/main_screens/otp/otp_screen.dart';
import 'package:flutter/widgets.dart';
import '../screens/auth/create_account/create_account_next.dart';
import '../screens/drawer_screens/Booking/my_appointment_booking.dart';
import '../screens/drawer_screens/buttom_navication.dart';
import '../screens/drawer_screens/done/done_screen.dart';
import '../screens/in_level_screen/Insurance_approvals/Insurance_approvals.dart';
import '../screens/in_level_screen/recordbookings/RecordBooking.dart';
import '../screens/in_level_screen/reservation_data/reservation_data.dart';
import '../screens/in_level_screen/sick_level/sick_leave.dart';
import '../screens/in_level_screen/test_results/test_results.dart';
import '../screens/main_screens/Doctor/doctor_details.dart';
import '../screens/main_screens/Doctor/my_doctor_screen.dart';
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
  ////////////
  HomeScreen.routeName: (context) => HomeScreen(),
  ForgetPassword.routeName: (context) => ForgetPassword(),
  CreateAccountNext.routeName: (context) => CreateAccountNext(),
  VitalSigns.routeName: (context) => VitalSigns(),
  ////////
  MedicalRecipes.routeName: (context) => MedicalRecipes(),
  Vaccinations.routeName: (context) => Vaccinations(),
  VitalSigns.routeName: (context) => VitalSigns(),
  TestResults.routeName: (context) => TestResults(),
  MyDoctorsScreen.routeName: (context) => MyDoctorsScreen(),
  InsuranceApprovals.routeName: (context) => InsuranceApprovals(),
  SickLeave.routeName: (context) => SickLeave(),
  FamillyScreen.routeName: (context) => FamillyScreen(),
  RexcordBooking.routeName: (context) => RexcordBooking(),
  OfferScreen.routeName: (context) => OfferScreen(),
  OfferDetails.routeName: (context) => OfferDetails(),
  MyAppointmentBooking.routeName: (context) => MyAppointmentBooking(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  PaymentRecord.routeName: (context) => PaymentRecord(),
  ReservationData.routeName: (context) => ReservationData(),
  DoneScreens.routeName: (context) => DoneScreens(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ButtomNavigations.routeName: (context) => ButtomNavigations(),
  EditProfile.routeName: (context) => EditProfile(),
  EditInsuranceData.routeName: (context) => EditInsuranceData(),
  ChangePassword.routeName: (context) => ChangePassword(),
  OTPScreen.routeName: (context) => OTPScreen(),
  LoginDoneScreens.routeName: (context) => LoginDoneScreens(),
};
