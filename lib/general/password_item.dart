import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordItem extends StatefulWidget {
  String icon;
  String value;
  PasswordItem(this.icon,this.value);

  @override
  State<PasswordItem> createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {
  var isVisable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0E4C8F), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: SvgPicture.asset(widget.icon,
                  semanticsLabel: 'Acme Logo'),
            ),
            const VerticalDivider(
                width: 2, thickness: 0.5, color: Color(0xff0E4C8F)),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.value,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: isVisable
                            ? InkWell(
                            onTap: () {
                              setState(() {
                                isVisable = !isVisable;
                              });
                            },
                            child: Icon(
                              Icons.visibility,
                              color: Color(0xff058638),
                            ))
                            : InkWell(
                          onTap: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          child: Icon(Icons.visibility_off,
                              color: Color(0xff058638)),
                        )),
                    obscureText: true,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
