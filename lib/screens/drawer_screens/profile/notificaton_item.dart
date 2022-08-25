import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatefulWidget {
  String icon;
  String hint;
  bool value = false;
  NotificationItem(this.icon,this.hint ) ;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
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
                  widget.icon,
                  semanticsLabel: 'Acme Logo',
                color: Color(0xff058638),
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
                widget.hint,
                style:  TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Switch(value: widget.value, onChanged: (val){
              setState(() {
                widget.value = val;
              });
            }),
          ],
        ),
      ),
    );
  }
}