import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyMedicalFileItem extends StatelessWidget {

  String image;
  String name;

  MyMedicalFileItem({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xff0E4C8F),width: 0.5),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 10),
        //     blurRadius: 70,
        //     color: Colors.grey.withOpacity(0.23),
        //   ),
        // ],
      ),
      padding: EdgeInsets.all(16),
      margin:  EdgeInsets.all(5),
      child: Column(
        children: [
          // Spacer(),
          SvgPicture.asset(
              image,
              semanticsLabel: 'Acme Logo'
          ),
          const SizedBox(
            height: 15,
          ),
          Text(name,
            style:  TextStyle(
              color: Color(0xff2B2B2B),
              fontSize: 14,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w600,
            ),),

          // Spacer(),
        ],
      ),
    );
  }
}
