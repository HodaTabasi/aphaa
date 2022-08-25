import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'familly_item.dart';

class FamillyScreen extends StatefulWidget {

  static String routeName = "/family";

  @override
  State<FamillyScreen> createState() => _FamillyScreenState();
}

class _FamillyScreenState extends State<FamillyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text('الوصفات الطبية',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2,
          leading: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(5.0),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/images/Notification.svg',
                  semanticsLabel: 'Acme Logo',
                ),
              ),
            ),
          ]),
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context,index){
                return FamillyItem();
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
