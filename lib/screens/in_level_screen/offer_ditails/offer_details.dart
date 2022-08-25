import 'package:aphaa_app/general/btn_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfferDetails extends StatefulWidget {

  static String routeName = "/OfferDetails";
  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text('عرض زراعة الأسنان',
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
          SizedBox(
            height: 8,
          ),
          Container(
            height: 260,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://thumbs.dreamstime.com/b/special-offer-workplace-doctor-tablet-stethoscope-clipboard-wooden-desk-background-top-view-57765884.jpg',
                // width: 144,
                // height: 114,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          DecoratedBox(decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // border: Border.all(color: Color(0xfffffff), width: 0.5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,-5),
                blurRadius: 5,
                color: Colors.grey.shade300
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'زراعة أسنان',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '500',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('اسم العيادة هنا',style :const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                )),
                leading: SvgPicture.asset(
                  'assets/images/hospital.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'نبذة عني :',
                  style: const TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'هذا النص افتراض ، هذا النص افتراض ، هذا النص افتراضي ، هذا النص افتراضي',
                  style: const TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 15,
                      fontFamily: 'Tajawal',
                      height: 2
                    // fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 13,),
              Align(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xffF7F8FB),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'ينتهي العرض في 22.8.2022',
                      style: const TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 13,),
              BtnLayout('احجز الان', () { })
            ],
          ),),

          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
