import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/model/AvailableTime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/Patient.dart';
import '../model/doctor.dart';

class NewAccountGetxController extends GetxController {
  static NewAccountGetxController get to => Get.find<NewAccountGetxController>();
  RxBool isCitizen = false.obs;
 late Patient patient ;
  String companyName = "";
  List<Doctor> doctorsList = [] ;
  List<String> avilableDate = [];
  List<AvailableTime> avilableTime = [];
  String clinicCode = '';
  String doctorCode = '';
  String consultNo = '';

  void changeIsCitizen(value){
    isCitizen.value = value;
    Get.appUpdate();
  }

  void addPatient(Patient p ){
    patient = p;
    print(patient);
  }

  void changeMyDoctorList(List<Doctor> doctor){
    doctorsList = doctor;
    update();
  }
  void changeDoctorTimeList(List<AvailableTime> time){
    avilableTime = time;
    update();
  }

  List<Doctor> getListDoctor(){
    return doctorsList;
  }

  getDoctorSchedules(value) async {
    var data = await HospitalApiController().getDoctorSched(doctorCode: value,clinicCode: clinicCode);
    avilableDate =  data;
    update();
  }

  Future<void> changeDropDownValue(value,dropType,{context}) async {
    var data = await HospitalApiController().getClDrs(clinicCode: value);
    doctorsList =  data;
    update();
    // Navigator.pop(context);
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
