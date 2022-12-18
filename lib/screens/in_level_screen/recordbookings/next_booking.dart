import 'package:aphaa_app/helper/nerwork_connectivity.dart';
import 'package:aphaa_app/screens/in_level_screen/recordbookings/scedual_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../general/NewWidgetNetworkFirst.dart';
import '../../../general/NewWidgetNetworkLoadMore.dart';
import '../../../get/change_name_getx_controller.dart';
import '../../../get/login_getx_controller.dart';
import '../../../model/Appointment/AppointmentResponse.dart';
import '../../../model/Appointment/Appointments.dart';
import '../../../model/Pages.dart';
import '../../../preferences/shared_pref_controller.dart';

class NextBooking extends StatefulWidget {
  NetworkConnectivity networkConnectivity;

  NextBooking(this.networkConnectivity);

  @override
  State<NextBooking> createState() => _NextBookingState();
}

class _NextBookingState extends State<NextBooking> {
  String selectedPageNumber = "1";
  List<Appointments> list = [];
  List<Pages> pageList = [];

  String offSet = "1";

  int _page = 0;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;
  bool _isNoNetworkConnect = false;
  bool _isNoNetworkConnectInLoadMore = false;

  void _loadMore() async {
    bool x = await widget.networkConnectivity.initialise();
    if (x) {
      setState(() {
        _isNoNetworkConnectInLoadMore = false;
      });
      if (_hasNextPage == true &&
          _isFirstLoadRunning == false &&
          _isLoadMoreRunning == false &&
          _controller.position.extentAfter < 300.h) {
        print(_page);
        print(pageList.length);
        if (_page < pageList.length - 1) {
          setState(() {
            _isLoadMoreRunning =
                true; // Display a progress indicator at the bottom
          });

          _page += 1;
          selectedPageNumber = pageList[_page].page!; // Increase _page by 1
          offSet = pageList[_page].offset!;

          AppointmentResponse? v = await HospitalApiController().getNextAppt(
              patientCode: SharedPrefController().getValueFor(key: "p_code"),
              page: selectedPageNumber,
              offset: offSet);

          LoginGetXController.to.addToList(v!.myNextAppointments ?? []);

          // list.addAll(v!.myNextAppointments ?? []);

          setState(() {
            _isLoadMoreRunning = false;
          });
        } else {
          setState(() {
            _isLoadMoreRunning = false;
            _hasNextPage = false;
          });
        }
      }
    } else {
      setState(() {
        _isNoNetworkConnectInLoadMore = true;
      });
    }
  }

  void _firstLoad() async {
    bool x = await widget.networkConnectivity.initialise();
    if (x) {
      setState(() {
        _isFirstLoadRunning = true;
        _isNoNetworkConnect = false;
      });

      await getData();

      setState(() {
        _isFirstLoadRunning = false;
      });
    } else {
      setState(() {
        _isNoNetworkConnect = true;
      });
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    ChangeGetxController.to.flagPrevAppt = false;
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  getData() async {
    AppointmentResponse? v = await HospitalApiController().getNextAppt(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        page: selectedPageNumber,
        offset: offSet);

    LoginGetXController.to.addToFirstList(v!.myNextAppointments ?? []);
    // list = v!.myNextAppointments ?? [];
    pageList = v.pages ?? [];

    //print(v.pages!.length);
  }

  @override
  Widget build(BuildContext context) {
    return _isNoNetworkConnect
        ? InkWell(
            onTap: () {
              _firstLoad();
            },
            child: NewWidgetNetworkFirst(),
          )
        : _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GetBuilder<LoginGetXController>(
                builder: (controller) {
                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: ListView.builder(
                              controller: _controller,
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.list.length,
                              itemBuilder: (context, index) {
                                return ScedualBookingItem(
                                    controller.list[index]);
                              }),
                        ),
                      ),
                      if (_isNoNetworkConnectInLoadMore)
                        InkWell(
                          onTap: () {
                            _loadMore();
                          },
                          child: const NewWidgetNetworkLoadMore(),
                        ),
                      if (_isLoadMoreRunning == true)
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),

                      // if (_hasNextPage == false || pageList.length ==1)
                      //   SizedBox(
                      //     height: 200.h,
                      //   ),
                      Center(
                        child: Image.asset(
                          "assets/images/image1.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  );
                },
              );
  }
}
