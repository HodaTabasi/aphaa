import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditTextItem extends StatefulWidget {
  String icon;
  String hint;
  bool b = true;
  bool first = true;
  TextInputType type;
  var numberFocusNode;
  var inputFormatters;

  TextEditingController? controler;
  EditTextItem(this.icon,this.hint, this.type,{this.inputFormatters,this.numberFocusNode,this.controler ,this.b = true,}) ;

  @override
  State<EditTextItem> createState() => _EditTextItemState();
}

class _EditTextItemState extends State<EditTextItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
      decoration: BoxDecoration(
        border: Border.all(color: widget.first?Color(0xff0E4C8F):widget.controler!.text.isNotEmpty?Color(0xff0E4C8F):Colors.red,width: 0.5.w),
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
                width: 24.w,
                height: 24.h,
              ),
            ),
             VerticalDivider(
                width:2.w,
                thickness:0.5.w,
                color: widget.first?Color(0xff0E4C8F):widget.controler!.text.isNotEmpty?Color(0xff0E4C8F):Colors.red
            ),
            Expanded(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
              child: TextFormField(
                onTap: (){
                  widget.controler?.selection = TextSelection.fromPosition(TextPosition(offset: widget.controler!.text.length));
                },
                controller: widget.controler,
                enabled: widget.b,
                keyboardType: widget.type,
                focusNode: widget.numberFocusNode,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13.sp,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                  )
                ),
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