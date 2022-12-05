import 'package:aphaa_app/get/doctor_getx_controller.dart';
import 'package:aphaa_app/helper/FileProcess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../general/NewWidgetNetworkFirst.dart';
import '../../../general/NewWidgetNetworkLoadMore.dart';
import '../Appointment Booking/doctor_filtter.dart';
import 'DoctorItem.dart';

class DoctorsScreen extends StatefulWidget {
  static String routeName = "/doctors";

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DoctorGetxController.to.firstLoad();
    DoctorGetxController.to.controller = ScrollController()
      ..addListener(DoctorGetxController.to.loadMore);
  }

  @override
  Widget build(BuildContext context) {
    FileProcess.checkDocumentFolder();
    return GetX<DoctorGetxController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            // leadingWidth: 40,
            title: Text(AppLocalizations.of(context)!.doctors,
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
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: CircleAvatar(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 34.w,
                    height: 30.h,
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          body: controller.isNoNetworkConnect.value
              ? InkWell(
                  onTap: () {
                    controller.firstLoad();
                  },
                  child: NewWidgetNetworkFirst(),
                )
              : controller.isFirstLoadRunning.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.0.r),
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (val) {
                                    controller.filtterByName(val);
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                140, 171, 205, 0.12),
                                            width: 0.5.w),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                140, 171, 205, 0.12),
                                            width: 0.5.w),
                                      ),
                                      hintText: AppLocalizations.of(context)!
                                          .find_a_doctor,
                                      hintStyle: TextStyle(
                                        color: Color(0xff739ECC),
                                        fontSize: 13.sp,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      fillColor:
                                          Color.fromRGBO(140, 171, 205, 0.12),
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.search_sharp,
                                        color: Color(0xff0E4C8F),
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: false,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => DoctorFillter(),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(12.r),
                                margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                decoration: BoxDecoration(
                                  color: Color(0xff0E4C8F),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Icon(
                                  Icons.filter_list_alt,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: GridView.builder(
                              // shrinkWrap: true,
                              itemCount: controller.list.length,
                              controller: controller.controller,
                              // physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15.h,
                                      crossAxisSpacing: 15.w,
                                      childAspectRatio: 240 / 330),
                              itemBuilder: (context, index) {
                                return DoctorItem(controller.list[index]);
                              },
                            ),
                          ),
                        ),
                        if (controller.isNoNetworkConnectInLoadMore == true)
                          InkWell(
                            onTap: () {
                              controller.loadMore();
                            },
                            child: const NewWidgetNetworkLoadMore(),
                          ),
                        if (controller.isLoadMoreRunning == true)
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        // if (controller.hasNextPage == false || controller.pageList.length ==1)
                          Center(
                            child: Image.asset(
                              "assets/images/image1.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                      ],
                    ),
        );
      },
    );
    // Image.asset(
    //   "assets/images/image1.png",
    //   fit: BoxFit.fitWidth,
    // ),
  }
}
