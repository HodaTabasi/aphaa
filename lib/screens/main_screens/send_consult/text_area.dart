import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAreaWidget extends StatefulWidget {

  TextEditingController controller;
  bool first = true;
  TextAreaWidget(this.controller);

  @override
  State<TextAreaWidget> createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(16.r),
        child: TextFormField(
          maxLines: 4,
          controller: widget.controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: widget.first?Color(0xff0E4C8F):widget.controller.text.isNotEmpty?Color(0xff0E4C8F):Colors.red, width: 0.5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    color: widget.first?Color(0xff0E4C8F):widget.controller.text.isNotEmpty?Color(0xff0E4C8F):Colors.red, width: 0.5.w),
              ),
              hintText: AppLocalizations.of(context)!.consult_note,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          onChanged: (value) {
            widget.first = false;
            setState(() {
            });
          }),
        );
  }
}