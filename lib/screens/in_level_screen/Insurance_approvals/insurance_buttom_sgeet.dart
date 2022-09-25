import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/model/ApprovalItem.dart';
import 'package:aphaa_app/screens/in_level_screen/Insurance_approvals/screen_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InsuranceButtomSheet extends StatefulWidget {
  String? reqId;
  InsuranceButtomSheet(this.reqId);


  @override
  State<InsuranceButtomSheet> createState() => _InsuranceButtomSheetState();
}

class _InsuranceButtomSheetState extends State<InsuranceButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.r),

      child:  FutureBuilder<List<ApprovalItem>>(
        future: HospitalApiController().getSrvApvlDtl(reqId: widget.reqId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return   Column(
              children: [
                Divider(
                  color: Colors.black,
                  thickness: 10.r,
                  indent: 100.w,
                  endIndent: 100.w,
                ),
                SizedBox(height: 15.h,),
                Stack(
                  // fit: StackFit.expand,
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width - 50,
                        height: 150.h,
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
                                    '${widget.reqId}',
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
                                    AppLocalizations.of(context)!.the_request,
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
                                        overflow: TextOverflow.fade,
                                        '${snapshot.data!.first.approvalDetail}',
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
                          width: 80.w,
                          height: 35.h,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                          decoration: BoxDecoration(
                              color: Color(0xffEE1131),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  bottomRight: Radius.circular(20.r))),
                          child: Text(
                            "${snapshot.data!.first.approvalStatus}",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Tajawal', fontSize: 13.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ])
                // InsuranceItem(),
                // InsuranceItem()
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
