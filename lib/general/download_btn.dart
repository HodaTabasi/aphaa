import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class downloadBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff0E4C8F),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: SvgPicture.asset(
              'assets/images/Download.svg',
              semanticsLabel: 'Acme Logo',
            ),
          ),
          Text(AppLocalizations.of(context)!.upload,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
