import 'package:animated_custom_dropdown/custom_dropdown.dart';
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
  List<String> myStringData = [];
  String iconName;
  String dropValue;
  int? dropIntValue;
  TextEditingController jobRoleCtrl;

  DropDownIDTypeItem(this.myData,this.iconName,this.dropValue,this.jobRoleCtrl, {this.dropIntValue});

  @override
  State<DropDownIDTypeItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<DropDownIDTypeItem> {
  String? global;

  List<String> getString() {
    return widget.myData.map((e) {
      return e.idTypeName!;
    }).toList();
  }

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
              child: CustomDropdown.search(
                fillColor: Colors.transparent,
                // borderRadius: BorderRadius.circular(20.r),
                hintText: widget.dropValue,
                items: getString(),
                controller: widget.jobRoleCtrl,
                hintStyle: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
                listItemStyle: TextStyle(
                    fontSize: 13.sp, color: Colors.black54, fontFamily: 'Tajawal',fontWeight: FontWeight.bold),
                selectedStyle: TextStyle(
                    fontSize: 13.sp, color: Colors.black, fontFamily: 'Tajawal',fontWeight: FontWeight.bold),
                onChanged: (s) async {
                  int index = widget.myData.indexWhere((element) => element.idTypeName == s);
                  QuickServiceGetxController.to.idType = widget.myData[index].idTypeCode;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*
  *  Expanded(
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
            ),*/
}
