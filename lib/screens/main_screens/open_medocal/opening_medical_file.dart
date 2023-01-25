import 'dart:io';

import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../api/controllers/quick_service_api_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/dropdown_id_type_item.dart';
import '../../../general/dropdown_nationalities_item.dart';
import '../../../general/edittext_item.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper;

import '../../../get/quick_service_getx_controller.dart';
import '../../../model/IDTypes.dart';
import '../../../model/Nationalities.dart';
import '../../../model/api_response.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';

class OpeningMedicalFile extends StatefulWidget {
  static String routeName = "/open_media_file";
  final String? restorationId = "1";

  @override
  State<OpeningMedicalFile> createState() => _OpeningMedicalFileState();
}

class _OpeningMedicalFileState extends State<OpeningMedicalFile>
    with Helpers, myHelper.Helpers1, RestorationMixin {
  late TextEditingController firstName;
  late TextEditingController medileName;
  late TextEditingController lastName;
  late TextEditingController gName;
  late TextEditingController phone;
  late TextEditingController inId;
  late TextEditingController _pEmail;
  late TextEditingController _insurance_date;
  final jobRoleCtrl = TextEditingController();
  final jobRoleCtrl1 = TextEditingController();

  XFile? _pickedImage;
  late ImagePicker _imagePicker;

  bool isLoading = false;

  List<Nationalities> myNatData = [];
  List<IDTypes> myIDData = [];

  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );
  var selectedDate = new HijriCalendar.now();

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1000),
          lastDate: DateTime(3000),

        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        setState(() {
          _insurance_date.text =
              "${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}";
        });
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getListsData();
  }


  getListsData() async {
    isLoading = true;
    myNatData = await HospitalApiController().getnatList() ?? [];
    myIDData = await HospitalApiController().getidTypesList() ?? [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    firstName = TextEditingController();
    medileName = TextEditingController();
    lastName = TextEditingController();
    _pEmail = TextEditingController();
    phone = TextEditingController();
    inId = TextEditingController();
    _insurance_date = TextEditingController();
    _imagePicker = ImagePicker();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.opening_medical_file,
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
              padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 5.0.r),
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
      ),

      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Text(
                    AppLocalizations.of(context)!
                        .to_open_medical_file_please_enter_data,
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
                      EditTextItem(
                        'assets/images/Profile.svg',
                        AppLocalizations.of(context)!.first_pasent_name,
                        TextInputType.name,
                        controler: firstName,

                      ),
                      EditTextItem(
                        'assets/images/Profile.svg',
                        AppLocalizations.of(context)!.second_pasent_name,
                        TextInputType.name,
                        controler: medileName,
                      ),
                      EditTextItem(
                        'assets/images/Profile.svg',
                        AppLocalizations.of(context)!.last_pasent_name,
                        TextInputType.name,
                        controler: lastName,
                      ),
                      DropDownNationalitiesItem(
                        myNatData,
                        'assets/images/nasinality.svg',
                        AppLocalizations.of(context)!.nat_choesse,
                        jobRoleCtrl,
                        dropIntValue: 1,
                      ),
                      DropDownIDTypeItem(
                        myIDData,
                        'assets/images/idtype.svg',
                        AppLocalizations.of(context)!.id_choesse,
                        jobRoleCtrl1,
                        dropIntValue: 2,
                      ),
                      EditTextItem('assets/images/id.svg',
                          AppLocalizations.of(context)!.identity_iqama,
                          TextInputType.number,
                          controler: inId),
                      EditTextItem('assets/images/phone.svg',
                          AppLocalizations.of(context)!.phone,
                          TextInputType.phone,
                          controler: phone),
                      EditTextItem(
                        'assets/images/Message.svg',
                        AppLocalizations.of(context)!.email,
                        TextInputType.emailAddress,
                        controler: _pEmail,
                      ),
                      InkWell(
                        onTap: () {
                          _selectedDate1(context);
                          // _restorableDatePickerRouteFuture.present();
                        },
                        child: EditTextItem('assets/images/Calendar.svg',
                            AppLocalizations.of(context)!.dob_end_date,
                            TextInputType.name,
                            b: false, controler: _insurance_date),
                      ),
                      InkWell(
                        onTap: () async {
                          await _pickImage();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: Color(0xff0E4C8F), width: 0.5.w),
                          ),
                          margin: EdgeInsets.all(16.r),
                          child: Column(
                            children: [
                              // LinearProgressIndicator(
                              //   minHeight: 10,
                              //   backgroundColor: Colors.green.shade200,
                              //   color: Colors.green.shade700,
                              //   value: _progressValue,
                              // ),
                              Expanded(
                                child: _pickedImage != null
                                    ? Image.file(File(_pickedImage!.path))
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Spacer(),
                                          SvgPicture.asset(
                                              'assets/images/Upload.svg',
                                              semanticsLabel: 'Acme Logo'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .attach_a_copy_of_your_id,
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 13.sp,
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Spacer(),
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BtnLayout(AppLocalizations.of(context)!.opening_medical_file,
                    () => _performUpload()),
                Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
    );
  }

  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 80);
    if (imageFile != null) {
      setState(() => _pickedImage = imageFile);
    }
  }

  Future<void> _performUpload() async {
    if (_checkData()) {
      await _uploadImage();
    }
  }

  bool _checkData() {

    if (phone.text.isNotEmpty &&
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        medileName.text.isNotEmpty &&
        inId.text.isNotEmpty &&
        _insurance_date.text.isNotEmpty &&
        QuickServiceGetxController.to.nationality != null &&
        QuickServiceGetxController.to.idType != null &&
        _pickedImage != null) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  Future<void> _uploadImage() async {
    showLoaderDialog(context);
    ApiResponse apiResponse = await QuickServiceApiController().openFile(
        mobile: phone.text,
        fname: firstName.text,
        lname: lastName.text,
        gname: "",
        pname: medileName.text,
        identity_number: inId.text,
        image: _pickedImage!.path,
        email: _pEmail.text,
        DOB: _insurance_date.text,
        request_type: QuickServiceGetxController.to.requestType,
        nationality: QuickServiceGetxController.to.nationality,
        id_type: QuickServiceGetxController.to.idType);
    Navigator.pop(context);
    if (apiResponse.success) {
      Navigator.pop(context);
      NewAccountGetxController.to.fileData = apiResponse.object;
      NewAccountGetxController.to.fromOpenFile = true;
      // Navigator.pushNamed(context, NewAccountFirst.routeName);
      // showAlertDialog(context);
      Navigator.pop(context);
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }

  Future<void> _selectedDate1(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: new HijriCalendar()
        ..hYear = 1500
        ..hMonth = 9
        ..hDay = 25,
      firstDate: new HijriCalendar()
        ..hYear = 1356
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _selectedDate.value =  selectedDate.hijriToGregorian(selectedDate.hYear, selectedDate.hMonth, selectedDate.hDay);
        _insurance_date.text =
        "${selectedDate.hYear}-${selectedDate.hMonth}-${selectedDate.hDay}";
      });
  }
}
