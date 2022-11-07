import 'package:aphaa_app/model/Clinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../api/controllers/hospital_controller.dart';
import '../helper/nerwork_connectivity.dart';
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
  RxBool isNoNetworkConnect = false.obs;
  RxBool isNoNetworkConnectInLoadMore = false.obs;

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;


  void loadMore() async {
    bool x = await _networkConnectivity.initialise();
    if (x) {
        isNoNetworkConnectInLoadMore.value = false;

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
    } else {
        isNoNetworkConnectInLoadMore.value = true;

    }

    }
  }

  void firstLoad({clinicCode = ""}) async {
    bool x = await _networkConnectivity.initialise();
    if (x) {


      //setState
      isFirstLoadRunning.value = true;
      isNoNetworkConnect.value = false;


    await getData(clinicCode: clinicCode);

      //setState
      isFirstLoadRunning.value = false;
    } else {

        isNoNetworkConnect.value = true;

    }
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