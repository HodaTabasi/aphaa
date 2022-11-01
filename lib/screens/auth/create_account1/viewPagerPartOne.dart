import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../get/new_account_getx_controller.dart';
import '../../../model/Eligibility.dart';
import '../../main_screens/open_medocal/opening_medical_file.dart';
import '../create_account/Choosere.dart';
import '../create_account/text_filed.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper ;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewPagerPartOne extends StatefulWidget {
  var controller;

  ViewPagerPartOne({this.controller});


  @override
  State<ViewPagerPartOne> createState() => _ViewPagerPartOneState();
}

class _ViewPagerPartOneState extends State<ViewPagerPartOne> with  myHelper.Helpers{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 203.w,
            height: 161.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xffF5F8FB),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Choosere()),
          ),
          MyTextFeild(NewAccountGetxController.to.pID),
          SizedBox(
            height: 20.h,
          ),
          AvatarGlow(
            endRadius: 35.0.r,
            showTwoGlows: true,
            glowColor: Color(0xff8CABCD),
            animate: true,
            curve: Curves.easeInCubic,
            child: InkWell(
              onTap: ()  => doAction(),
              child: Image.asset(
                'assets/images/icon1.png',
                height: 50.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
  doAction(){
    if(validation()){
      checkEligibility();
    }
  }

  bool validation(){
   return NewAccountGetxController.to.pID.text.isNotEmpty ? true :false;
  }

  Future<void> checkEligibility() async {
    showLoaderDialog(context);
    if(NewAccountGetxController.to.pID.text.isNotEmpty){
      Eligibility? eg = await HospitalApiController().getPtElg(patientId: NewAccountGetxController.to.pID.text);
      Navigator.pop(context);
      if(eg != null){
        if(eg.isEligible == "true"){

          NewAccountGetxController.to.setEligibility(eg);
          widget.controller.nextPage(
              duration: const Duration(microseconds: 100),
              curve: Curves.bounceIn);
        } else {
          Navigator.pushReplacementNamed(context, OpeningMedicalFile.routeName);
        }
      } else {
        showSnackBar(context, message: AppLocalizations.of(context)!.something_wrong, error: true);
      }
    }else {
      showSnackBar(context, message: AppLocalizations.of(context)!.enter_required_data, error: true);
    }
  }
}
