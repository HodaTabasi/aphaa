import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/screens/in_level_screen/payment_screen/payment_screen.dart';
import 'package:aphaa_app/screens/in_level_screen/reservation_data/payment_way_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(AppLocalizations.of(context)!.reservation_data,
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
          actions: [
            Padding(
              padding:  EdgeInsets.all(8.0.r),
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
          SizedBox(height: 20.h),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              AppLocalizations.of(context)!.reservation_data,
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(10.0.r),
            child: Stack(children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xffF5F8FB),
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0.r),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0.r),
                        child: Image.network(
                          'https://thumbs.dreamstime.com/b/special-offer-workplace-doctor-tablet-stethoscope-clipboard-wooden-desk-background-top-view-57765884.jpg',
                          width: 80.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'زراعة أسنان',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 14.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'اسم العيادة هنا',
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 13.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: 0,
                top: 20.h,
                // bottom: 0,
                // left: 0,
                child: Container(
                  // width: 30,
                  // height: 35,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8.r),
                  decoration: BoxDecoration(
                      color: Color(0xff0E4C8F),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.r),
                          topRight: Radius.circular(8.r))),
                  child: Text(
                    "${AppLocalizations.of(context)!.the_total} : 500",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 20.h),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              AppLocalizations.of(context)!.payment_method,
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15.sp,
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
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/add.svg',
                  semanticsLabel: 'Acme Logo',
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Text(
                    AppLocalizations.of(context)!.add_a_new_payment_card,
                    style: TextStyle(
                        fontFamily: 'Tajawal', color: Colors.black, fontSize: 13.sp),
                  ),
                )
              ],
            ),
          ),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Text(
              AppLocalizations.of(context)!.request_summary,
              style:  TextStyle(
                color: Color(0xff2D2D2D),
                fontSize: 15.sp,
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
                  AppLocalizations.of(context)!.order_cost,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '100 ر.س',
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.tax,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Text(
                    '115 ر.س',
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.total_bill,
                  style:  TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Text(
                    '115 ر.س',
                    style:  TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
            ),
          ),
           SizedBox(height: 20.h,),
          BtnLayout(AppLocalizations.of(context)!.continue_to_pay, () {
            Navigator.pushNamed(context, PaymentScreen.routeName);
          }),
           SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
