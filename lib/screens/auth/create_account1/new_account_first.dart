import 'package:aphaa_app/screens/auth/create_account1/viewPagerPartOne.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../general/password_item.dart';
import 'ViewPagerPageTwo.dart';
import 'create_account_next1.dart';

class NewAccountFirst extends StatefulWidget {
  static String routeName = "/create_account1";

  @override
  State<NewAccountFirst> createState() => _NewAccountFirstState();
}

class _NewAccountFirstState extends State<NewAccountFirst>  {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // leadingWidth: 40,
          title: Text(AppLocalizations.of(context)!.create_account,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
          titleSpacing: 2.r,
          centerTitle: true,
        ),
        body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ViewPagerPartOne(controller: controller,),
            ViewPagerPageTow(controller: controller,),
            CreateAccountNext1()
          ],
        ));
  }
}
