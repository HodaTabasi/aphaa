import 'package:aphaa_app/general/download_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrintButtomSheetSickLevel extends StatelessWidget {

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 36),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تاريخ الزيارة',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color(0xffF7F8FB),
                                  borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '20.08.2022',
                                  style: const TextStyle(
                                    color: Color(0xff2D2D2D),
                                    fontSize: 14,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'الوصف',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF7F8FB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'إجازة مرضية لجهاد',
                                style: const TextStyle(
                                  color: Color(0xff2D2D2D),
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الطبيب المعالج',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF7F8FB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'د. محمود أحمد',
                                style: const TextStyle(
                                  color: Color(0xff2D2D2D),
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'المدة',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffF7F8FB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '5 أيام فقط',
                                style: const TextStyle(
                                  color: Color(0xff2D2D2D),
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          downloadBtn(),
        ],
      ),
    );
  }
}
