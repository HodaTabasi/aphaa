import 'package:aphaa_app/helper/nerwork_connectivity.dart';
import 'package:aphaa_app/model/lab_rad_result/ServiceTest.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/in_level_screen/test_results/test_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../general/NewWidgetNetworkFirst.dart';
import '../../../general/NewWidgetNetworkLoadMore.dart';
import '../../../model/Pages.dart';
import '../../../model/lab_rad_result/LabReportsResponse.dart';

class RabResult extends StatefulWidget {
  NetworkConnectivity networkConnectivity;
  RabResult(this.networkConnectivity);

  @override
  State<RabResult> createState() => _RabResultState();
}

class _RabResultState extends State<RabResult> {
  String selectedPageNumber = "1";
  List<ServiceTest> list = [];
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

        LabReportsResponse? v = await HospitalApiController().getRadReports(
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _firstLoad();
    });
    _controller = ScrollController()..addListener(_loadMore);
  }

  getData() async {
    LabReportsResponse? v = await HospitalApiController().getRadReports(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        page: selectedPageNumber,
        offset: offSet);

    list = v!.services ?? [];
    pageList = v.pages ?? [];

  }

  @override
  Widget build(BuildContext context) {
    return  _isNoNetworkConnect
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
              if (_isNoNetworkConnectInLoadMore)
                InkWell(
                  onTap: () {
                    _loadMore();
                  },
                  child: const NewWidgetNetworkLoadMore(),
                ),
              if (_isLoadMoreRunning == true)
                 Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              // if (_hasNextPage == false || pageList.length ==1)
                Center(
                child: Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          );
  }
}
