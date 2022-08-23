import 'package:aphaa_app/general/my_separator.dart';
import 'package:flutter/material.dart';

import '../../../general/download_btn.dart';

class PrintMedicalRecipesButtomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.black,
              thickness: 10,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'رقم الفاتورة: #11235',
                style: const TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xff0E4C8F), width: 0.5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'اسم الدواء',
                          style: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(
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

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'مرات الاستخدام',
                          style: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
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

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'كيفية الاستخدام',
                          style: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'السعر',
                          style: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       SizedBox(
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

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0,),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'إجمالي الفاتورة :',
                style: const TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع,',
                    style: const TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '100 ر.س',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الضريبة (15%)',
                    style: const TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '115 ر.س',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الإجمالية ',
                    style: const TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '115 ر.س',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            downloadBtn(),
            const SizedBox(height: 10,),
            // Image.asset(
            //   "assets/images/image1.png",
            //   fit: BoxFit.fitWidth,
            // ),
          ],
        ),
      ),
    );
  }
}
