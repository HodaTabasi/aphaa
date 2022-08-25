import 'package:aphaa_app/screens/main_screens/select_lang/select_language.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Screen2Splash extends StatefulWidget {
  static String routeName = "/splash";
  @override
  State<Screen2Splash> createState() => _Screen2SplashState();
}

class _Screen2SplashState extends State<Screen2Splash> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fitWidth)),
        child: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/images/logo.png',),
                SizedBox(height: 40,),
                const Text(
                  '''مـــرحـــبــًا بــكــم فــي مـــســـتـــشـــفـــى
أبــــهـــا الـــخـــاص الـــطـــبـــي''',
                  style: TextStyle(color: Color(0xff0E4C8F), fontSize: 22,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60,),
                const Text('التطور والريادة',style: TextStyle(color: Color(0xff058638), fontSize: 16,fontFamily: 'atef',fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
                const SizedBox(height: 60,),
                AvatarGlow(
                  endRadius: 35.0,
                  showTwoGlows: true,
                  glowColor: Color(0xff8CABCD),
                  animate: true,
                  curve: Curves.easeInCubic,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, SelectLanguage.routeName),
                    child: Image.asset(
                      'assets/images/icon1.png',
                      height: 50,
                    ),
                  ),
                ),
                const Spacer()
              ],
            )),
      ),
    );
  }


}
