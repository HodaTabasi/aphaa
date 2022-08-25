import 'package:flutter/material.dart';

class MyPaymentTextFeild extends StatelessWidget {

  String hint ;
  double h;
  MyPaymentTextFeild(this.hint,this.h);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: h,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(0xff0E4C8F), width: 0.3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(0xff0E4C8F), width: 0.3),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,
              )),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
