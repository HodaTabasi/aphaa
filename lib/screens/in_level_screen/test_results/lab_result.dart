import 'package:aphaa_app/model/lab_rad_result/ServiceTest.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/in_level_screen/test_results/test_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../model/Pages.dart';
import '../../../model/lab_rad_result/LabReportsResponse.dart';

class LabResult extends StatefulWidget {
  @override
  State<LabResult> createState() => _LabResultState();
}

class _LabResultState extends State<LabResult> {
  String selectedPageNumber = "1";
  List<ServiceTest> list = [];
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

      if (_page < pageList.length - 1) {
        setState(() {
          _isLoadMoreRunning =
              true; // Display a progress indicator at the bottom
        });

        _page += 1;
        selectedPageNumber = pageList[_page].page!; // Increase _page by 1
        offSet = pageList[_page].offset!;

        LabReportsResponse? v = await HospitalApiController().getLabReports(
            patientCode: SharedPrefController().getValueFor(key: "p_code"),
            page: selectedPageNumber,
            offset: offSet);

        list.addAll(v!.services ?? []);

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
    LabReportsResponse? v = await HospitalApiController().getLabReports(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        page: selectedPageNumber,
        offset: offSet);

    list = v!.services ?? [];
    pageList = v.pages ?? [];

    print(_page);
    print(pageList.length);

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
                child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return TestResultItem(serviceTest: list[index]);
                    }),
              ),
              if (_isLoadMoreRunning == true)
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 40.w),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (_hasNextPage == false) const Center(),
            ],
          );
  }
}
