
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../api/controllers/hospital_controller.dart';
import '../../../general/my_separator.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../model/VitalSign/vitalSignsDils.dart';

class VitalButtomSheet extends StatefulWidget {
  String vitalSignId;
  VitalButtomSheet(this.vitalSignId);


  @override
  State<VitalButtomSheet> createState() => _VitalButtomSheetState();
}

class _VitalButtomSheetState extends State<VitalButtomSheet> {
  List<String> images = [
    'assets/images/prasher.svg',
    'assets/images/suger.svg',
    'assets/images/heartw.svg',
    'assets/images/higth.svg',
    'assets/images/wihtj.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(8.r),

        child:  FutureBuilder<List<VitalSignDtils>>(
          future: HospitalApiController().getPtVSDtl(vitalSignId: widget.vitalSignId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return  Column(
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: 10.w,
                    indent: 100.w,
                    endIndent: 100.w,
                  ),
                  SizedBox(height: 15.h,),
                  ListView.separated(
                    shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                    return  Padding(
                      padding:  EdgeInsets.all(8.0.r),
                      child: Visibility(
                        visible: snapshot.data![index].signValue!.isNotEmpty,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              images[index],
                              semanticsLabel: 'Acme Logo',
                            ),
                            Padding(
                              padding:  EdgeInsets.all(8.0.r),
                              child: Text('${snapshot.data![index].signName}',
                                  style:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            Spacer(),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffF7F8FB),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(16.0.r),
                                child: Text(
                                  '${snapshot.data![index].signValue}',
                                  style:  TextStyle(
                                    color: Color(0xff2D2D2D),
                                    fontSize: 14.sp,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), ),
                          ],
                        ),
                      ),
                    );
                      },
                      separatorBuilder: (context, index) {
                    return Visibility(
                      visible: snapshot.data![index].signName!.isEmpty,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.r,vertical: 8.r),
                        child: MySeparator(color: Color(0xff0E4C8F)),
                      ),
                    );
                      },
                      ),
                  // Padding(
                  //   padding:  EdgeInsets.all(8.0.r),
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/images/prasher.svg',
                  //         semanticsLabel: 'Acme Logo',
                  //       ),
                  //       Padding(
                  //         padding:  EdgeInsets.all(8.0.r),
                  //         child: Text(AppLocalizations.of(context)!.pressure,
                  //             style:  TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.normal,
                  //             )),
                  //       ),
                  //       Spacer(),
                  //       DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xffF7F8FB),
                  //           borderRadius: BorderRadius.circular(5.r),
                  //         ),
                  //         child: Padding(
                  //           padding:  EdgeInsets.all(16.0.r),
                  //           child: Text(
                  //             '140/100',
                  //             style:  TextStyle(
                  //               color: Color(0xff2D2D2D),
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ), ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 80.r,vertical: 8.r),
                  //   child: MySeparator(color: Color(0xff0E4C8F)),
                  // ),
                  // Padding(
                  //   padding:  EdgeInsets.all(8.0.r),
                  //   child: Row(
                  //     children: [
                  //
                  //       SvgPicture.asset(
                  //         'assets/images/suger.svg',
                  //         semanticsLabel: 'Acme Logo',
                  //       ),
                  //       Padding(
                  //         padding:  EdgeInsets.all(8.0.r),
                  //         child: Text(AppLocalizations.of(context)!.diabetes,
                  //             style:  TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.normal,
                  //             )),
                  //       ),
                  //       Spacer(),
                  //       DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xffF7F8FB),
                  //           borderRadius: BorderRadius.circular(5.r),
                  //         ),
                  //         child: Padding(
                  //           padding:  EdgeInsets.all(16.0.r),
                  //           child: Text(
                  //             '140/100',
                  //             style:  TextStyle(
                  //               color: Color(0xff2D2D2D),
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ), ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
                  //   child: MySeparator(color: Color(0xff0E4C8F)),
                  // ),
                  // Padding(
                  //   padding:  EdgeInsets.all(8.0.r),
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/images/higth.svg',
                  //         semanticsLabel: 'Acme Logo',
                  //       ),
                  //       Padding(
                  //         padding:  EdgeInsets.all(8.0.r),
                  //         child: Text(AppLocalizations.of(context)!.height,
                  //             style:  TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.normal,
                  //             )),
                  //       ),
                  //       Spacer(),
                  //       DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xffF7F8FB),
                  //           borderRadius: BorderRadius.circular(5.r),
                  //         ),
                  //         child: Padding(
                  //           padding:  EdgeInsets.all(16.0.r),
                  //           child: Text(
                  //             '140/100',
                  //             style:  TextStyle(
                  //               color: Color(0xff2D2D2D),
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ), ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
                  //   child: MySeparator(color: Color(0xff0E4C8F)),
                  // ),
                  // Padding(
                  //   padding:  EdgeInsets.all(8.0.r),
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/images/wihtj.svg',
                  //         semanticsLabel: 'Acme Logo',
                  //       ),
                  //       Padding(
                  //         padding:  EdgeInsets.all(8.0.r),
                  //         child: Text(AppLocalizations.of(context)!.weight,
                  //             style:  TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.normal,
                  //             )),
                  //       ),
                  //       Spacer(),
                  //       DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xffF7F8FB),
                  //           borderRadius: BorderRadius.circular(5.r),
                  //         ),
                  //         child: Padding(
                  //           padding:  EdgeInsets.all(16.0.r),
                  //           child: Text(
                  //             '140/100',
                  //             style:  TextStyle(
                  //               color: Color(0xff2D2D2D),
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ), ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
                  //   child: MySeparator(color: Color(0xff0E4C8F)),
                  // ),
                  // Padding(
                  //   padding:  EdgeInsets.all(8.0.r),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         'assets/images/heart.png',
                  //       ),
                  //       Padding(
                  //         padding:  EdgeInsets.all(8.0.r),
                  //         child: Text(AppLocalizations.of(context)!.weight,
                  //             style:  TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.normal,
                  //             )),
                  //       ),
                  //       Spacer(),
                  //       DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xffF7F8FB),
                  //           borderRadius: BorderRadius.circular(5.r),
                  //         ),
                  //         child: Padding(
                  //           padding:  EdgeInsets.all(16.0.r),
                  //           child: Text(
                  //             '140/100',
                  //             style:  TextStyle(
                  //               color: Color(0xff2D2D2D),
                  //               fontSize: 14.sp,
                  //               fontFamily: 'Tajawal',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ), ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 80.0.r,vertical: 8.r),
                  //   child: MySeparator(color: Color(0xff0E4C8F)),
                  // ),
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

      ),
    );
  }
}
