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
import '../../../model/Eligibility.dart';
import '../../../model/api_response.dart';
import 'gender_selected.dart';

class SendConsultScreen extends StatefulWidget {
  static String routeName = "/send_consult";
  bool fromHome = false;

  SendConsultScreen({this.fromHome = false});

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
  late TextEditingController phone;
  late TextEditingController id;
  late TextEditingController consultText;
  late TextEditingController height;
  late TextEditingController weight;
  late TextEditingController age;
  late TextEditingController disease;
  late TextEditingController alagy;

  @override
  void initState() {
    if(QuickServiceGetxController.to.fromHome){
      Eligibility eg =  SharedPrefController().getEligibility();
      name = TextEditingController(text: eg.patientName);
      phone = TextEditingController(text:eg.patientMOB);
      weight = TextEditingController(text: eg.patientWeight);
      height = TextEditingController(text: eg.patientHight);
      age = TextEditingController(text: eg.patientAge);
      disease = TextEditingController(text: eg.chrDisease);
      alagy = TextEditingController(text: eg.patientAlgy);
      QuickServiceGetxController.to.gender = eg.patientGender == "1"?false:true;
    }else {
      name = TextEditingController();
      phone = TextEditingController();
      weight = TextEditingController();
      height = TextEditingController();
      age = TextEditingController();
      disease = TextEditingController();
      alagy = TextEditingController();
    }
    id = TextEditingController();
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
        centerTitle: widget.fromHome,
        leading: widget.fromHome ?null:InkWell(
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
      body: GetBuilder<NewAccountGetxController>(
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
                          'assets/images/id.svg',
                          AppLocalizations.of(context)!.identity_number,
                          TextInputType.number,
                          controler: id,
                        ),
                        EditTextItem(
                          'assets/images/phone.svg',
                          AppLocalizations.of(context)!.phone,
                          TextInputType.phone,
                          controler: phone,
                          numberFocusNode: numberFocusNode,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                        //
                        GenderSelected(QuickServiceGetxController.to.gender,'assets/images/phone.svg',),
                        EditTextItem(
                          'assets/images/age.svg',
                          AppLocalizations.of(context)!.age,
                          TextInputType.number,
                          controler: age,
                          // numberFocusNode: numberFocusNode,
                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                        EditTextItem(
                          'assets/images/higt1h.svg',
                          AppLocalizations.of(context)!.height,
                          TextInputType.number,
                          controler: height,
                          // numberFocusNode: numberFocusNode,
                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                        EditTextItem(
                          'assets/images/weight.svg',
                          AppLocalizations.of(context)!.weight,
                          TextInputType.number,
                          controler: weight,
                          // numberFocusNode: numberFocusNode,
                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),

                        TextAreaWidget(disease,AppLocalizations.of(context)!.disaese),
                        TextAreaWidget(alagy,AppLocalizations.of(context)!.alagy),
                        TextAreaWidget(consultText,AppLocalizations.of(context)!.consult_note)
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

    if (id.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        consultText.text.isNotEmpty &&
        age.text.isNotEmpty &&
        alagy.text.isNotEmpty &&
        name.text.isNotEmpty &&
        height.text.isNotEmpty &&
        weight.text.isNotEmpty &&
        disease.text.isNotEmpty ) {
      print("object1");
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  Future<void> _sendConsult() async {

    showLoaderDialog(context);
    ApiResponse apiResponse = await HospitalApiController().sendConsultation(
      patientName: name.text,
      patientMOB: phone.text,
      patientId: id.text,
      patientAge: age.text,
      patientGender: QuickServiceGetxController.to.gender?'1':'2',
      patientHight: height.text,
      patientWeight: weight.text,
      patientConsult: consultText.text,
      chrDisease: disease.text,
      patientAlgy: alagy.text,
    );
    Navigator.pop(context);
    if (apiResponse.success) {
      QuickServiceGetxController.to.clinicName = "";
     QuickServiceGetxController.to.doctorName = "";
     name.text = "";
     id.text = "";
     phone.text = "";
     setState(() {
     });
     // Navigator.pop(context);
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
