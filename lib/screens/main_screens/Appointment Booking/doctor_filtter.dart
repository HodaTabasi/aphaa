import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoctorFillter extends StatefulWidget {
  @override
  State<DoctorFillter> createState() => _DoctorFillterState();
}

class _DoctorFillterState extends State<DoctorFillter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.r),
      // margin: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 20.r,),
          Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.find_a_doctor,
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
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
                      padding:  EdgeInsets.all(2.0.r),
                      child: Icon(Icons.clear,color: Colors.white,size: 15.sp,),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          DropDownItem([],'assets/images/hospital.svg',AppLocalizations.of(context)!.clenice_choesse),
          DropDownItem([],'assets/images/docgreen.svg',AppLocalizations.of(context)!.dovtor_choesse),
          SizedBox(height: 25.h,),
          SizedBox(child: BtnLayout('بحث',(){}),width: 200.w,)
        ],
      ),
    );
  }
}
