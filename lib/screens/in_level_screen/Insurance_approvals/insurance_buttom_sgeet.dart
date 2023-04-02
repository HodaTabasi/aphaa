import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/ApprovalsResponse/ApprovalItem.dart';

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
            return   SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: 10.r,
                    indent: 100.w,
                    endIndent: 100.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed:(){
                        Navigator.pop(context);
                      },icon: Icon(Icons.close_rounded),iconSize: 30,color: Colors.red,)
                    ],
                  ),
                  // SizedBox(height: 10.h,),
                  ListView.builder(
                    itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                    return Stack(
                      // fit: StackFit.expand,
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width - 50,
                            height: 200.h,
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
                                      AppLocalizations.of(context)!.insurance_approval_number,
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
                                        '${snapshot.data![index].id}',
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
                                            '${snapshot.data![index].serviceName}',
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.service_type,
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
                                            '${snapshot.data![index].serviceType}',
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.service_price,
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
                                            '${snapshot.data![index].servicePrice}',
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.validity_period,
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
                                            '${snapshot.data![index].validityPeriod}',
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
                              width: 120.w,
                              height: 33.h,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                              decoration: BoxDecoration(
                                  color: snapshot.data![index].approvalStatus == "لم يتخذ قرار بعد"?Color(0xffEE1131):Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(20.r))),
                              child: Text(
                                "${snapshot.data![index].approvalStatus}",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Tajawal', fontSize: 13.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ]);
                  })),

                  // InsuranceItem(),
                  // InsuranceItem()
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.no_data,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.r,
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
