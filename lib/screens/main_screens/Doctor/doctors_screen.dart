import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../model/allDocResponse.dart';
import '../Appointment Booking/doctor_filtter.dart';
import 'DoctorItem.dart';

class DoctorsScreen extends StatefulWidget {
  static String routeName = "/doctors";

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  var selectedPageNumber = 1;

  String offSet = "1";

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.all(5.0.r),
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
      ),
      body: FutureBuilder<DoctorListResponse?>(
        future: HospitalApiController().getClDrs(flag: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            return ListView(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(140, 171, 205, 0.12),
                                    width: 0.5.w),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(140, 171, 205, 0.12),
                                    width: 0.5.w),
                              ),
                              hintText:
                                  AppLocalizations.of(context)!.find_a_doctor,
                              hintStyle: TextStyle(
                                color: Color(0xff739ECC),
                                fontSize: 13.sp,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Color.fromRGBO(140, 171, 205, 0.12),
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
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.doctors!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w,
                        childAspectRatio: 240 / 330),
                    itemBuilder: (context, index) {
                      return DoctorItem(snapshot.data!.doctors![index]);
                    },
                  ),
                ),
                Visibility(
                  visible: snapshot.data!.pages!.length > 1,
                  child: NumberPagination(
                    controlButton: ColoredBox(
                      color: Colors.white,
                    ),
                    onPageChanged: (int pageNumber) {
                      //do somthing for selected page
                      setState(() {
                        selectedPageNumber = pageNumber;
                        offSet = snapshot.data!
                            .pages![selectedPageNumber - 1].offset!;
                      });
                    },
                    pageTotal: snapshot.data!.pages!.length,
                    pageInit: selectedPageNumber,
                    // picked number when init page
                    colorPrimary: Colors.green,
                    colorSub: Colors.white,
                    fontFamily: 'Tajawal',
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
                'NO DATA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
    // Image.asset(
    //   "assets/images/image1.png",
    //   fit: BoxFit.fitWidth,
    // ),
  }
}
