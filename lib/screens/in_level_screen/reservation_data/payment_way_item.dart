import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentSelectedItem extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged? onChanged;

  PaymentSelectedItem(
      {required this.title,
      this.value = 0,
      this.groupValue = 0,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        onChanged!(value);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0x209bd5b4) : Color(0x209bd5b4),
          borderRadius: BorderRadius.all(Radius.circular(13)),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.transparent),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 70,
              color: Colors.grey.withOpacity(0.23),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 60,
              height: 30,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: Text(
                  "$title",
                  style: TextStyle(
                      fontFamily: 'Tajawal', color: Colors.black, fontSize: 14),
                )),
            Opacity(
              child: Image.asset("assets/images/check.png"),
              opacity: isSelected ? 1 : 0,
            ),
          ],
        ),
      ),
    );
  }
}
