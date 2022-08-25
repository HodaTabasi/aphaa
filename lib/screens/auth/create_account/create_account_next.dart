import 'package:aphaa_app/screens/drawer_screens/buttom_navication.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../general/btn_layout.dart';
import '../../../general/dropdown_item.dart';
import '../../../general/edittext_item.dart';
import '../../drawer_screens/home_screen/home_screen.dart';

class CreateAccountNext extends StatefulWidget {

  static String routeName = "/create_account_next";
  @override
  State<CreateAccountNext> createState() => _CreateAccountNextState();
}

class _CreateAccountNextState extends State<CreateAccountNext>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  String name = 'assets/images/image2.svg';
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text('انشاء حساب',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
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
      ),
      body: Column(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 30,
          ),
          SvgPicture.asset(name,
              semanticsLabel: 'Acme Logo'),
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 2,
            thickness: 1,
            endIndent: 16,
            indent: 16,
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            child: TabBar(
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 25.w),
              padding: EdgeInsets.all(10),
              indicatorColor: Color(0xff058638),
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),
              labelColor: Colors.black,
              controller: controller,
              tabs: [
                Tab(
                  text: 'تامين',
                ),
                Tab(
                  text: 'كاش',
                ),
              ],
              onTap:(val){
                val == 1? name ='assets/images/image6.svg' : name = 'assets/images/image2.svg';
                setState(() {
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  children: [
                    EditTextItem('assets/images/snum.svg', 'رقم التامين'),
                    EditTextItem(
                        'assets/images/Calendarg.svg', 'تاريخ نهاية التامين'),
                    DropDownItem(
                        [], 'assets/images/company.svg', 'شركات التأمين'),
                    BtnLayout('فحص صلاحية التامين الطبي',() =>
                        Navigator.pushNamed(context, HomeScreen.routeName)),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                Expanded(child :ListView(
                  children: [
                    EditTextItem(
                        'assets/images/company.svg', 'جهة العمل'),
                    BtnLayout('انشاء حساب',() =>
                        Navigator.pushNamed(context, ButtomNavigations.routeName),),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),)
              ],
            ),
          ),

        ],

      ),
      // bottomSheet:  Image.asset(
      //   "assets/images/image1.png",
      //   fit: BoxFit.fitWidth,
      // ),
    );
  }
}
