import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Screen2Splash extends StatelessWidget {
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
            Spacer(),
            Image.asset('assets/images/logo.png',),
            SizedBox(height: 40,),
            Text(
              '''مـــرحـــبــًا بــكــم فــي مـــســـتـــشـــفـــى
أبــــهـــا الـــخـــاص الـــطـــبـــي''',
              style: TextStyle(color: Color(0xff0E4C8F), fontSize: 22,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60,),
            Text('التطور والريادة',style: TextStyle(color: Color(0xff058638), fontSize: 16,fontFamily: 'atef',fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
            SizedBox(height: 60,),
            AvatarGlow(
              endRadius: 35.0,
              showTwoGlows: true,
              glowColor: Color(0xff8CABCD),
              animate: true,
              curve: Curves.easeInCubic,
              child: Image.asset(
                    'assets/images/icon1.png',
                    height: 50,
                  ),
            ),
            Spacer()
          ],
        )),
      ),
    );
  }
}
