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
  File? img;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFile();
  }

   getFile() async {
    // isLoading = true;
    final decodedBytes = base64Decode(widget.doctor.img!);
    var file = Io.File("${widget.doctor.doctorCode}.png");
    file.writeAsBytesSync(decodedBytes);
    img = file;

    // setState(() {
    //   // isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(widget.doctor.doctorName);
        QuickServiceGetxController.to.saveDoctor(widget.doctor);

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
                            ? Image.file(img!)
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
                  QuickServiceGetxController.to.saveDoctor(widget.doctor);

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
