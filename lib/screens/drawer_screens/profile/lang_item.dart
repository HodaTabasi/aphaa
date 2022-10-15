import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../get/language_getx_controller.dart';
import '../../../preferences/shared_pref_controller.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangItem extends StatefulWidget {

  @override
  State<LangItem> createState() => _LangItemState();
}

class _LangItemState extends State<LangItem> {
  var isExpand = false;
  int  langValue = SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)=='ar'?0:1;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 100),
        elevation: 2,
        children: [
          ExpansionPanel(
              isExpanded: isExpand,
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0.r),
                        child: Text(AppLocalizations.of(context)!.ar,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0.r),
                        child: Radio(
                          value: 0,
                          groupValue: langValue,
                          onChanged: (int? value) {
                            langValue = value!;
                            LanguageGetxController.to.changeEditLanguage(langValue);

                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0.r),
                        child: Text(AppLocalizations.of(context)!.en,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0.r),
                        child: Radio(
                          value: 1,
                          groupValue: langValue,
                          onChanged: (int? value) {
                            langValue = value!;
                            LanguageGetxController.to.changeEditLanguage(langValue);

                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0.r),
                      child: Text(AppLocalizations.of(context)!.lang,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)=='ar'?"العربية":"English",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontFamily: 'Tajawal'),
                    ),
                  ],
                );
              }),
        ],
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            isExpand = !isExpand;
            // visable = !isExpand;
          });
        },
      ),
    );

  }
}
