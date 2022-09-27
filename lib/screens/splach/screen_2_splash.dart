import 'package:aphaa_app/screens/main_screens/select_lang/select_language.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/SizeConfig.dart';

import '../../helper/SizeConfig.dart';

class Screen2Splash extends StatefulWidget {
  static String routeName = "/splash";
  @override
  State<Screen2Splash> createState() => _Screen2SplashState();
}

class _Screen2SplashState extends State<Screen2Splash> with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: false);

  bool play = false;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration(milliseconds: 500),() {
      play = true;
      setState(() {
      });
    },);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fitWidth)),
        child: Center(
            child: Stack(
              children: [
                // const Spacer(),
                AnimatedPositioned(
                  height: play?MediaQuery.of(context).size.height/0.9 : 0,
                  left: 0,
                  right: 0,
                  bottom: play?100:0,
                  duration: Duration(milliseconds: 1200),
                    curve: Curves.easeInOut,
                    child: Image.asset('assets/images/logo.png',)),
                // SizedBox(height: 40.h,),
                AnimatedPositioned(
                  height: play?MediaQuery.of(context).size.height/2.6 : 0,
                  left: 0,
                  right: 0,
                  bottom: play?100:0,
                  duration: Duration(milliseconds: 1300),
                  curve: Curves.easeInOut,
                  child: Text(
                    '''مـــرحـــبــًا بــكــم فــي مـــســـتـــشـــفـــى
أبــــهـــا الـــخـــاص الـــطـــبـــي''',
                    style: TextStyle(color: Color(0xff0E4C8F), fontSize: 22.sp
                        ,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(height: 60.h,),
                AnimatedPositioned(
                  height: play?MediaQuery.of(context).size.height/3.4 : 0,
                  left: 0,
                  right: 0,
                  bottom: play?100:0,
                  duration: Duration(milliseconds: 1400),
                  curve: Curves.easeInOut,
                  child: Text('التطور والريادة',style: TextStyle(color: Color(0xff058638), fontSize: 16.sp,fontFamily: 'atef',fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),
                ),
                // SizedBox(height: 60.h,),
                AnimatedPositioned(
                  height: play?MediaQuery.of(context).size.height/2.7 : 0,
                  left: 0,
                  right: 0,
                  bottom: play?50:0,
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.easeInCubic,
                  child: AvatarGlow(
                    endRadius: 35.0.r,
                    showTwoGlows: true,
                    glowColor: Color(0xff8CABCD),
                    animate: true,
                    curve: Curves.easeInCubic,
                    child: InkWell(
                      onTap: () => Navigator.pushReplacementNamed(context, SelectLanguage.routeName),
                      child: Image.asset(
                        'assets/images/icon1.png',
                        height: 50.h,
                      ),
                    ),
                  ),
                ),
//                 const Spacer()
              ],
            )),
      ),
    );
  }



//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/background.png'),
//                 fit: BoxFit.fitWidth)),
//         child: Center(
//             child: Column(
//               children: [
//                 const Spacer(),
//                 Image.asset('assets/images/logo.png',),
//                 SizedBox(height: 40.h,),
//                  Text(
//                   '''مـــرحـــبــًا بــكــم فــي مـــســـتـــشـــفـــى
// أبــــهـــا الـــخـــاص الـــطـــبـــي''',
//                   style: TextStyle(color: Color(0xff0E4C8F), fontSize: 22.sp
//                       ,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                  SizedBox(height: 60.h,),
//                  Text('التطور والريادة',style: TextStyle(color: Color(0xff058638), fontSize: 16.sp,fontFamily: 'atef',fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,),
//                  SizedBox(height: 60.h,),
//                 AvatarGlow(
//                   endRadius: 35.0.r,
//                   showTwoGlows: true,
//                   glowColor: Color(0xff8CABCD),
//                   animate: true,
//                   curve: Curves.easeInCubic,
//                   child: InkWell(
//                     onTap: () => Navigator.pushReplacementNamed(context, SelectLanguage.routeName),
//                     child: Image.asset(
//                       'assets/images/icon1.png',
//                       height: 50.h,
//                     ),
//                   ),
//                 ),
//                 const Spacer()
//               ],
//             )),
//       ),
//     );
//   }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

}
