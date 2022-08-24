import 'package:flutter/material.dart';

class ScedualBookingItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: EdgeInsets.fromLTRB(16,16, 16,10),
                child: Text.rich(
                  TextSpan(
                    text: 'تاريخ الحجز :  ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  20.8.2022  ',
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
                padding: EdgeInsets.fromLTRB(16,16, 16,10),
                child: Text.rich(
                  TextSpan(
                    text: 'وقت الحجز :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  11:00 a.m  ',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'العيادة : ',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  أسنان  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'الطبيب :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' محمود أحمد  ',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'ملاحظات : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  ملاحظات ...  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }
}
