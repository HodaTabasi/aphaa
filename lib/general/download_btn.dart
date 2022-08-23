import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class downloadBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff0E4C8F),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/images/Download.svg',
              semanticsLabel: 'Acme Logo',
            ),
          ),
          Text('تحميل',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
