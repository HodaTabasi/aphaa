import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_details.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoctorItem extends StatelessWidget {
  Doctor doctor;

  DoctorItem(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Image.network(
                    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
                    // "https://jihadm33.sg-host.com/public/storage/${doctor.img}",
                    width: 144.w,
                    height: 114.h,
                  ),
                ),
              ),
              Text(
                doctor.doctorName!,
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
                doctor.clinicName!,
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
                Navigator.pushNamed(context, DoctorDetails.routeName);
                // Navigator.pushNamed(context, DoctorDetails.routeName,
                //     arguments: {"data": doctor});
                QuickServiceGetxController.to.saveDoctor(doctor);
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
    );
  }
}
