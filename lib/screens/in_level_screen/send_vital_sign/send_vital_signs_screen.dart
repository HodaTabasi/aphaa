import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../helper/helper.dart';
import '../../../helper/keyboardoverlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/api_response.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../main_screens/send_consult/text_area.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper;

class SendVitalSigns extends StatefulWidget {
  static String routeName = "/send_vs";


  @override
  State<SendVitalSigns> createState() => _SendVitalSignsState();
}

class _SendVitalSignsState extends State<SendVitalSigns> with Helpers, myHelper.Helpers1 {

  FocusNode numberFocusNode = FocusNode();
  FocusNode numberFocusNode1 = FocusNode();
  FocusNode numberFocusNode2 = FocusNode();
  FocusNode numberFocusNode3 = FocusNode();
  FocusNode numberFocusNode4 = FocusNode();

  late TextEditingController bt;
  late TextEditingController bp;
  late TextEditingController hr;
  late TextEditingController wt;
  late TextEditingController dia;
  late TextEditingController note;

  @override
  void initState() {
    bt = TextEditingController();
    bp = TextEditingController(text:"120/80");
    hr = TextEditingController();
    wt = TextEditingController();
    dia = TextEditingController();
    note = TextEditingController();
    super.initState();

    if (Platform.isIOS) {
      numberFocusNode.addListener(() {
        bool hasFocus = numberFocusNode.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
      numberFocusNode1.addListener(() {
        bool hasFocus = numberFocusNode1.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
      numberFocusNode2.addListener(() {
        bool hasFocus = numberFocusNode2.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
      numberFocusNode3.addListener(() {
        bool hasFocus = numberFocusNode3.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
      numberFocusNode4.addListener(() {
        bool hasFocus = numberFocusNode4.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.vital_signs1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        centerTitle: true,
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
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Form(
            child: Column(
              children: [
                EditTextItem(
                  'assets/images/diabetes.svg',
                  AppLocalizations.of(context)!.diabetes,
                  TextInputType.number,
                  controler: dia,
                  numberFocusNode: numberFocusNode,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                EditTextItem(
                  'assets/images/pressure.svg',
                  AppLocalizations.of(context)!.pressure,
                  TextInputType.numberWithOptions(
                      signed:true,
                       decimal: true
                  ),
                  controler: bp,
                  numberFocusNode: numberFocusNode1,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                ),
                EditTextItem(
                  'assets/images/thermometer.svg',
                  AppLocalizations.of(context)!.thermometer,
                  TextInputType.number,
                  controler: bt,
                  numberFocusNode: numberFocusNode2,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                EditTextItem(
                  'assets/images/weight.svg',
                  AppLocalizations.of(context)!.weight,
                  TextInputType.number,
                  controler: wt,
                  numberFocusNode: numberFocusNode3,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                EditTextItem(
                  'assets/images/heart1.svg',
                  AppLocalizations.of(context)!.heart,
                  TextInputType.number,
                  controler: hr,
                  numberFocusNode: numberFocusNode4,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                ),
                TextAreaWidget(note, AppLocalizations.of(context)!.notes),
                SizedBox(height: 10.h),
                BtnLayout(AppLocalizations.of(context)!.send,
                        () => _performAction()),
                Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  Future<void> _performAction() async {
    if (_checkData()) {
      await _sendVitalSigns();
    }
  }

  bool _checkData() {
    if (bt.text.isNotEmpty &&
        bp.text.isNotEmpty &&
        hr.text.isNotEmpty &&
        wt.text.isNotEmpty &&
        dia.text.isNotEmpty &&
        note.text.isNotEmpty ) {

      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }
  @override
  void dispose() {
    numberFocusNode.dispose();
    bt.dispose();
    bp.dispose();
    hr.dispose();
    wt.dispose();
    dia.dispose();
    note.dispose();
    super.dispose();
  }

  _sendVitalSigns() async {
    showLoaderDialog(context);
    ApiResponse apiResponse = await HospitalApiController().setPtVs(
      patientCode:SharedPrefController().getValueFor(key: "p_code"),
      note: note.text,
      bp: bp.text,
      bt: bt.text,
      dia: dia.text,
      hr:  hr.text,
      wt: wt.text,
    );
    Navigator.pop(context);
    if (apiResponse.success) {
      bt.clear();
          bp.clear();
          hr.clear();
          wt.clear();
          dia.clear();
          note.clear();
    }

    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}

