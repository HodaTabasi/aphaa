import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/model/offer.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_record/payment_record.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../reservation_data/reservation_data.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OfferDetails extends StatefulWidget {

  static String routeName = "/OfferDetails";
  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  var instalation;
  @override
  Widget build(BuildContext context) {
    final routeArgs1 =
    ModalRoute.of(context)?.settings.arguments as Map<String, Offers?>;
    if(routeArgs1 != null){
       instalation = routeArgs1['data'];
      print('instalation ${instalation?.price}');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(' عرض   ${instalation?.title}',
              style:  TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding:  EdgeInsets.all(5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
          // actions: [
          //   Padding(
          //     padding:  EdgeInsets.all(8.0.r),
          //     child: InkWell(
          //       onTap: () {},
          //       child: SvgPicture.asset(
          //         'assets/images/Notification.svg',
          //         semanticsLabel: 'Acme Logo',
          //       ),
          //     ),
          //   ),
          // ]
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 260.h,
            margin: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.3.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0.r),
              child: Image.network(
                 instalation.image ,
                // width: 144,
                // height: 114,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          DecoratedBox(decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
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
              SizedBox(height: 20.h,),
              Padding(
                padding:
                 EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       instalation.title ,
                      style:  TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${instalation.price} ريال ",
                      style:  TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('${instalation.clinic}',style : TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                )),
                leading: SvgPicture.asset(
                  'assets/images/hospital.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
               SizedBox(height: 30.h,),
               Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.h),
                child: Text(
                  AppLocalizations.of(context)!.about_me,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 15.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
                child: Text(
                  instalation.description,
                  style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 15.sp,
                      fontFamily: 'Tajawal',
                      height: 2
                    // fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 13.h,),
              Align(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xffF7F8FB),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Text(
                      'ينتهي العرض في 22.8.2022',
                      style:  TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 13.h,),
              BtnLayout(AppLocalizations.of(context)!.book_now, () {
                print(instalation.price);
                Navigator.pushNamed(context, ReservationData.routeName,arguments: {"data":instalation});
              })
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
