import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../get/language_getx_controller.dart';

class SelectedItem extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged? onChanged;

  SelectedItem({
    required this.title,
     this.value = 0,
    this.groupValue = 0,
    this.onChanged});



  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return  GestureDetector(
      onTap: ()=> onChanged!(value),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ?Color(0x209bd5b4):Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13.r)),
            border: Border.all(color: isSelected ?Colors.transparent :Color(0x7C058638)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 70,
              color: Colors.grey.withOpacity(0.23),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: Text("$title",style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: Colors.black,
                    fontSize: 14
                ),)),
            Visibility(child: Image.asset("assets/images/check.png") ,visible: isSelected,),

          ],
        ),
      ),
    );
  }
}
