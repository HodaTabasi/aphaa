import 'package:aphaa_app/screens/in_level_screen/Insurance_approvals/screen_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsuranceButtomSheet extends StatefulWidget {

  @override
  State<InsuranceButtomSheet> createState() => _InsuranceButtomSheetState();
}

class _InsuranceButtomSheetState extends State<InsuranceButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.r),

      child: Column(
        children: [
          Divider(
            color: Colors.black,
            thickness: 10.r,
            indent: 100.w,
            endIndent: 100.w,
          ),
          SizedBox(height: 15.h,),
          InsuranceItem(),
          InsuranceItem()
        ],
      ),
    );
  }
}
