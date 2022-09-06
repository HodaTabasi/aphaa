import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDropDownItem extends StatefulWidget {
  List<Doctor> myData;
  String iconName;
  String dropValue;
  int? dropIntValue;

  DoctorDropDownItem(this.myData,this.iconName,this.dropValue, {this.dropIntValue});

  @override
  State<DoctorDropDownItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<DoctorDropDownItem> {
  var global = 1;


  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: DropdownButton<int>(
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
                  onChanged: (int? val){
                    setState(() {
                      global = val!;
                      QuickServiceGetxController.to.doctorId.value = global;
                    });
                  },
                  value: global,
                  items: widget.myData.map((value) {
                    return new DropdownMenuItem<int>(
                      value: value.id,
                      child: Text(
                          value.name!,
                          style:  TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff058638),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
