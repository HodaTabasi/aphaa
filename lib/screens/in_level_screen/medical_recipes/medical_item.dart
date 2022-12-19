import 'package:aphaa_app/model/prescriptionListResponse/prescriptionList.dart';
import 'package:aphaa_app/screens/in_level_screen/medical_recipes/print_medical_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicalRecipesItem extends StatelessWidget {
  PrescriptionList prescriptionlist;
  MedicalRecipesItem(this.prescriptionlist);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: Color(0xff0E4C8F), width: 0.5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.r,16.r, 16.r,10.r),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.payment_time,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  ${prescriptionlist.invoiceNo}  ',
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
                Padding(
                  padding: EdgeInsets.fromLTRB(16,16, 16,10),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.payment_date,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Tajawal'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  ${prescriptionlist.invoiceDate}  ',
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
          ),
          FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
              child: Text.rich(
                TextSpan(
                  text: AppLocalizations.of(context)!.the_clinic,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontFamily: 'Tajawal'),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' ${prescriptionlist.clinic!.clinicName}  ',
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
          ),
          FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
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
                      text: '  ${prescriptionlist.doctor!.doctorName}  ',
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 10.r),
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.the_hospital_been_discharged,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  ${prescriptionlist.invoiceStatus}  ',
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // InkWell(
              //   onTap: (){
              //     showModalBottomSheet(
              //       isScrollControlled: true,
              //       backgroundColor: Colors.transparent,
              //       context: context,
              //       builder: (context) => PrintMedicalRecipesButtomSheet(prescriptionlist),
              //     );
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(8.r,0.r,16.r,10.r),
              //     child: SvgPicture.asset(
              //       'assets/images/print.svg',
              //       semanticsLabel: 'Acme Logo',
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: true,

                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => PrintMedicalRecipesButtomSheet(prescriptionlist),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16,0,8,10),
                  child: SvgPicture.asset(
                    'assets/images/show.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
