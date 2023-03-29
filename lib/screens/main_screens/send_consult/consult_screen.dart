import 'dart:io';

import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/api/controllers/quick_service_api_controller.dart';
import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/main_screens/send_consult/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper;
import 'package:get/get.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../helper/keyboardoverlay.dart';
import '../../../model/Clinic.dart';
import '../../../model/api_response.dart';

class SendConsultScreen extends StatefulWidget {
  static String routeName = "/send_consult";

  @override
  State<SendConsultScreen> createState() => _SendConsultScreenState();
}

class _SendConsultScreenState extends State<SendConsultScreen>
    with Helpers, myHelper.Helpers1 {
  List<Clinic> myData = [];

  List<Doctor> myDataDoctor = [];
  bool isLoading = false;
  FocusNode numberFocusNode = FocusNode();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController consultText;

  @override
  void initState() {
    if(QuickServiceGetxController.to.fromHome){
      name = TextEditingController(text: SharedPrefController().getValueFor(key: PrefKeysPatient.firstName.name));
      phone = TextEditingController(text:SharedPrefController().getValueFor(key: PrefKeysPatient.mobile.name));
    }else {
      name = TextEditingController();
      phone = TextEditingController();
    }
    email = TextEditingController();
    consultText = TextEditingController();
    if(Platform.isIOS){
      numberFocusNode.addListener(() {
        bool hasFocus = numberFocusNode.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
    }

    super.initState();
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
    //   await HospitalApiController()
    //       .getClDrs(clinicCode: myData[0].clinicCode)
    //       .then((value) {
    //     // Navigator.pop(context);
    //     NewAccountGetxController.to.changeMyDoctorList(value!.doctors!);
    //     myDataDoctor = value.doctors!;
    //   });
    //
    //   // NewAccountGetxController().changeDropDownValue(myData[0].clinicCode, 2,context: context);
    //   // print("ff aa s ${id}");
    // });
    // HospitalApiController().getClDrs();
  }

  // Future<void> getAllDoctors() async {
  //   myDataDoctor = await AppApiController().getAllDoctors();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.consultation_request,
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
          : GetBuilder<NewAccountGetxController>(
              builder: (value) => ListView(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Text(
                      AppLocalizations.of(context)!.head_of_consult_screen,
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
                          AppLocalizations.of(context)!.pasent_name,
                          TextInputType.name,
                          controler: name,
                        ),
                        EditTextItem(
                          'assets/images/Message.svg',
                          AppLocalizations.of(context)!.email,
                          TextInputType.emailAddress,
                          controler: email,
                        ),
                        EditTextItem(
                          'assets/images/phone.svg',
                          AppLocalizations.of(context)!.phone,
                          TextInputType.phone,
                          controler: phone,
                          numberFocusNode: numberFocusNode,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                        DropDownItem(
                          myData,
                          'assets/images/hospital.svg',
                          AppLocalizations.of(context)!.clenice_choesse,
                          dropIntValue: 3,
                        ),
                        DoctorDropDownItem(
                          value.getListDoctor(),
                          'assets/images/docgreen.svg',
                          AppLocalizations.of(context)!.dovtor_choesse,
                          dropIntValue: 2,
                        ),
                        TextAreaWidget(consultText)
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  BtnLayout(AppLocalizations.of(context)!.consult_send,
                      () => _performAction()),
                  Image.asset(
                    "assets/images/image1.png",
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _performAction() async {
    if (_checkData()) {
      await _sendConsult();
    }
  }

  bool _checkData() {
    if (email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        consultText.text.isNotEmpty &&
        name.text.isNotEmpty &&
        QuickServiceGetxController.to.clinicName.isNotEmpty &&
        QuickServiceGetxController.to.doctorName.isNotEmpty) {
      return true;
    }else if(QuickServiceGetxController.to.clinicName.isEmpty){
      showSnackBar(context,
          message: AppLocalizations.of(context)!.select_clinic,
          error: true);
      return false;
    } else if(QuickServiceGetxController.to.doctorName.isEmpty){
      showSnackBar(context,
          message: AppLocalizations.of(context)!.select_doctor,
          error: true);
      return false;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  Future<void> _sendConsult() async {
    showLoaderDialog(context);
    ApiResponse apiResponse = await QuickServiceApiController().consultation(
        email: email.text,
        mobile: phone.text,
        name: name.text,
        description: consultText.text,
        clinic: QuickServiceGetxController.to.clinicName,
        doctors_id: QuickServiceGetxController.to.doctorName);
    Navigator.pop(context);
    if (apiResponse.success) {
      QuickServiceGetxController.to.clinicName = "";
     QuickServiceGetxController.to.doctorName = "";
     name.text = "";
     email.text = "";
     phone.text = "";
     setState(() {
     });
     Navigator.pop(context);
      // showAlertDialog1(context);
    }

    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
  @override
  void deactivate() {
    QuickServiceGetxController.to.fromHome = false;

    super.deactivate();
  }
  @override
  void dispose() {
    numberFocusNode.dispose();
    super.dispose();
  }
}
