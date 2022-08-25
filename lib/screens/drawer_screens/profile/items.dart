import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextItem extends StatelessWidget {
  String icon;
  String hint;
  bool isVisable = false;
  TextItem(this.icon,this.hint ,{this.isVisable = false}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0E4C8F),width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child:  SvgPicture.asset(
                  icon,
                  semanticsLabel: 'Acme Logo'
              ),
            ),
            const VerticalDivider(
                width:2,
                thickness:0.5,
                color:Color(0xff0E4C8F)
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
              child: Text(
                hint,
                style:  TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Opacity(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.arrow_forward_ios,color: Color(0xff058638),size: 20,),
              ),
              opacity: isVisable ?0:1,
            )
          ],
        ),
      ),
    );
  }
}