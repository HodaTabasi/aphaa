import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FamillyItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0E4C8F),width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child:  SvgPicture.asset(
                  'assets/images/boy.svg',
                  semanticsLabel: 'Acme Logo'
              ),
            ),
            const VerticalDivider(
                width:2,
                thickness:0.5,
                color:Color(0xff0E4C8F)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'رقم الملف :',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'رقم الإقامة :',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'الاسم :',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '#2053152',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '#2053152',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'محمود أحمد',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            )

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Row(
            //     // crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'اسم التطعيم :',
            //         style: const TextStyle(
            //           color: Color(0xff2D2D2D),
            //           fontSize: 12,
            //           fontFamily: 'Tajawal',
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Text(
            //           'تطعيم ضد التسمم',
            //           style: const TextStyle(
            //             color: Color(0xff2D2D2D),
            //             fontSize: 12,
            //             fontFamily: 'Tajawal',
            //             fontWeight: FontWeight.normal,
            //           ),
            //         ),
            //       ),
            //
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
