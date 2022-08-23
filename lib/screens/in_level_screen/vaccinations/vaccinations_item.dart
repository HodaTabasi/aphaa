import 'package:flutter/material.dart';

class VaccinationItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width - 50,
            height: 140,
            padding: EdgeInsets.only(left: 26, right: 26, top: 16, bottom: 10),
            margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            // margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.5),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اسم التطعيم :',
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
                          'تطعيم ضد التسمم',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'موعد التطعيم :',
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
                          '20.08.2022',
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
            right: 0,
            bottom: 0,
            left: 0,
            // bottom: 100,
            child: Container(
              width: 50,
              height: 35,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 80,vertical: 8),
              decoration: BoxDecoration(
                  color: Color(0xff0E4C8F),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Text("متبقي 3 أيام لانتهاء موعد التطعيم",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Tajawal',
                    fontSize: 12),
                textAlign: TextAlign.center,),
            ),
          ),
        ]);
  }
}
