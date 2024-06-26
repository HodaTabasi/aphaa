import 'dart:io';

import 'package:aphaa_app/general/btn_layout.dart';
import 'package:aphaa_app/general/edittext_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../general/readPdf.dart';
import '../get/change_name_getx_controller.dart';
import 'helpers.dart';

class ShareButtomSheet extends StatefulWidget {
  String path;
  ShareButtomSheet(this.path);

  @override
  State<ShareButtomSheet> createState() => _ShareButtomSheetState();
}

class _ShareButtomSheetState extends State<ShareButtomSheet> with Helpers1{
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

          SizedBox(
            height: 20.h,
          ),
          BtnLayout('${AppLocalizations.of(context)!.share}', () async {

            if(Platform.isAndroid) {
              Share.shareFiles(['${widget.path}'], text: 'ShreFile');
            }else {
              if (widget.path != null) {
                await Share.shareXFiles(
                  [XFile(widget.path)],
                  sharePositionOrigin: Rect.fromCircle(
                    radius: MediaQuery.of(context).size.width * 0.25,
                    center: const Offset(0, 0),
                  ),
                );
              } else {
                showSnackBarAction(context, message: "Failed to share",error: true);
              }
            }
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
            ChangeGetxController.to.filePath = widget.path;
            Navigator.pushNamed(context, ReadPdf.routeName);
          }),
        ],
      ),
    );
  }
}
