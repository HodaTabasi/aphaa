import 'package:aphaa_app/api/controllers/quick_service_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../get/quick_service_getx_controller.dart';

class GenderSelected extends StatefulWidget {
  String icon;

  bool first = true;
  bool gender = false;

  GenderSelected(this.gender,this.icon) ;

  @override
  State<GenderSelected> createState() => _GenderSelectedState();
}

class _GenderSelectedState extends State<GenderSelected> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      margin:  EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
      decoration: BoxDecoration(
        border: Border.all(color: widget.first?Color(0xff0E4C8F):Colors.red,width: 0.5.w),
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
                color: widget.first?Color(0xff0E4C8F):Colors.red
            ),
            Expanded(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(AppLocalizations.of(context)!.male),
                      value: true, groupValue: widget.gender, onChanged: (value) {
                      setState(() {
                        widget.gender = value as bool;
                        QuickServiceGetxController.to.gender = widget.gender;
                      });
                    },),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(AppLocalizations.of(context)!.female),
                      value: false, groupValue: widget.gender, onChanged:(value) {

                      setState(() {
                        // QuickServiceGetxController.to.geander = value as bool;
                        widget.gender = value as bool;
                        QuickServiceGetxController.to.gender = widget.gender;
                      });
                      },),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}