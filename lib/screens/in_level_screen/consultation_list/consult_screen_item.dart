import 'dart:io';

import 'package:aphaa_app/helper/helpers.dart';
import 'package:aphaa_app/screens/in_level_screen/consultation_list/CallPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../helper/constant.dart';
import '../../../model/consultaions/consult_model.dart';


class ConsultScreenItem extends StatefulWidget with Helpers1 {
  PtCons patientConsultRecord;


  ConsultScreenItem(this.patientConsultRecord);

  @override
  State<ConsultScreenItem> createState() => _ConsultScreenItemState();
}

class _ConsultScreenItemState extends State<ConsultScreenItem> {

 // Agora engine instance
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
       // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCall(channelName: channelName),));
      },
      child: Container(
          // width: MediaQuery.of(context).size.width - 50,
          // height: 150.h,
          padding:
              EdgeInsets.only(left: 10.r, right: 10.r, top: 10.r, bottom: 10.r),
          margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
          // margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.r, 10.r, 0.r, 10.r),
                          child: Text.rich(
                            TextSpan(
                              text: AppLocalizations.of(context)!.const_No,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '  ${widget.patientConsultRecord.consNo}  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black45,
                                      fontSize: 12.sp,
                                      fontFamily: 'Tajawal'),
                                ),
                              ],
                            ),
                          ),
                        ), //تاريخ الاستشارة
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.r, 10.r, 0.r, 10.r),
                          child: Text.rich(
                            TextSpan(
                              text: AppLocalizations.of(context)!.cons_date1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '  ${widget.patientConsultRecord.consDate?.split(" ").first}  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black45,
                                      fontSize: 12.sp,
                                      fontFamily: 'Tajawal'),
                                ),
                              ],
                            ),
                          ),
                        ), //رقم الفاتورة
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.r, 10.r, 0.r, 10.r),
                            child: Text.rich(
                              TextSpan(
                                text: AppLocalizations.of(context)!.doc_reply_date1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontFamily: 'Tajawal'),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '  ${widget.patientConsultRecord.consNo}  ',
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
                        ), // فاضي
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.r, 10.r, 0.r, 10.r),
                          child: Text.rich(
                            TextSpan(
                              text: AppLocalizations.of(context)!.doc_reply_date1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontFamily: 'Tajawal'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '  ${widget.patientConsultRecord.replyDate?.split(" ").first}  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black45,
                                      fontSize: 12.sp,
                                      fontFamily: 'Tajawal'),
                                ),
                              ],
                            ),
                          ),
                        ), //تاريخ الرد
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(AppLocalizations.of(context)!.consult_note,style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontFamily: 'Tajawal'),),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xff058638),width: 0.5),
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Text(widget.patientConsultRecord.ptConsult!),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(AppLocalizations.of(context)!.re_doc,style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontFamily: 'Tajawal'),),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xff058638),width: 0.5),
                    borderRadius: BorderRadius.circular(10.r)
                ),
                child: Text(widget.patientConsultRecord.replyDTL!),
              ),
              // Visibility(
              //   visible: patientConsultRecord.replyDate!.trim().isNotEmpty && patientConsultRecord.replyDate != null ,
              //   child: Align(
              //     alignment: AlignmentDirectional.topEnd,
              //     child: Text(AppLocalizations.of(context)!.replay,style:TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.green,
              //         fontSize: 12.sp,
              //         fontFamily: 'Tajawal'),),
              //   ),
              // ),
              // Visibility(
              //   visible: patientConsultRecord.replyDate!.trim().isEmpty || patientConsultRecord.replyDate == null,
              //   child: Align(
              //     alignment: AlignmentDirectional.topEnd,
              //     child: Text(AppLocalizations.of(context)!.not_replay,style:TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.red,
              //         fontSize: 12.sp,
              //         fontFamily: 'Tajawal'),),
              //   ),
              // ),
            ],
          )),
    );
  }


}