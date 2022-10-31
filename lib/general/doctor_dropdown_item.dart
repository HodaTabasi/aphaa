import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoctorDropDownItem extends StatefulWidget {
  List<Doctor>  myData;
  String iconName;
  String dropValue;
  int? dropIntValue;

  DoctorDropDownItem(this.myData,this.iconName,this.dropValue, {this.dropIntValue});

  @override
  State<DoctorDropDownItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<DoctorDropDownItem> {
  // String? global;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
            visible: NewAccountGetxController.to.isUpdateCliniceCode,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 20.r),
              child: Row(
                children: [
                  Spacer(),
                  const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                ],
              ),
            )),
        Container(
          margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff0E4C8F),width: 0.5.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 14.0.r),
                  child:   SvgPicture.asset(
                      widget.iconName,
                      semanticsLabel: 'Acme Logo'
                  ),
                ),
                VerticalDivider(
                    width:2.w,
                    thickness:0.5.w,
                    color:Color(0xff0E4C8F)
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // value: widget.global,
                      underline: SizedBox(),
                      hint: Text(
                        widget.dropValue,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (String? val){
                        setState(() {
                          // QuickServiceGetxController.to.doctorName = widget.myData.where((element) => element.doctorName == val).toList().first.doctorName!;
                          NewAccountGetxController.to.changeglobal(val!);
                          NewAccountGetxController.to.doctorCode = val;
                          NewAccountGetxController.to.getDoctorSchedules(val) ;
                        });
                      },
                      value: NewAccountGetxController.to.global,
                      items: widget.myData.map((value) {
                        return DropdownMenuItem<String>(
                          value: value.doctorCode,
                          child: Text(
                              value.doctorName!,
                              style:  TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13.sp,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        );
                      }).toList(),
                      icon:  Visibility(
                        visible: !NewAccountGetxController.to.isUpdateCliniceCode,
                        child: widget.myData.isNotEmpty?Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff058638),
                        ):Text(AppLocalizations.of(context)!.no_doctor_found ,style: TextStyle(fontSize: 14.r,fontFamily: 'Tajawal'),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
