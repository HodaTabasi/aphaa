import 'package:get/get.dart';

import '../model/Patient.dart';
import '../model/doctor.dart';

class QuickServiceGetxController extends GetxController {


  static QuickServiceGetxController get to => Get.find<QuickServiceGetxController>();

   String clinicName = "";
   String doctorName = "";
   String? doctorId;
   Doctor? doctor;
   bool fromHome = false;
   String? idType;
   String? nationality;
   String requestType = "1";
   var img;
   bool gender = true;
   void changeClinicName(name){
     clinicName = name;
   }

  void changeDoctorName(name){
    doctorId = name;
    print(" dff ${doctorId}");
  }
  void saveDoctor(doctor,imag){
     this.doctor = doctor;
     img = imag;
  }



  // void changeLanguage() {
  //   // language = language == 'ar'.obs ? 'en'.obs : 'ar'.obs;
  //   language.value = language.value == 'ar' ? 'en' : 'ar';
  //   SharedPrefController().changeLanguage(language: language.value);
  //   var locale = Locale(language.value);
  //   Get.updateLocale(locale);
  //   // language.refresh();
  //   print(language);
  // }
}
