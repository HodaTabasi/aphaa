import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeAppoitmentItem extends StatefulWidget {

  @override
  State<TimeAppoitmentItem> createState() => _TimeAppoitmentItemState();
}

class _TimeAppoitmentItemState extends State<TimeAppoitmentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xff058638), width: 0.5),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 10),
        //     blurRadius: 70,
        //     color: Colors.grey.withOpacity(0.23),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Text('10:00 pm',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              )),
          SizedBox(
            height: 8,
          ),
          Text(AppLocalizations.of(context)!.to,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              )),
          SizedBox(
            height: 8,
          ),
          Text('12:00 pm',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.normal,
              )),

        ],
      ),
    );
  }
}
