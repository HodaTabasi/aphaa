import 'package:aphaa_app/model/Clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../api/controllers/hospital_controller.dart';
import '../model/Pages.dart';
import '../model/allDocResponse.dart';
import '../model/doctor.dart';

class DoctorGetxController extends GetxController {

  static DoctorGetxController get to =>
      Get.find<DoctorGetxController>();


  RxString selectedPageNumber = "1".obs;
  RxList<Doctor> list = <Doctor>[].obs;
  RxList<Pages> pageList = <Pages>[].obs;

  RxString offSet = "1".obs;

  int page = 0;

  RxBool isFirstLoadRunning = false.obs;
  RxBool hasNextPage = true.obs;

  RxBool isLoadMoreRunning = false.obs;

  late ScrollController controller;

  // putData(){
  //   DoctorGetxController.to.firstLoad();
  //   DoctorGetxController.to.controller = ScrollController()..addListener(DoctorGetxController.to.loadMore);
  // }

  void loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        controller.position.extentAfter < 300.h) {
      print(page);
      print(pageList.length);
      if(page < pageList.length-1){

        //setState
          isLoadMoreRunning.value = true; // Display a progress indicator at the bottom


        page += 1;
        selectedPageNumber.value = pageList[page].page!; // Increase _page by 1
        offSet.value = pageList[page].offset!;

        DoctorListResponse? v = await  HospitalApiController().getClDrs(flag: true,page: selectedPageNumber,offset: offSet);

        list.addAll(v!.doctors ?? []);

          //setState
          isLoadMoreRunning.value = false;

      } else {
        //setState
          isLoadMoreRunning.value = false;
          hasNextPage.value = false;

      }

    }
  }

  void firstLoad({clinicCode = ""}) async {
    //setState
      isFirstLoadRunning.value = true;


    await getData(clinicCode: clinicCode);

      //setState
      isFirstLoadRunning.value = false;

  }

  getData({clinicCode = ""}) async {
    hasNextPage = true.obs;
    isLoadMoreRunning = false.obs;
    offSet = "1".obs;
    page = 0;
    selectedPageNumber = "1".obs;

    DoctorListResponse? v = await  HospitalApiController().getClDrs(clinicCode: clinicCode,flag: true,page: selectedPageNumber,offset: offSet);
    list.value = v?.doctors ?? [];
    pageList.value = v?.pages ?? [];

    print(v?.pages!.length);
  }

  void filtterByName(String val) {
    list.value = list.where((p0) => p0.doctorName!.contains(val)).toList();
  }


}