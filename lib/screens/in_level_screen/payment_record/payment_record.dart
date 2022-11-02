import 'package:aphaa_app/screens/in_level_screen/payment_record/payment_screen_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../model/Pages.dart';
import '../../../model/patent_payment_record/PatientPaymentRecord.dart';
import '../../../model/patent_payment_record/PaymentRecordResponse.dart';
import '../../../preferences/shared_pref_controller.dart';

class PaymentRecord extends StatefulWidget {
  static String routeName = "/PaymentRecord";

  @override
  State<PaymentRecord> createState() => _PaymentRecordState();
}

class _PaymentRecordState extends State<PaymentRecord> {
  String selectedPageNumber = "1";
  List<PatientPaymentRecord> list = [];
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
      if(_page < pageList.length-1){
        setState(() {
          _isLoadMoreRunning = true; // Display a progress indicator at the bottom
        });

        _page += 1;
        selectedPageNumber = pageList[_page].page!; // Increase _page by 1
        offSet = pageList[_page].offset!;

        PaymentRecordResponse? v = await HospitalApiController().getPatientpayment(
            patientCode: SharedPrefController().getValueFor(key: "p_code"),
            page: selectedPageNumber,
            offset: offSet);

        list.addAll(v!.invoices ?? []);

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
    PaymentRecordResponse? v = await HospitalApiController().getPatientpayment(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        page: selectedPageNumber,
        offset: offSet);
    list = v!.invoices ?? [];
    pageList = v.pages ?? [];

    //print(v.pages!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.pay_book,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: Container(
            margin: EdgeInsets.all(15.0.r),
            padding: EdgeInsets.all(5.0.r),
            // alignment: Alignment.bottomLeft,
            // width: 80,
            // height: 500,
            decoration: BoxDecoration(
                color: const Color(0xff006F2C),
                borderRadius: BorderRadius.circular(5.r)),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15.sp,
            )),
      ),
      body:  _isFirstLoadRunning
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return PaymentScreenItem(
                      list[index]
                  );
                }),
          ),
          if (_isLoadMoreRunning == true)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (_hasNextPage == false)
            const Center(),
        ],
      )
    );
  }
}
