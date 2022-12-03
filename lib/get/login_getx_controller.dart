import 'package:aphaa_app/model/Appointment/Appointments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginGetXController extends GetxController {
  static LoginGetXController get to => Get.find<LoginGetXController>();

  String mobileControllerText =  "";
  String passwordControllerText = "";
  List<Appointments> list = [];

  bool isLoginPage = false;

  changeFelidText(mobile,password){
    mobileControllerText = mobile;
    passwordControllerText = password;
    isLoginPage = true;
  }

  addToList(appoimnets){
    list.addAll(appoimnets);
    update();
  }

  addToFirstList(appoimnets){
    list = (appoimnets);
    update();
  }

  delete(appoiment){
    // int index = list.indexWhere((element) => element.resNo == appoiment.resNo);
    list.remove(appoiment);
    update();
  }
}
