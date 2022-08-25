import 'package:aphaa_app/screens/drawer_screens/profile/items.dart';
import 'package:aphaa_app/screens/drawer_screens/profile/notificaton_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {

  static String routeName = "/profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text('الملف الشخصي',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        centerTitle: true,
        // leading: Container(
        //     margin: const EdgeInsets.all(15.0),
        //     padding: const EdgeInsets.all(5.0),
        //     // alignment: Alignment.bottomLeft,
        //     // width: 80,
        //     // height: 500,
        //     decoration: BoxDecoration(
        //         color: const Color(0xff006F2C),
        //         borderRadius: BorderRadius.circular(5)),
        //     child: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.white,
        //       size: 15,
        //     )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color:  Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                ),

              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('محمد محمود',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),textAlign: TextAlign.center,),
          Text('#2031456',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              ),textAlign: TextAlign.center,), SizedBox(
            height: 20,
          ),
          TextItem('assets/images/EditSquare.svg','تعديل الملف الشخصي'),
          TextItem('assets/images/pagemetrecord.svg','سجل المدفوعات'),
          TextItem('assets/images/editf.svg','تعديل بيانات التأمين'),
          TextItem('assets/images/Lock.svg','تغيير كلمة المرور'),
          NotificationItem('assets/images/Notification.svg', 'الإشعارات'),
          TextItem('assets/images/Logout.svg','تسجيل خروج',isVisable: true,),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DecoratedBox(decoration: BoxDecoration(
              color: Color(0xff1E934C),
              borderRadius: BorderRadius.circular(8),
            ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                        'assets/images/youtube.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/inata.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/facebook.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/twetter.svg',
                        semanticsLabel: 'Acme Logo'
                    ),
                    SvgPicture.asset(
                        'assets/images/site.svg',
                        semanticsLabel: 'Acme Logo'
                    )
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
