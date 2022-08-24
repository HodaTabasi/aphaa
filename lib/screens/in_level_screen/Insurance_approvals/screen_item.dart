import 'package:flutter/material.dart';

import 'insurance_buttom_sgeet.dart';

class InsuranceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => InsuranceButtomSheet(),
        );
      },
      child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width - 50,
              height: 90,
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 10),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xff0E4C8F), width: 0.5),
              ),
              child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'رقم الملف الطبي :',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '#2031456',
                          style: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'الطلب :',
                          style: const TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'هذا النص افتراضي ، هذا النص افتراضي ، هذا النص',
                            style: const TextStyle(
                              color: Color(0xff2D2D2D),
                              fontSize: 12,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              // right: 0,
              top: 0,
              left: 0,
              // bottom: 100,
              child: Container(
                width: 80,
                height: 35,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Color(0xffEE1131),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  "مرفوض",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Tajawal', fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
    );
  }
}
