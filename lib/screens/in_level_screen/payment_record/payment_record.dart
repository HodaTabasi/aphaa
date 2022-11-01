import 'package:aphaa_app/screens/in_level_screen/payment_record/payment_screen_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../model/PatientPaymentRecord.dart';

class PaymentRecord extends StatefulWidget {
  static String routeName = "/PaymentRecord";

  @override
  State<PaymentRecord> createState() => _PaymentRecordState();
}

class _PaymentRecordState extends State<PaymentRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.pay_book,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: Container(
            margin: EdgeInsets.all(15.0.r),
            padding: EdgeInsets.all(5.0.r),
            // alignment: Alignment.bottomLeft,
            // width: 80,
            // height: 500,
            decoration: BoxDecoration(
                color: const Color(0xff006F2C),
                borderRadius: BorderRadius.circular(5.r)),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15.sp,
            )),
      ),
      body: FutureBuilder<List<PatientPaymentRecord>>(
        future: HospitalApiController().getPatientpayment(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            return ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PaymentScreenItem(
                        snapshot.data![index]
                      );
                    }),
                // Image.asset(
                //   "assets/images/image1.png",
                //   fit: BoxFit.fitWidth,
                // ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
