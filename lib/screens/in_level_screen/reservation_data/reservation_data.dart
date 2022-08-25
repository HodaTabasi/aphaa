import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/in_level_screen/reservation_data/payment_way_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationData extends StatefulWidget {
  static String routeName = "/ReservationData";
  @override
  State<ReservationData> createState() => _ReservationDataState();
}

class _ReservationDataState extends State<ReservationData> {
  var _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text('بيانات الحجز',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(5.0),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ]),
      body: ListView(
        children: [
          SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'بيانات الحجز',
              style: const TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xffF5F8FB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://thumbs.dreamstime.com/b/special-offer-workplace-doctor-tablet-stethoscope-clipboard-wooden-desk-background-top-view-57765884.jpg',
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'زراعة أسنان',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'اسم العيادة هنا',
                        style: const TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 13,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: 0,
                top: 20,
                // bottom: 0,
                // left: 0,
                child: Container(
                  // width: 30,
                  // height: 35,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  decoration: BoxDecoration(
                      color: Color(0xff0E4C8F),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Text(
                    "الإجمالي : 500",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'طريقة الدفع :',
              style: const TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // ListView.builder(
          //   itemCount: 2,
          //   shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemBuilder: (context,index){
          //   return PaymentSelectedItem(
          //     title: 'مدى',
          //     value: 0,
          //     groupValue: _value,
          //     onChanged: (value) => setState(() => _value = value),
          //   );
          // }),
          //
          PaymentSelectedItem(
            title: 'مدى',
            value: 0,
            groupValue: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
          PaymentSelectedItem(
            title: 'فيزا',
            value: 1,
            groupValue: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/add.svg',
                  semanticsLabel: 'Acme Logo',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "أضف بطاقة دفع جديدة",
                    style: TextStyle(
                        fontFamily: 'Tajawal', color: Colors.black, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'ملخص الطلب :',
              style: const TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تكلفة الطلب',
                  style: const TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
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
                      fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w400,
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
                      fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w400,
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 20,),
          BtnLayout('الاستمرار للدفع ', () { }),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
