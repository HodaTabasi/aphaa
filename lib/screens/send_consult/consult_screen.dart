import 'package:flutter/material.dart';

class SendConsultScreen extends StatefulWidget {

  @override
  State<SendConsultScreen> createState() => _SendConsultScreenState();
}

class _SendConsultScreenState extends State<SendConsultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 90,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          // padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xff006F2C),
              borderRadius: BorderRadius.circular(10)),
          child: const Text(
            "العربية",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
