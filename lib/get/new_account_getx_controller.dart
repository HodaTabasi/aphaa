import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:get/get.dart';

import '../model/Patient.dart';

class NewAccountGetxController extends GetxController {
  static NewAccountGetxController get to => Get.find<NewAccountGetxController>();
  RxBool isCitizen = false.obs;
 late Patient patient ;
  String companyName = "";

  void changeIsCitizen(value){
    isCitizen.value = value;
    Get.appUpdate();
  }

  void addPatient(Patient p ){
    patient = p;
    print(patient);
  }



  void changeDropDownValue(value,dropType) {
    print(value);
   switch(dropType){
     case 1:
       companyName = value;
       break;
     case 2:
       QuickServiceGetxController.to.changeDoctorName(value) ;
       break;
     case 3:
       QuickServiceGetxController.to.changeClinicName(value);
       break;
   }
   // Get.appUpdate();
  }
}
