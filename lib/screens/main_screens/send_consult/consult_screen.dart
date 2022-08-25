import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/screens/main_screens/send_consult/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';

class SendConsultScreen extends StatefulWidget {
  static String routeName = "/send_consult";
  @override
  State<SendConsultScreen> createState() => _SendConsultScreenState();
}

class _SendConsultScreenState extends State<SendConsultScreen> with Helpers{
  var myData = ['اختر العيادة', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.consultation_request,style:  TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding:  EdgeInsets.all(5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
        ),
      ),
      body: ListView(
        children: [
           SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: Text(
              AppLocalizations.of(context)!.head_of_consult_screen,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Form(
            child: Column(
              children: [
                EditTextItem('assets/images/Profile.svg',AppLocalizations.of(context)!.pasent_name ),
                EditTextItem('assets/images/Message.svg', AppLocalizations.of(context)!.email),
                EditTextItem('assets/images/phone.svg', AppLocalizations.of(context)!.phone),
                DropDownItem(
                    myData, 'assets/images/hospital.svg', AppLocalizations.of(context)!.clenice_choesse),
                DropDownItem(
                    myData, 'assets/images/docgreen.svg', AppLocalizations.of(context)!.dovtor_choesse),
                const TextAreaWidget()
              ],
            ),
          ),
           SizedBox(height: 10.h),
          BtnLayout(AppLocalizations.of(context)!.consult_send, () {showAlertDialog(context);}),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
