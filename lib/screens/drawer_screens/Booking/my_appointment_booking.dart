import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/model/time_avilable_response/AvailableTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../api/controllers/hospital_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/dropdown_item.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../model/AddAppoimentResult.dart';
import '../../../model/Clinic.dart';
import '../../../model/doctor.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../main_screens/Appointment Booking/time_appoiment_item.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper;

import '../done/done_screen.dart';
import 'edittext_item_calender.dart';

class MyAppointmentBooking extends StatefulWidget {
  bool? flag;
  static String routeName = "/my_booking_screen";

  MyAppointmentBooking({this.flag});

  @override
  State<MyAppointmentBooking> createState() => _MyAppointmentBookingState();
}

class _MyAppointmentBookingState extends State<MyAppointmentBooking>
    with Helpers, myHelper.Helpers1 {
  List<Clinic> myData = [];
  List<Doctor> myDataDoctor = [];

  late TextEditingController dateText;

  // DateTime? _currentDate;

  // var _value = -1;
  bool isLoading = false;


  @override
  void initState() {
    dateText = TextEditingController();
    super.initState();
    // doPaymentConfiguration();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getListsData();
  }

  getListsData() async {
    isLoading = true;
    myData = await HospitalApiController().getClList() ?? [];
    setState(() {
      isLoading = false;
    });
    // Future.delayed(Duration.zero, () async {
    //   await HospitalApiController().getClDrs(clinicCode: myData[0].clinicCode).then((value) {
    //     NewAccountGetxController.to.changeMyDoctorList(value!.doctors!);
    //     myDataDoctor = value.doctors!;
    //     setState(() {
    //       isLoading = false;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.flag!
          ? null
          : AppBar(
              elevation: 0,
              // leadingWidth: 40,
              title: Text(AppLocalizations.of(context)!.appointment,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )),
              titleSpacing: 2,
              centerTitle: true,
        leading:
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

              // leading: Container(
              //     margin: const EdgeInsets.all(15.0),
              //     padding: const EdgeInsets.all(5.0),
              //     // alignment: Alignment.bottomLeft,
              //     // width: 80,
              //     // height: 500,
              //     decoration: BoxDecoration(
              //         color: const Color(0xff006F2C),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: const Icon(
              //       Icons.arrow_back_ios,
              //       color: Colors.white,
              //       size: 15,
              //     )),
            ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GetBuilder<NewAccountGetxController>(
              builder: (value) => ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppLocalizations.of(context)!.head_of_appoitment_screen,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        DropDownItem(myData, 'assets/images/hospital.svg',
                            AppLocalizations.of(context)!.clenice_choesse),
                        DoctorDropDownItem(
                            value.doctorsList,
                            'assets/images/docgreen.svg',
                            AppLocalizations.of(context)!.dovtor_choesse),
                    Visibility(
                      visible: value.global != null,
                      child: EditTextItemCalender('assets/images/Calendar.svg',
                          AppLocalizations.of(context)!.appoitment_date,
                          b: false, controler: dateText),),

                        if (!value.isChangeLoading)
                          Stack(
                            children: [
                              Visibility(
                                  visible: value.avilableDate.isEmpty &&
                                      !value.isChangeLoading || value.global == null,
                                  child: Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Image.asset("assets/images/calendar.png"),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(AppLocalizations.of(context)!.no_avilavle_date),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          // Visibility(
                                          //   visible: NewAccountGetxController.to.currentDate !=null,
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: InkWell(
                                          //       onTap: (){
                                          //         print(NewAccountGetxController.to.currentDate);
                                          //         NewAccountGetxController.to.getDoctorSchedules(
                                          //             NewAccountGetxController.to.doctorCode, DateTime.now().month,DateTime.now().year);
                                          //         NewAccountGetxController.to.changeLoading();
                                          //       },
                                          //       child: Text("المواعيد المتاحة",style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.bold,
                                          //           color: Colors.red,
                                          //           fontFamily: 'Tajawal'
                                          //       ),),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ))),
                              Visibility(
                                  visible: value.global != null &&
                                      value.avilableDate.isNotEmpty && value.avilableTime.isEmpty,
                                  child: widget1(value.avilableDate, value)),
                            ],
                          ),
                        Visibility(
                            visible: value.isChangeLoading,
                            child: const Center(
                                child: CircularProgressIndicator())),
                        Visibility(
                          visible: value.avilableTime.isNotEmpty,
                          child: Padding(
                            padding: EdgeInsets.all(16.0.r),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.green,
                                  size: 23.sp,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.fromLTRB(8.r, 8.r, 8.r, 0.r),
                                  child: Text(
                                    AppLocalizations.of(context)!.time,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: (){
                                    value.changeClaenderVisabiltyFlag();
                                    value.currentDate = null;
                                    value.GroupValue = -1;
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 14.0.r),
                                    child:   SvgPicture.asset(
                                        'assets/images/Calendar.svg',
                                        semanticsLabel: 'Acme Logo'
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        if (!value.isChangeLoading)
                          Visibility(
                            visible: value.avilableDate.isNotEmpty,
                            child: Stack(
                              children: [
                                Visibility(
                                    visible: value.avilableTime.isEmpty &&
                                        !value.isChangeTimeLoading,
                                    child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Image.asset("assets/images/free_time.png"),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(AppLocalizations.of(context)!.no_avilavle_time),
                                          ],
                                        ))),
                                Visibility(
                                    visible: value.isChangeTimeLoading,
                                    child: const Center(
                                        child: CircularProgressIndicator())),
                                if (!value.isChangeTimeLoading)
                                  Column(
                                    children: [
                                      Visibility(
                                        visible:
                                        value.avilableTime.isNotEmpty,
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(color: Colors.red),
                                                text: "  ${value.timeResponse?.reqAmt??''} ريال ",
                                                children: [
                                                  TextSpan(text: value.timeResponse?.paymentNotice??''),
                                                ])),
                                      ),
                                      // Text(
                                      //   value.timeResponse!.paymentNotice ?? "",
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0.r),
                                        child: SizedBox(
                                          height: 100.h,
                                          // width: 80,
                                          child: Visibility(
                                            visible:
                                            value.avilableTime.isNotEmpty,
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                              value.avilableTime.length,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h),
                                              scrollDirection: Axis.horizontal,
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 1,
                                                  mainAxisSpacing: 10.h,
                                                  crossAxisSpacing: 10.w,
                                                  childAspectRatio:
                                                  280 / 200),
                                              itemBuilder: (context, index) {
                                                return TimeAppoitmentItem(
                                                    data: value
                                                        .avilableTime[index],
                                                    title: "",
                                                    value: index,
                                                    groupValue: value.GroupValue,
                                                    onChanged: (value1) =>
                                                        setState(() {
                                                          value.GroupValue = value1;
                                                        }));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Visibility(
                      visible: value.avilableTime.isNotEmpty &&
                          value.avilableTime.isNotEmpty,
                      child: BtnLayout(
                          AppLocalizations.of(context)!.appointment,
                          () => _performAction(value))),

                  // Image.asset(
                  //   "assets/images/image1.png",
                  //   fit: BoxFit.fitWidth,
                  // ),
                ],
              ),
            ),
    );
  }

  Widget widget1(List<String> markedDateMap, NewAccountGetxController value) {
    List<DateTime> event = markedDateMap.map((e) {
      return DateTime.parse(e);
    }).toList();
    print(event);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.h),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<Event>(
          locale: SharedPrefController()
                  .getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
          pageScrollPhysics: const NeverScrollableScrollPhysics(),
          onCalendarChanged: (DateTime date) {
            print(" ${date.year} ${date.month}");
            print(int.parse(NewAccountGetxController.to.initMonth!));
            if(int.parse(NewAccountGetxController.to.initMonth!) <= date.month){
              print(date.month-1);
              NewAccountGetxController.to.currentDate = date;
              NewAccountGetxController.to.getDoctorSchedules(
                  NewAccountGetxController.to.doctorCode, date.month, date.year,isFirstTime: false);
            }else{
              NewAccountGetxController.to.getDoctorSchedules(
                  NewAccountGetxController.to.doctorCode, date.month+1, date.year,isFirstTime: false);
            }
             },
          onDayPressed: (DateTime date, List<Event> events) async {
            this.setState(() {
              NewAccountGetxController.to.currentDate = date;
              dateText.text =
                  "${NewAccountGetxController.to.currentDate!.year}-${NewAccountGetxController.to.currentDate!.month}-${NewAccountGetxController.to.currentDate!.day}";
            });
            if (event.contains(NewAccountGetxController.to.currentDate)) {
              await HospitalApiController().getDoctorSchedDtl(
                  clinicCode: value.clinicCode,
                  doctorCode: value.doctorCode,
                  availableDay: NewAccountGetxController.to.currentDate,
                  pId:SharedPrefController().getValueFor<String>(key: PrefKeysPatient.identityNumber.name)
              );
            } else {
              showRigectAlertDialog(context);
            }
          },
          weekendTextStyle: const TextStyle(
            color: Colors.black,
          ),
          thisMonthDayBorderColor: Colors.transparent,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),

          firstDayOfWeek:1,
          weekFormat: false,
          // markedDatesMap: _markedDateMap,
          height: 350.0.h,
          width: 350.h,
          todayButtonColor: Colors.white,
          todayBorderColor: Colors.green,
          todayTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
          ),
          daysTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
          ),
          // showIconBehindDayText: true,
          // selectedDateTime: _currentDate,
          headerTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
          ),
          selectedDateTime: NewAccountGetxController.to.currentDate,
          selectedDayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w700,
          ),
          weekdayTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
          ),
          // showOnlyCurrentMonthDate: true,
          showWeekDays: true,
          showIconBehindDayText: true,
          weekDayBackgroundColor: Color(0xffEBF6EF),
          weekDayPadding: EdgeInsets.all(5.5),
          weekDayFormat: WeekdayFormat.weekdays,
          dayPadding: 8.w,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          daysHaveCircularBorder: true,
          showHeaderButton: true,
          headerMargin: EdgeInsets.all(16),
          isScrollable: true,
          multipleMarkedDates: MultipleMarkedDates(
              markedDates: event.map((e) {
            return MarkedDate(
                color: Color(0xffedeef5),
                date: e,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.normal,
                ));
          }).toList()),

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }

  Future<void> _performAction(value) async {
    if (_checkData(value)) {
      await _performRigestration(value.clinicCode, value.doctorCode,
          dateText.text, value.avilableTime[NewAccountGetxController.to.GroupValue]);
    }
  }

  bool _checkData(value) {
    if (value.clinicCode.isNotEmpty &&
        value.doctorCode.isNotEmpty &&
        dateText.text.isNotEmpty &&
        value.avilableTime[NewAccountGetxController.to.GroupValue] != null && NewAccountGetxController.to.GroupValue != -1) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  _performRigestration(String clinicCode, String doctorCode, String dateText,
      AvailableTime avilableTime) async {
    /*resDate: appointments.resDate,resNo: appointments.resNo,doctorCode: appointments.doctor?.doctorCode*/
    showLoaderDialog(context);
    AddAppoimentResult? response = await HospitalApiController().addAppoitment(
        patientCode: SharedPrefController().getValueFor(key: "p_code"),
        clinicCode: clinicCode,
        doctorCode: doctorCode,
        patientName: SharedPrefController()
            .getValueFor(key: PrefKeysPatient.firstName.name),
        consultTime24: avilableTime.consultTime24,
        patientId: SharedPrefController()
            .getValueFor(key: PrefKeysPatient.identityNumber.name),
        patientMOB: SharedPrefController()
            .getValueFor(key: PrefKeysPatient.mobile.name),
        resDate: dateText,
        consultSNo: avilableTime.consultSNo,
        resRemarks: "lap-lap");
      Navigator.pop(context);
    if (response?.resStatusCode == "1") {
      NewAccountGetxController.to.resNo = response?.resNo;
      NewAccountGetxController.to.resDate = response?.resDate;

      NewAccountGetxController.to.clearData();
      NewAccountGetxController.to.GroupValue = -1;
      this.dateText.text = "";

      NewAccountGetxController.to.doctorCode = doctorCode;
      showAlertDialog(context,flag: true,message: AppLocalizations.of(context)!.thanks,message2: response?.resStatusDesc);

      // onBookClick(context);
      // showAlertDialog(context);
    } else {
      showSnackBar(context, message: response!.resStatusDesc!, error: true);
    }
  }

  @override
  void deactivate() {
    NewAccountGetxController.to.clearDataBeforeSend();
    super.deactivate();
  }

}
