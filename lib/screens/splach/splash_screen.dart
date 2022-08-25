import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  // static String routeName = "/splash";
  late AnimationController animation;

  late Animation<double> _fadeInFadeOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/images/background.png'),
            fit: BoxFit.fitWidth
          )
        ),
        child: Center(child: Image.asset('assets/images/logo.png',alignment: AlignmentDirectional.center)),
      ),
    );
  }
}

