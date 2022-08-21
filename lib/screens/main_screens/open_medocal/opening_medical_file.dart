import 'package:aphaa_app/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';

class OpeningMedicalFile extends StatefulWidget {

  @override
  State<OpeningMedicalFile> createState() => _OpeningMedicalFileState();
}

class _OpeningMedicalFileState extends State<OpeningMedicalFile> with Helpers{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text('فتح ملف طبي',style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        )),
        titleSpacing: 2,
        leading: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(5.0),
            // alignment: Alignment.bottomLeft,
            // width: 80,
            // height: 500,
            decoration: BoxDecoration(
                color: const Color(0xff006F2C),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15,
            )),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.head_of_consult_screen,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
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
                EditTextItem('assets/images/id.svg', 'الهوية / الإقامة'),
                EditTextItem('assets/images/phone.svg', AppLocalizations.of(context)!.phone),
                EditTextItem('assets/images/scure.svg', 'شركة التأمين / كاش'),
                EditTextItem('assets/images/scureId.svg', 'رقم بوليصية التأمين'),
                Container(
                  width: double.infinity,
                  height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff0E4C8F),width: 0.5),
                    ),
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                          'assets/images/Upload.svg',
                          semanticsLabel: 'Acme Logo'
                      ),
                      SizedBox(height: 10,),
                      Text("إرفاق صورة عن الهوية", style : TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      )),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          BtnLayout('فتح ملف طبي', () {showAlertDialog(context);}),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
