import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordItem extends StatefulWidget {
  String icon;
  String value;
  TextEditingController? controler;
  bool first = true;
  PasswordItem(this.icon,this.value,{this.controler});

  @override
  State<PasswordItem> createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {
  var isVisable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      decoration: BoxDecoration(
        border: Border.all(color: widget.first?Color(0xff0E4C8F):widget.controler!.text.isNotEmpty?Color(0xff0E4C8F):Colors.red, width: 0.5.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.0.r),
              child: SvgPicture.asset(widget.icon,
                  semanticsLabel: 'Acme Logo'),
            ),
             VerticalDivider(
                width: 2.w, thickness: 0.5.w, color: widget.first?Color(0xff0E4C8F):widget.controler!.text.isNotEmpty?Color(0xff0E4C8F):Colors.red),
            Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
                  child: TextFormField(
                    controller: widget.controler,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.value,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13.sp,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: isVisable
                            ? InkWell(
                            onTap: () {
                              setState(() {
                                isVisable = !isVisable;
                              });
                            },
                            child: Icon(
                              Icons.visibility,
                              color: Color(0xff058638),
                            ))
                            : InkWell(
                          onTap: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          child: Icon(Icons.visibility_off,
                              color: Color(0xff058638)),
                        )),
                    obscureText: !isVisable,
                    onChanged: (value) {
                      widget.first = false;
                      setState(() {
                      });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
