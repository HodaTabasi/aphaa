import 'dart:convert';
import 'dart:io';

import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/helper/FileProcess.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_details.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:io' as Io;
import 'dart:convert';

class DoctorItem extends StatefulWidget {
  Doctor doctor;

  DoctorItem(this.doctor);

  @override
  State<DoctorItem> createState() => _DoctorItemState();
}

class _DoctorItemState extends State<DoctorItem> {
  var img;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFile();
  }

   getFile() async {
    // isLoading = true;
    //  var imag1 = "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";
     var imag1 = widget.doctor.img?.replaceAll("\n", "");
     final decodedBytes = base64Decode(imag1??'');
    img = decodedBytes;

    // var file = Io.File("${widget.doctor.doctorCode}.png");
    // file.writeAsBytesSync(decodedBytes);

    // setState(() {
    //   // isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(widget.doctor.doctorName);
        var imag1 = widget.doctor.img?.replaceAll("\n", "");
        final decodedBytes = base64Decode(imag1??'');

        QuickServiceGetxController.to.saveDoctor(widget.doctor,decodedBytes);

        Navigator.pushNamed(context, DoctorDetails.routeName);
      },
      child: Container(
        // width: 100,
        // height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 10),
          //     blurRadius: 70,
          //     color: Colors.grey.withOpacity(0.23),
          //   ),
          // ],
        ),

        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.r),
                    child: widget.doctor.img!.isEmpty
                        ? Image.network(
                            "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png",
                            // "https://jihadm33.sg-host.com/public/storage/${doctor.img}",
                            width: 144.w,
                            height: 114.h,
                          )
                        : img != null
                            ? Image.memory(img!)
                            : Image.network(
                                "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png",
                                // "https://jihadm33.sg-host.com/public/storage/${doctor.img}",
                                width: 144.w,
                                height: 114.h,
                              ),
                  ),
                ),
                Text(
                  widget.doctor.doctorName!,
                  style: TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  widget.doctor.clinicName!,
                  style: TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 14.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                  var imag1 = widget.doctor.img?.replaceAll("\n", "");
                  final decodedBytes = base64Decode(imag1??'');

                  QuickServiceGetxController.to.saveDoctor(widget.doctor,decodedBytes);

                  Navigator.pushNamed(context, DoctorDetails.routeName);
                  // Navigator.pushNamed(context, DoctorDetails.routeName,
                  //     arguments: {"data": doctor});
                },
                child: Container(
                  width: 200.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Color(0xff0E4C8F),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    border: Border.all(
                      width: 2,
                      color: Color(0xff0E4C8F),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.view_doctor_profile,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
