import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../model/Clinic.dart';
import '../model/InsuranceCompany.dart';

class DropDownInsuranceItem extends StatefulWidget {
  List<InsuranceCompany> myData;
  String iconName;
  String dropValue;
  int? dropIntValue;

  DropDownInsuranceItem(this.myData,this.iconName,this.dropValue, {this.dropIntValue});

  @override
  State<DropDownInsuranceItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<DropDownInsuranceItem> {
  String? global;
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
                child: DropdownButton<String>(
                  isExpanded: true,
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
                  onChanged: (val) {
                    setState(() {
                      global = val!;
                      NewAccountGetxController.to.companyName = val;
                      // NewAccountGetxController.to.changeDropDownValue(val, widget.dropIntValue) ;
                      setState(() {
                      });
                    });
                  },
                  value: global,
                  // value: dropdownValue,
                  items: widget.myData.map((value) {
                    return new DropdownMenuItem<String>(
                      value: value.companyCode,
                      child: Text(
                          value.companyName!,
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
