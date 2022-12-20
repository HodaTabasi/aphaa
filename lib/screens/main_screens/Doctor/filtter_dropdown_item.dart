import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../get/doctor_getx_controller.dart';
import '../../../model/Clinic.dart';

class FiltterDropDownItem extends StatefulWidget {
  List<Clinic> myData;
  String iconName;
  String dropValue;
  int? dropIntValue;
  TextEditingController jobRoleCtrl;

  FiltterDropDownItem(
      this.myData, this.iconName, this.dropValue, this.jobRoleCtrl,
      {this.dropIntValue});

  @override
  State<FiltterDropDownItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<FiltterDropDownItem> {
  String? global;
  List<String> data =[];
  String s = '';

  List<String> getString() {
    s = SharedPrefController().getValueFor(key: PrefKeys.lang.name)== 'ar'?"عرض جميع الاطباء":"Show All Doctors";
    data.add(s);
    data.addAll(widget.myData.map((e) {
      return e.clinicName!;
    }));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.r),
              child: SvgPicture.asset(widget.iconName,
                  semanticsLabel: 'Acme Logo'),
            ),
            VerticalDivider(
                width: 2.w, thickness: 0.5.w, color: Color(0xff0E4C8F)),
            Expanded(
                child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  itemBuilder: (context, item, isSelected) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(item,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.green.shade700
                                : Colors.grey.shade700,
                            fontSize: 13.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          )),
                    );
                  },
                  searchFieldProps: TextFieldProps(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.r, vertical: 20.r),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ))),
              items: getString(),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  // labelText: widget.dropValue,
                  hintText: widget.dropValue,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.all(8.r),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),

              onChanged: (val) {
                // setState(() {
                  print(s);
                  if(val == s){
                    DoctorGetxController.to.firstLoad();
                  }else {
                    int index = widget.myData
                        .indexWhere((element) => element.clinicName == val);

                    DoctorGetxController.to
                        .searchLoad(clinicCode: widget.myData[index].clinicCode);
                  }

                // });
              },
              // selectedItem: "Brazil",
            )),
            // Expanded(
            //   child: Padding(
            //     padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
            //     child: DropdownButton<String>(
            //       isExpanded: true,
            //       underline: SizedBox(),
            //       hint: Text(
            //         widget.dropValue,
            //         style: TextStyle(
            //           color: Colors.grey.shade700,
            //           fontSize: 13.sp,
            //           fontFamily: 'Tajawal',
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       onChanged: (val) {
            //         setState(() {
            //           DoctorGetxController.to.global = val!;
            //           DoctorGetxController.to.firstLoad(clinicCode: val);
            //         });
            //       },
            //       value: DoctorGetxController.to.global,
            //       // value: dropdownValue,
            //       items: widget.myData.map((Clinic value) {
            //         return new DropdownMenuItem<String>(
            //           value: value.clinicCode,
            //           child: Text(
            //               value.clinicName!,
            //               style:  TextStyle(
            //                 color: Colors.grey.shade700,
            //                 fontSize: 13.sp,
            //                 fontFamily: 'Tajawal',
            //                 fontWeight: FontWeight.bold,
            //               )
            //           ),
            //         );
            //       }).toList(),
            //       icon: Icon(
            //         Icons.keyboard_arrow_down,
            //         color: Color(0xff058638),
            //       ),
            //
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
