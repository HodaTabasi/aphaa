import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/model/time_avilable_response/AvailableTime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/Eligibility.dart';
import '../model/OpenFileResponse.dart';
import '../model/Patient.dart';
import '../model/doctor.dart';
import '../model/time_avilable_response/TimeAvilableResponse.dart';

class NewAccountGetxController extends GetxController {




  static NewAccountGetxController get to => Get.find<NewAccountGetxController>();
  RxBool isCitizen = false.obs;
 late Patient patient ;
  String companyName = "dar";
  List<Doctor> doctorsList = [];
  List<String> avilableDate = [];
  List<AvailableTime> avilableTime = [];
  String clinicCode = '';
  String doctorCode = '';
  String consultNo = '';
  String smsCode = '';
  String? verificationId;
  bool isReset = false;
  bool isUpdateCliniceCode = false;
  String? global ;
  Eligibility? eligibility;
  bool flag = false;
  TimeAvilableResponse? timeResponse ;
  String? mobile;
  OpenFileResponse? fileData;
  bool fromOpenFile = false;
  bool isChangeLoading = false;
  bool isChangeTimeLoading = false;

  ///////////////

  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  final num3Controller = TextEditingController();
  final num4Controller = TextEditingController();
  final num5Controller = TextEditingController();
  final num6Controller = TextEditingController();

  TextEditingController pID = TextEditingController(text: "2320128214");

  void changeIsCitizen(value){
    isCitizen.value = value;
    Get.appUpdate();
  }
  void setEligibility(eli){
    eligibility = eli;
  }

  void addPatient(Patient p){
    patient = p;
    print(patient);
  }

  void changeMyDoctorList(List<Doctor> doctor){
    global = doctor[0].doctorName;
    doctorsList = doctor;
    update();
  }
  void changeDoctorTimeList(TimeAvilableResponse response){
    avilableTime = response.availableTimes ?? [];
    timeResponse = response;
    changeTimeLoading();
    // update();
  }
  void changeBoolisUpdateCliniceCode(value){
      isUpdateCliniceCode = value;
    update();
  }
  void changeglobal(value){
    global = value;
    QuickServiceGetxController.to.doctorName = this.doctorsList.where((element) => element.doctorCode == value).toList().first.doctorName!;
    update();
  }
  List<Doctor> getListDoctor(){
    return doctorsList;
  }

  getDoctorSchedules(value,month,year) async {
    var data = await HospitalApiController().getDoctorSched(doctorCode: value,clinicCode: clinicCode,month:month,year: year );
    avilableDate =  data;
    avilableTime = [];
    changeLoading();
    // update();
  }
  changeLoading() {
    isChangeLoading = !isChangeLoading;
    update();
  }

  changeTimeLoading() {
    isChangeTimeLoading = !isChangeTimeLoading;
    update();
  }

  Future<void> changeDropDownValue(value,dropType,{context}) async {
    doctorsList.clear();
    global = null;
    var data = await HospitalApiController().getClDrs(clinicCode: value);
    doctorsList =  data!.doctors ?? [];
    isUpdateCliniceCode = false;
    update();
    // Navigator.pop(context);
   // switch(dropType){
   //   case 1:
   //     companyName = value;
   //     break;
   //   case 2:
   //     QuickServiceGetxController.to.changeDoctorName(value) ;
   //     break;
   //   case 3:
   //     QuickServiceGetxController.to.changeClinicName(value);
   //     break;
   // }
   // Get.appUpdate();
  }

  String makeCode() {
    var num1 = num1Controller.text;
    var num2 = num2Controller.text;
    var num3 = num3Controller.text;
    var num4 = num4Controller.text;
    var num5 = num5Controller.text;
    var num6 = num6Controller.text;
    return num1 + num2 + num3 + num4 + num5 + num6;
  }
}
