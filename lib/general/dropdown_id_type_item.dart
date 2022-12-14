import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../get/quick_service_getx_controller.dart';
import '../model/Clinic.dart';
import '../model/IDTypes.dart';
import '../model/Nationalities.dart';

class DropDownIDTypeItem extends StatefulWidget {
  List<IDTypes> myData;
  String iconName;
  String dropValue;
  int? dropIntValue;

  DropDownIDTypeItem(this.myData,this.iconName,this.dropValue, {this.dropIntValue});

  @override
  State<DropDownIDTypeItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<DropDownIDTypeItem> {
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
                  semanticsLabel: 'Acme Logo',
                width: 24.w,
                height: 24.h,
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
                      QuickServiceGetxController.to.idType = val;
                      print(val);
                    });
                  },
                  value: global,
                  // value: dropdownValue,
                  items: widget.myData.map((IDTypes value) {
                    return new DropdownMenuItem<String>(
                      value: value.idTypeCode,
                      child: Text(
                          value.idTypeName!,
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
