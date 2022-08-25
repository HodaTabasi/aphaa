import 'package:flutter/material.dart';

class PaymentScreenItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width - 50,
            height: 160,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16,16, 16,10),
                      child: Text.rich(
                        TextSpan(
                          text: 'تاريخ الدفع :  ',
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
                          text: 'وقت الدفع :',
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
                          text: 'الوصف : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'عرض زراعة أسنان',
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
                          text: 'السعر : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '500',
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
          ),
          Positioned(
            // right: 0,
            bottom: 0,
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
                      bottomLeft: Radius.circular(8),
                      topRight: Radius.circular(40))),
              child: Text(
                "مرفوض",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Tajawal', fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
  }
}
