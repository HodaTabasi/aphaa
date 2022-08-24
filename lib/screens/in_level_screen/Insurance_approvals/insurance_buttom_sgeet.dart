import 'package:aphaa_app/screens/in_level_screen/Insurance_approvals/screen_item.dart';
import 'package:flutter/material.dart';

class InsuranceButtomSheet extends StatefulWidget {

  @override
  State<InsuranceButtomSheet> createState() => _InsuranceButtomSheetState();
}

class _InsuranceButtomSheetState extends State<InsuranceButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8),

      child: Column(
        children: [
          Divider(
            color: Colors.black,
            thickness: 10,
            indent: 100,
            endIndent: 100,
          ),
          SizedBox(height: 15,),
          InsuranceItem(),
          InsuranceItem()
        ],
      ),
    );
  }
}
