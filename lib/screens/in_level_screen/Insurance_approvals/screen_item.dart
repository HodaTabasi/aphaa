import 'package:aphaa_app/model/ApprovalsResponse/Approvals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'insurance_buttom_sgeet.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InsuranceItem extends StatelessWidget {
  Approvals approvals;
  InsuranceItem(this.approvals);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => InsuranceButtomSheet(approvals.reqId),
        );
      },
      child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width - 50,
              height: 90.h,
              padding: EdgeInsets.only(left: 16.r, right: 16.r, top: 12.r, bottom: 10.r),
              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              // margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Color(0xff0E4C8F), width: 0.5.r),
              ),
              child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.medical_file_number,
                        style:  TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(10.0.r),
                        child: Text(
                          '${approvals.reqId}',
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.notes,
                          style:  TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0.r),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              '${approvals.reqDetails}',
                              style:  TextStyle(
                                color: Color(0xff2D2D2D),
                                fontSize: 12.sp,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.normal,
                              ),
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
              // right: 0,
              top: 0,
              left: 0,
              // bottom: 100,
              child: Container(
                width: 100.w,
                height: 33.h,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                decoration: BoxDecoration(
                    color: approvals.reqStatus == "لم يتخذ قرار بعد" ?Color(0xffEE1131):Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(20.r))),
                child: Text(
                  "${approvals.reqStatus}",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Tajawal', fontSize: 12.5.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
    );
  }
}
