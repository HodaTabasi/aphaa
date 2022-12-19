import 'package:aphaa_app/model/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/in_level_screen/offer_ditails/offer_details.dart';
import 'btn_layout.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SliderWidget extends StatelessWidget {
 Offers? offers;


 SliderWidget({this.offers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
      child: Stack(
        // fit: StackFit.expand,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 30.w,
              height: 180.h,
              padding:
              EdgeInsets.only(left: 26.r, right: 26.r, top: 16.r, bottom: 10.r),
              // margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage('assets/images/Group40749.png'),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${offers?.title} ',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 40.0.w, vertical: 8.h),
                    child: Text(
                      '${offers?.description} ',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                      width: 150,
                      height: 70,
                      child: BtnLayout(AppLocalizations.of(context)!.book_now, () {
                        Navigator.pushNamed(context, OfferDetails.routeName,arguments:{"data":offers} );
                      })),
                  Text('ينتهي العرض في 22.8.2022',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
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
                    BorderRadius.only(bottomLeft: Radius.circular(20.r),topRight:Radius.circular(8.r) )),
                child: Text("${offers?.price}",style: TextStyle(color: Colors.white,fontFamily: 'Tajawal',fontSize: 14.sp)),
              ),
            ),
          ]),
    );
  }
}