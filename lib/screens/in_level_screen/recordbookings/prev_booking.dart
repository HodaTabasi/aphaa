import 'package:aphaa_app/screens/in_level_screen/recordbookings/scedual_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../model/Appointment/AppointmentResponse.dart';
import '../../../model/Appointment/Appointments.dart';
import '../../../model/Pages.dart';
import '../../../preferences/shared_pref_controller.dart';

class PrevBooking extends StatefulWidget {
  @override
  State<PrevBooking> createState() => _PrevBookingState();
}

class _PrevBookingState extends State<PrevBooking> {
  String selectedPageNumber = "1";
  List<Appointments> list = [];
  List<Pages> pageList = [];

  String offSet = "1";

  int _page = 0;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  void _loadMore() async {
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

        AppointmentResponse? v = await HospitalApiController().getPrevAppt(
            patientCode: SharedPrefController().getValueFor(key: "p_code"),
            offset: offSet,
            page: selectedPageNumber);

        list.addAll(v!.myPrevAppointments ?? []);

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
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    await getData();

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  getData() async {
    AppointmentResponse? v = await HospitalApiController().getPrevAppt(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        offset: offSet,
        page: selectedPageNumber);
    list = v!.myPrevAppointments ?? [];
    pageList = v.pages ?? [];

    //print(v.pages!.length);
  }

  @override
  Widget build(BuildContext context) {
    return _isFirstLoadRunning
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: ListView.builder(
                    controller: _controller,
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ScedualBookingItem(list[index]);
                      }),
                ),
              ),
              if (_isLoadMoreRunning == true)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              if (_hasNextPage == false)
                const Center(
                ),
            ],
          );
  }
}
