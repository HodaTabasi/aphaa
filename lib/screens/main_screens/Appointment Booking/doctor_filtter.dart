import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';


class DoctorFillter extends StatefulWidget {
  @override
  State<DoctorFillter> createState() => _DoctorFillterState();
}

class _DoctorFillterState extends State<DoctorFillter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8),
      // margin: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('البحث عن طبيب',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                    )),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0.r),
                      color: Color(0xff0E4C8F)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(Icons.clear,color: Colors.white,size: 15,),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          DropDownItem([],'assets/images/hospital.svg','اختر العيادة'),
          DropDownItem([],'assets/images/docgreen.svg','اختر الطبيب'),
          SizedBox(height: 25,),
          SizedBox(child: BtnLayout('بحث',(){}),width: 200,)
        ],
      ),
    );
  }
}
