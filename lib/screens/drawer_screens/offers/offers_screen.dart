import 'package:aphaa_app/api/controllers/App_api_controller.dart';
import 'package:aphaa_app/general/slider_wedgit.dart';
import 'package:aphaa_app/model/offer.dart';
import 'package:aphaa_app/screens/in_level_screen/offer_ditails/offer_details.dart';
import 'package:flutter/material.dart';

import '../../in_level_screen/Insurance_approvals/screen_item.dart';

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
      // appBar: AppBar(
      //     elevation: 0,
      //     // leadingWidth: 40,
      //     title: Text('العروض',
      //         style: const TextStyle(
      //           color: Colors.white,
      //           fontSize: 16,
      //           fontFamily: 'Tajawal',
      //           fontWeight: FontWeight.bold,
      //         )),
      //     titleSpacing: 2,
      //     centerTitle: true, ),
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
}
