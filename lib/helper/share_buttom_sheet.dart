import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/edittext_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../general/readPdf.dart';
import '../get/change_name_getx_controller.dart';

class ShareButtomSheet extends StatefulWidget {
  String path;
  ShareButtomSheet(this.path);

  @override
  State<ShareButtomSheet> createState() => _ShareButtomSheetState();
}

class _ShareButtomSheetState extends State<ShareButtomSheet> {
  bool whats = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.black,
            thickness: 10.h,
            indent: 100.w,
            endIndent: 100.w,
          ),
          // SizedBox(
          //   height: 16.r,
          // ),
          // Text(
          //   'شارك التقرير الطبي عبر :',
          //   style: TextStyle(
          //     color: Color(0xff2D2D2D),
          //     fontSize: 15.sp,
          //     fontFamily: 'Tajawal',
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          SizedBox(
            height: 20.h,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     InkWell(
          //         onTap: () {
          //           whats = true;
          //           setState(() {});
          //         },
          //         child: SvgPicture.asset(
          //           'assets/images/whats.svg',
          //           height: 40.h,
          //           width: 40.w,
          //         )),
          //     SizedBox(
          //       width: 20.h,
          //     ),
          //     InkWell(
          //         onTap: () {
          //           whats = false;
          //           setState(() {});
          //         },
          //         child: Image.asset(
          //           'assets/images/email.png',
          //           height: 50.h,
          //           width: 50.w,
          //         )),
          //     // SizedBox(
          //     //   width: 20.h,
          //     // ),
          //     // InkWell(
          //     //     onTap: () {},
          //     //     child: Image.asset('assets/images/open.png',height: 50.h,width: 50.w,)
          //     // ),
          //   ],
          // ),
          // EditTextItem(
          //     whats ? 'assets/images/phone.svg' : 'assets/images/Message.svg',
          //     whats
          //         ? '${AppLocalizations.of(context)!.phone}'
          //         : '${AppLocalizations.of(context)!.email}',
          //     whats ? TextInputType.number : TextInputType.emailAddress,
          //     controler: TextEditingController()),
          BtnLayout('${AppLocalizations.of(context)!.share}', () {
            Share.shareFiles(['${widget.path}'], text: 'ShreFile');
          }),
          Text(
            '${AppLocalizations.of(context)!.or}',
            style: TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 20.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
          ),
          BtnLayout('${AppLocalizations.of(context)!.open}', () {
            Navigator.pushNamed(context, ReadPdf.routeName);
          }),
        ],
      ),
    );
  }
}
