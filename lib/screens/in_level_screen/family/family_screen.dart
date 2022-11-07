import 'package:aphaa_app/model/familly/FamillyMember.dart';
import 'package:aphaa_app/model/familly/FamillyResponse.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../model/Pages.dart';
import 'familly_item.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FamillyScreen extends StatefulWidget {
  static String routeName = "/family";

  @override
  State<FamillyScreen> createState() => _FamillyScreenState();
}

class _FamillyScreenState extends State<FamillyScreen> {
  String selectedPageNumber = "1";
  List<FamilyMember> list = [];
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

        FamillyResponse? v = await HospitalApiController().getFamilyMembers(
          patientCode: SharedPrefController().getValueFor(key: "p_code"),
          page: selectedPageNumber,
          offset: offSet,
        );

        list.addAll(v!.familyMembers ?? []);

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
    FamillyResponse? v = await HospitalApiController().getFamilyMembers(
          patientCode: SharedPrefController().getValueFor(key: "p_code"),
          page: selectedPageNumber,
          offset: offSet,
        );
        list = v!.familyMembers ?? [];
    pageList = v.pages ?? [];

    //print(v.pages!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.my_family,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: Container(
            margin: EdgeInsets.all(15.0.r),
            padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
            // alignment: Alignment.bottomLeft,
            // width: 80,
            // height: 500,
            decoration: BoxDecoration(
                color: const Color(0xff006F2C),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15.sp,
            )),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.all(8.0.r),
        //     child: InkWell(
        //       onTap: () {},
        //       child: SvgPicture.asset(
        //         'assets/images/Notification.svg',
        //         semanticsLabel: 'Acme Logo',
        //       ),
        //     ),
        //   ),
        // ]
      ),
      body: _isFirstLoadRunning
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ListView.builder(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return FamillyItem(
                        list[index]);
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
      ),
      // bottomSheet: Image.asset(
      //   "assets/images/image1.png",
      //   fit: BoxFit.fitWidth,
      // ),
    );
  }
}
