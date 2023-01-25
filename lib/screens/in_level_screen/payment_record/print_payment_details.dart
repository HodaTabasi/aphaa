import 'package:aphaa_app/general/my_separator.dart';
import 'package:aphaa_app/model/prescriptionListResponse/prescriptionList.dart';
import 'package:aphaa_app/screens/in_level_screen/medical_recipes/s_val_ditails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/controllers/hospital_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/PaymentDitails.dart';
import '../../../model/prescriptionListResponse/PrescriptionListItems.dart';

class PrintPaymentDitailsButtomSheet extends StatefulWidget {
  String refNo;

  PrintPaymentDitailsButtomSheet(this.refNo);

  @override
  State<PrintPaymentDitailsButtomSheet> createState() =>
      _PrintPaymentDitailsButtomSheetState();
}

class _PrintPaymentDitailsButtomSheetState
    extends State<PrintPaymentDitailsButtomSheet> {
  @override
  void initState() {
    print("gdfg ${widget.refNo}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(8.r),
        child: FutureBuilder<PaymentDitails?>(
          future: HospitalApiController().getPatientpaymentDitails(
            refNo: widget.refNo
          ),
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: 10.r,
                    indent: 100.w,
                    endIndent: 100.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Text(
                      '${AppLocalizations.of(context)!.invoice_number} ${snapshot.data!.invoiceNo}',
                      style: TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 16.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.prescriptionItems!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.r, vertical: 8.r),
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            border: Border.all(
                                color: Color(0xff0E4C8F), width: 0.5.w),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data!.prescriptionItems![index].itemDesc}',
                                      style: TextStyle(
                                        color: Color(0xff2D2D2D),
                                        fontSize: 15.sp,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.r,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF7F8FB),
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0.r),
                                          child: Text(
                                            '${snapshot.data!.prescriptionItems![index].itemName}',
                                            style: TextStyle(
                                              color: Color(0xff2D2D2D),
                                              fontSize: 14.sp,
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data!.prescriptionItems![index].qtyDesc}',
                                      style: TextStyle(
                                        color: Color(0xff2D2D2D),
                                        fontSize: 15.sp,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.r,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF7F8FB),
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0.r),
                                          child: Text(
                                            '${snapshot.data!.prescriptionItems![index].qty}',
                                            style: TextStyle(
                                              color: Color(0xff2D2D2D),
                                              fontSize: 14.sp,
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data!.prescriptionItems![index].priceDesc}',
                                      style: TextStyle(
                                        color: Color(0xff2D2D2D),
                                        fontSize: 15.sp,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.r,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF7F8FB),
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0.r),
                                          child: Text(
                                            '${snapshot.data!.prescriptionItems![index].price}',
                                            style: TextStyle(
                                              color: Color(0xff2D2D2D),
                                              fontSize: 14.sp,
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 80.0.r,
                    ),
                    child: MySeparator(color: Color(0xff0E4C8F)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ////////

                  Table(
                    border: TableBorder.all(color: Color(0xff0E4C8F)),
                    children: [
                      SVDitails(
                        snapshot.data!.s1Desc,
                        val: snapshot.data!.s1Val,
                          context: context
                      ),
                      SVDitails(
                        snapshot.data!.s2Desc,
                        val: snapshot.data!.s2Val,
                          context: context
                      ),
                      SVDitails(
                        snapshot.data!.s3Desc,
                        val: snapshot.data!.s3Val,
                          context: context
                      ),
                      SVDitails(
                        snapshot.data!.s4Desc,
                        val: snapshot.data!.s4Val,
                          context: context
                      ),
                      SVDitails(
                        snapshot.data!.s5Desc,
                        val: snapshot.data!.s5Val,
                          context: context
                      ),
                      SVDitails(
                        snapshot.data!.s6Desc,
                        val: snapshot.data!.s6Val,
                          context: context
                      ),
                      SVDitails(
                        snapshot.data!.s7Desc,
                        val: snapshot.data!.s7Val,
                        context: context
                      ),
                      SVDitails(
                        snapshot.data!.s8Desc,
                        val: snapshot.data!.s8Val,
                          context: context
                      ),
                    ],
                  )
                ],
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
      ),
    );
  }
}
