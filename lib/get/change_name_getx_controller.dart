import 'package:aphaa_app/model/Clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../api/controllers/hospital_controller.dart';
import '../helper/nerwork_connectivity.dart';
import '../model/Pages.dart';
import '../model/allDocResponse.dart';
import '../model/doctor.dart';

class ChangeGetxController extends GetxController {

  static ChangeGetxController get to =>
      Get.find<ChangeGetxController>();

  RxString firstName = "".obs;
  RxString lastName ="".obs;
  String filePath = "" ;

  bool flagPrevAppt = false;

  changeName(firstName,lastName){
    this.firstName.value = firstName;
    this.lastName.value = lastName??" ";
  }

  get getName => "${firstName.value} ${lastName.value}";
}