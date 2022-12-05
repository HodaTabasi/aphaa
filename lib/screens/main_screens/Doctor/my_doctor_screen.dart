import 'package:aphaa_app/screens/main_screens/Doctor/DoctorItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../api/controllers/hospital_controller.dart';
import '../../../general/NewWidgetNetworkFirst.dart';
import '../../../general/NewWidgetNetworkLoadMore.dart';
import '../../../helper/nerwork_connectivity.dart';
import '../../../model/Pages.dart';
import '../../../model/VisitedDrs/VisitedDrsResponse.dart';
import '../../../model/doctor.dart';
import '../../../preferences/shared_pref_controller.dart';

class MyDoctorsScreen extends StatefulWidget {
  static String routeName = "/my_doctor";

  @override
  State<MyDoctorsScreen> createState() => _MyDoctorsScreenState();
}

class _MyDoctorsScreenState extends State<MyDoctorsScreen> {
  String selectedPageNumber = "1";
  List<Doctor> list = [];
  List<Pages> pageList = [];

  String offSet = "1";

  int _page = 0;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  bool _isNoNetworkConnect = false;
  bool _isNoNetworkConnectInLoadMore = false;

  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;


  void _loadMore() async {
    bool x = await _networkConnectivity.initialise();
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
      if(_page < pageList.length-1){
        setState(() {
          _isLoadMoreRunning = true; // Display a progress indicator at the bottom
        });

        _page += 1;
        selectedPageNumber = pageList[_page].page!; // Increase _page by 1
        offSet = pageList[_page].offset!;

        VisitedDrsResponse? v = await  HospitalApiController().getVisitedDrs(
            patientCode: SharedPrefController().getValueFor(key: "p_code"),page: selectedPageNumber,offset: offSet);

        list.addAll(v!.doctors ?? []);

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
    bool x = await _networkConnectivity.initialise();
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
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  getData() async {
    VisitedDrsResponse? v = await  HospitalApiController().getVisitedDrs(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),page: selectedPageNumber,offset: offSet);
    list = v!.doctors ?? [];
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
          title: Text(AppLocalizations.of(context)!.my_doctor,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Container(
                margin: EdgeInsets.all(15.0.r),
                padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
                decoration: BoxDecoration(
                    color: const Color(0xff006F2C),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15.sp,
                )),
          ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/logo.png',
                width: 34.w,
                height: 30.h,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ],
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
      body: _isNoNetworkConnect
          ? InkWell(
        onTap: () {
          _firstLoad();
        },
        child: NewWidgetNetworkFirst(),
      )
          :_isFirstLoadRunning
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: GridView.builder(
                // shrinkWrap: true,
                itemCount: list.length,
                controller: _controller,
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 240 / 330),
                itemBuilder: (context, index) {
                  return DoctorItem(list[index]);
                },
              ),
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
            Center(
              child: Image.asset(
                "assets/images/image1.png",
                fit: BoxFit.fitWidth,
              ),
            ),
        ],
      )
    );
  }
}
