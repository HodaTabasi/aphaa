import 'package:aphaa_app/api/controllers/App_api_controller.dart';
import 'package:aphaa_app/general/slider_wedgit.dart';
import 'package:aphaa_app/model/offer.dart';
import 'package:aphaa_app/screens/in_level_screen/offer_ditails/offer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../get/quick_service_getx_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OfferScreen extends StatefulWidget {

  static String routeName = "/offers";

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: QuickServiceGetxController.to.fromHome ?AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.medical_offers,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          centerTitle: true,
        leading:
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
      ):null,
      body: ListView(
        children: [
          FutureBuilder<List<Offers>>(
            future: AppApiController().getOffers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Center(child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, OfferDetails.routeName,arguments:{"data":snapshot.data![index]} );
                        },
                        child: SliderWidget(offers: snapshot.data![index],)));
                  },
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
          // Image.asset(
          //   "assets/images/image1.png",
          //   fit: BoxFit.fitWidth,
          // ),
        ],
      ),
      bottomSheet:  Image.asset(
        "assets/images/image1.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
  @override
  void dispose() {
    QuickServiceGetxController.to.fromHome = false;
    super.dispose();
  }
}
