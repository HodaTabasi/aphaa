import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DropDownItem extends StatefulWidget {
  List<String> myData;
  String iconName;
  String dropValue;

  DropDownItem(this.myData,this.iconName,this.dropValue);

  @override
  State<DropDownItem> createState() => _DropDownItenState();
}

class _DropDownItenState extends State<DropDownItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0E4C8F),width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child:   SvgPicture.asset(
                  widget.iconName,
                  semanticsLabel: 'Acme Logo'
              ),
            ),
            const VerticalDivider(
                width:2,
                thickness:0.5,
                color:Color(0xff0E4C8F)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(
                    widget.dropValue,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 13,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // value: dropdownValue,
                  items: widget.myData.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                          value,
                          style:  TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff058638),
                  ),
                  onChanged: (val) {
                    setState(() {
                      // dropdownValue = val!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
