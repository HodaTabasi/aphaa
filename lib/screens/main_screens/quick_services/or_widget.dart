
import 'package:flutter/material.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xFF0D2784),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      alignment: Alignment.center,
      child: Text(
        AppLocalizations.of(context)!.or,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
