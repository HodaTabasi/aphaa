import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(0xff0E4C8F), width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(0xff0E4C8F), width: 0.5),
              ),
              hintText: 'رقم الاقامة',
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
