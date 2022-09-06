import 'package:get/get.dart';

import '../model/Patient.dart';

class QuickServiceGetxController extends GetxController {
  static QuickServiceGetxController get to => Get.find<QuickServiceGetxController>();

   RxString clinicName = "anonumus".obs;
   RxInt doctorId =1.obs;

   void changeClinicName(name){
     clinicName.value = name;
   }

  void changeDoctorName(name){
    doctorId.value = name;
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
