import 'package:flutter/material.dart';

import 'btn_layout.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        // fit: StackFit.expand,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 180,
              padding:
              EdgeInsets.only(left: 26, right: 26, top: 16, bottom: 10),
              // margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage('assets/images/Group40749.png'),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('زراعة اسنان ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 8),
                    child: Text(
                      'هذا النص افتراضي هذا النص افتراضي هذا النص افتراضي ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                      width: 150,
                      height: 70,
                      child: BtnLayout('احجز الآن', () {})),
                  Text('ينتهي العرض في 22.8.2022',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              // bottom: 100,
              child: Container(
                width: 50,
                height: 30,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20),topRight:Radius.circular(8) )),
                child: Text("20%",style: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 14)),
              ),
            ),
          ]),
    );
  }
}