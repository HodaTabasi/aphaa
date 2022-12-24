import 'package:aphaa_app/model/ApprovalsResponse/Approvals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../preferences/shared_pref_controller.dart';
import 'insurance_buttom_sgeet.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InsuranceItem extends StatelessWidget {
  Approvals approvals;

  InsuranceItem(this.approvals);

  @override
  Widget build(BuildContext context) {
    String s = SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'ar'?"لم يتخذ قرار بعد":"No Action-null";
    return Stack(
      // fit: StackFit.expand,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width - 50,
            height: (approvals.reqDate!.isNotEmpty || approvals.reqTime!.isNotEmpty) ?230.h :215.h,
            padding: EdgeInsets.only(
                left: 16.r, right: 16.r, top: 12.r, bottom: 10.r),
            margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            // margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: Color(0xff0E4C8F), width: 0.5.r),
            ),
            // child: Table(
            //   columnWidths: {
            //     0: FlexColumnWidth(2),
            //     1: FlexColumnWidth(4),
            //     2: FlexColumnWidth(4),
            //   },
            //   // border: TableBorder.all(color: Color(0xff0E4C8F)),
            //   children: [
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             AppLocalizations.of(context)!.req_number,
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             '${approvals.reqId}',
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.normal,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Visibility(
            //           visible: !approvals.reqDate!.isNotEmpty,
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //             child: Text.rich(
            //               TextSpan(
            //                 text: AppLocalizations.of(context)!
            //                     .req_date,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                     fontSize: 12.sp,
            //                     fontFamily: 'Tajawal'),
            //                 children: <TextSpan>[
            //                   TextSpan(
            //                     text: '  ${'20-02-2022'}  ',
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.black45,
            //                         fontSize: 12.sp,
            //                         fontFamily: 'Tajawal'),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Visibility(
            //           visible: !approvals.reqTime!.isNotEmpty,
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //             child: Text.rich(
            //               TextSpan(
            //                 text: AppLocalizations.of(context)!.req_time,
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                     fontSize: 12.sp,
            //                     fontFamily: 'Tajawal'),
            //                 children: <TextSpan>[
            //                   TextSpan(
            //                     text: '  ${'11:30'}  ',
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.black45,
            //                         fontSize: 12.sp,
            //                         fontFamily: 'Tajawal'),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             AppLocalizations.of(context)!.the_clinic,
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             '   ${approvals.clinic?.clinicName}   ',
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.normal,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             AppLocalizations.of(context)!.physician,
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             '   ${approvals.doctor?.doctorName}   ',
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.normal,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             AppLocalizations.of(context)!.notes,
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10.0.r),
            //           child: Text(
            //             overflow: TextOverflow.ellipsis,
            //             '${approvals.reqDetails}',
            //             style: TextStyle(
            //               color: Color(0xff2D2D2D),
            //               fontSize: 12.sp,
            //               fontFamily: 'Tajawal',
            //               fontWeight: FontWeight.normal,
            //             ),
            //             maxLines: 3,
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Visibility(
            //           visible: false,
            //             child: Text("data")),
            //         InkWell(
            //           onTap: (){
            //             showModalBottomSheet(
            //               isScrollControlled: false,
            //               backgroundColor: Colors.transparent,
            //               context: context,
            //               builder: (context) => InsuranceButtomSheet(approvals.reqId),
            //             );
            //           },
            //           child:  SvgPicture.asset(
            //             'assets/images/show.svg',
            //             semanticsLabel: 'Acme Logo',
            //             alignment: Alignment.topLeft,
            //           ),
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.req_number,
                      style: TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Text(
                        '${approvals.reqId}',
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: approvals.reqDate!.isNotEmpty,
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .req_date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${approvals.reqDate}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: approvals.reqTime!.isNotEmpty,
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.req_time,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  ${approvals.reqTime}  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.r, vertical: 10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.the_clinic,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '   ${approvals.clinic?.clinicName}   ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.r, vertical: 10.r),
                      child: Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)!.physician,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: 'Tajawal'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '   ${approvals.doctor?.doctorName}   ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 40.r,
                      child: Text(
                        AppLocalizations.of(context)!.notes,
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.r),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width-150.w,
                        height: 40.r,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          '${approvals.reqDetails}',
                          style: TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 12.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        showModalBottomSheet(
                          isScrollControlled: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => InsuranceButtomSheet(approvals.reqId),
                        );
                      },
                      child:  SvgPicture.asset(
                          'assets/images/show.svg',
                          semanticsLabel: 'Acme Logo',
                          alignment: Alignment.topLeft,
                      ),
                    ),
                  ],
                )
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
              padding:  EdgeInsets.all(8.r),
              margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              decoration: BoxDecoration(
                  color: approvals.reqStatus == s ? const Color(
                      0xffEE1131) : Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(20.r))),
              child: Text(
                "${approvals.reqStatus}",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Tajawal',
                    fontSize: 12.5.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
  }
}
