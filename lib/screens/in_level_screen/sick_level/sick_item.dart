import 'package:aphaa_app/screens/in_level_screen/sick_level/print_sick_level_butom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../general/my_separator.dart';

class SickItem extends StatelessWidget {
  String sickDate;
  String sickName;
  String sickDocName;

  SickItem({required this.sickDate,required this.sickName, required this.sickDocName});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => PrintButtomSheetSickLevel(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Color(0xff0E4C8F), width: 0.5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                  child: Text.rich(
                    TextSpan(
                      text: 'تاريخ الزيارة: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  $sickDate  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                  child: Text.rich(
                    TextSpan(
                      text: 'الطبيب المعالج :',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' $sickDocName  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0,),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Center(
                child :Text.rich(
                  TextSpan(
                    text: '  إجازة مرضية لـ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' $sickName  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2D2D2D),
                            fontSize: 14,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
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
