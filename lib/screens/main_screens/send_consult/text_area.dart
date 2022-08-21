import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          maxLines: 4,
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
              hintText: AppLocalizations.of(context)!.consult_note,
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}