import 'package:aphaa_app/general/slider_wedgit.dart';
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
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text('العروض',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          centerTitle: true, ),
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context,index){
                return Center(child: InkWell(
                  onTap: (){

                  },
                    child: SliderWidget()));
              }),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
