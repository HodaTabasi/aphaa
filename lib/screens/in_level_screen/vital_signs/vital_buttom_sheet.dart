import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/my_separator.dart';

class VitalButtomSheet extends StatefulWidget {

  @override
  State<VitalButtomSheet> createState() => _VitalButtomSheetState();
}

class _VitalButtomSheetState extends State<VitalButtomSheet> {
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
          children: [
            Divider(
              color: Colors.black,
              thickness: 10,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/prasher.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('الضغط',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '140/100',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 8),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/suger.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('السكري',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '140/100',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 8),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/higth.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('الطول',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '140/100',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 8),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/wihtj.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('الوزن',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F8FB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '140/100',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 8),
              child: MySeparator(color: Color(0xff0E4C8F)),
            ),
            Image.asset(
              "assets/images/image1.png",
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
