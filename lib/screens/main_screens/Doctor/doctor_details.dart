import 'dart:convert';

import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/my_separator.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/preferences/shared_pref_controller.dart';
import 'package:aphaa_app/screens/main_screens/Doctor/personal_resrvation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../get/new_account_getx_controller.dart';
import '../../../get/quick_service_getx_controller.dart';
import '../../../helper/helper.dart';
import '../../in_level_screen/medical_recipes/medical_recipes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Appointment Booking/appointement_booking.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper ;

class DoctorDetails extends StatefulWidget {
  static String routeName = "/doctor_details";


  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> with Helpers , myHelper.Helpers1{
  // late VideoPlayerController _controller;
  // bool v = false;

  // var instalation;



  @override
  void initState() {
    print("fger ${QuickServiceGetxController.to.img}");
    super.initState();
  }

  // late Doctor doctor;

  // @override
  // void initState() {
  //   // getDoctorData();
  //   super.initState();
  //   // _controller = VideoPlayerController.network(
  //   //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
  //   //   ..initialize().then((_) {
  //   //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //   //     setState(() {});
  //   //   });
  // }

  // getDoctorData() async {
  //   doctor = await HospitalApiController().getDoctorDtl(doctorCode:QuickServiceGetxController.to.doctor?.doctorCode ) ?? Doctor();
  // }

  @override
  Widget build(BuildContext context) {
    // final routeArgs1 =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, Doctor?>;
    // if (routeArgs1 != null) {
    //   instalation = routeArgs1['data'];
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.the_doctor,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Container(
                margin: EdgeInsets.all(15.0.r),
                padding: EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 5.0.r),
                // alignment: Alignment.bottomLeft,
                // width: 80,
                // height: 500,
                decoration: BoxDecoration(
                    color: const Color(0xff006F2C),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15.sp,
                )),
          ),
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.all(8.0.r),
          //     child: InkWell(
          //       onTap: () {},
          //       child: SvgPicture.asset(
          //         'assets/images/Notification.svg',
          //         semanticsLabel: 'Acme Logo',
          //       ),
          //     ),
          //   ),
          // ]
      ),
      body: FutureBuilder<Doctor?>(
        future: HospitalApiController().getDoctorDtl(
            doctorCode: QuickServiceGetxController.to.doctor?.doctorCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {

            return ListView(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 260.h,
                  margin: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    border: Border.all(color: Color(0xff0E4C8F), width: 0.8.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0.r),
                      child: snapshot.data!.img!.isEmpty
                          ? Image.network(
                        "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png",
                        // "https://jihadm33.sg-host.com/public/storage/${doctor.img}",
                        width: 144.w,
                        height: 114.h,
                      )
                          : QuickServiceGetxController.to.img.isNotEmpty
                          ? Image.memory(QuickServiceGetxController.to.img)
                          : Image.network(
                        "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png",
                        // "https://jihadm33.sg-host.com/public/storage/${doctor.img}",
                        width: 144.w,
                        height: 114.h,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data!.doctorName!,
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data!.clinicName!,
                        style: TextStyle(
                          color: Color(0xff2D2D2D),
                          fontSize: 15.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0.r, vertical: 8.r),
                  child: MySeparator(color: Color(0xff058638)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                /////////////////main info//////////
                Visibility(
                  visible: snapshot.data!.sciMainInfo!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: Text(
                      AppLocalizations.of(context)!.about_me,
                      style: TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15.r,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: snapshot.data!.sciMainInfo!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.sciMainInfo!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.circle,
                              color: Color(0xff0E4C8F),
                              size: 8.r,
                            ),
                            title: Text(
                              snapshot.data!.sciMainInfo![index],
                              style: TextStyle(
                                color: Color(0xff2D2D2D),
                                fontSize: 13.sp,
                                fontFamily: 'Tajawal',
                                overflow: TextOverflow.fade,
                                // height: 2
                                // fontWeight: FontWeight.normal,
                              ),
                              maxLines: 5,
                            ),
                          );
                        })),
                  ),
                ),
                /////////////// pastExpInfo ////////////////
                Visibility(
                  visible: snapshot.data!.pastExpInfo!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: Text(
                      AppLocalizations.of(context)!.prior_experiences,
                      style: TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15.r,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: snapshot.data!.pastExpInfo!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.pastExpInfo!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.circle,
                              color: Color(0xff0E4C8F),
                              size: 8.r,
                            ),
                            title: Text(
                              snapshot.data!.pastExpInfo![index],
                              style: TextStyle(
                                color: Color(0xff2D2D2D),
                                fontSize: 13.sp,
                                fontFamily: 'Tajawal',
                                overflow: TextOverflow.fade,
                                // height: 2
                                // fontWeight: FontWeight.normal,
                              ),
                              maxLines: 5,
                            ),
                          );
                        })),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                //////////////// medSrvInfo //////////////
                Visibility(
                  visible: snapshot.data!.medSrvInfo!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: Text(
                      AppLocalizations.of(context)!
                          .medical_services_information,
                      style: TextStyle(
                        color: Color(0xff2D2D2D),
                        fontSize: 15.r,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: snapshot.data!.medSrvInfo!.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.medSrvInfo!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.circle,
                              color: Color(0xff0E4C8F),
                              size: 8.r,
                            ),
                            title: Text(
                              snapshot.data!.medSrvInfo![index],
                              style: TextStyle(
                                color: Color(0xff2D2D2D),
                                fontSize: 13.sp,
                                fontFamily: 'Tajawal',
                                overflow: TextOverflow.fade,
                                // height: 2
                                // fontWeight: FontWeight.normal,
                              ),
                              maxLines: 5,
                            ),
                          );
                        })),
                  ),
                ),
                ///////////////////////// data table////////////////
                SizedBox(
                  height: 30.h,
                ),
                Visibility(
                  visible: snapshot.data!.drSkillInfo!.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DataTable(
                        // datatable widget
                        columns: [
                          // column to set the name
                          DataColumn(
                            label: Text(AppLocalizations.of(context)!.skill_name,
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.r)),
                          ),
                          DataColumn(
                            label: Text(AppLocalizations.of(context)!.skill_pec,
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.r)),
                          ),
                        ],
                        rows: snapshot.data!.drSkillInfo!.map((e) {
                          return DataRow(cells: [
                            DataCell(Text(e.skillName!,
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.r))),
                            DataCell(Text(e.skillPct!,
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.r))),
                          ]);
                        }).toList()),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Opacity(
                  opacity: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.date_of_visit,
                          style: TextStyle(
                            color: Color(0xff2D2D2D),
                            fontSize: 15.sp,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, MedicalRecipes.routeName),
                            child: SvgPicture.asset(
                              'assets/images/image4.svg',
                              semanticsLabel: 'Acme Logo',
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, MedicalRecipes.routeName),
                          child: SvgPicture.asset(
                            'assets/images/image3.svg',
                            semanticsLabel: 'Acme Logo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                  child: Row(
                    children: [
                      Expanded(
                          child: BtnLayout(
                              AppLocalizations.of(context)!.book_an_appointment,
                              () {
                                if(SharedPrefController().getValueFor(key: PrefKeysPatient.isLoggedIn.name)??false){
                                  if (SharedPrefController().token != null ||
                                      SharedPrefController().token.isNotEmpty) {
                                    NewAccountGetxController.to.doctorCode = snapshot.data!.doctorCode!;
                                    NewAccountGetxController.to.clinicCode = "14";
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyPersonalAppointmentBooking(snapshot.data!)));
                                  } else {
                                    Navigator.pushNamed(
                                        context, AppointmentBooking.routeName);
                                  }
                                }else{
                                  showAlertDialog2(context,message: AppLocalizations.of(context)!.no_account);
                                }

                      })),
                      // Padding(
                      //   padding: EdgeInsets.all(8.0.r),
                      //   child: InkWell(
                      //     onTap: () {
                      //       // showVidetAlertDialog(context);
                      //     },
                      //     child: SvgPicture.asset(
                      //       'assets/images/image5.svg',
                      //       semanticsLabel: 'Acme Logo',
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.fitWidth,
                ),
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
    );
  }

// showVidetAlertDialog(BuildContext context) {
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     backgroundColor: Color(0xffF2F2F2),
//     content: Container(
//       width: 300.w, height: 200.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       // padding: EdgeInsets.all(16),
//       child: Stack(children: [
//         Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(
//                   width: 300.w,
//                   height: 200.h,
//                 ),
//         ),
//         Opacity(
//           opacity: 0,
//           child: Center(
//             child: FloatingActionButton(
//               onPressed: () {
//                 setState(() {
//                   _controller.value.isPlaying
//                       ? _controller.pause()
//                       : _controller.play();
//
//                   // v = !v;
//                 });
//               },
//               child: Icon(
//                 _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//               ),
//             ),
//           ),
//         ),
//       ]),
//     ),
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

}
