import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0E4C8F),width: 0.5.r),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.0.r),
              child:  SvgPicture.asset(
                  widget.icon,
                  semanticsLabel: 'Acme Logo',
                color: Color(0xff058638),
              ),
            ),
             VerticalDivider(
                width:2.w,
                thickness:0.5,
                color:Color(0xff0E4C8F)
            ),
            Expanded(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 16.r),
              child: Text(
                widget.hint,
                style:  TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13.sp,
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