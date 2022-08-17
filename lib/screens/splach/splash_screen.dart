import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

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

