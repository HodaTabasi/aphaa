import 'package:aphaa_app/screens/select_lang/selected_item.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLanguage extends StatefulWidget {
  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  var _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/logo.png',
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                AppLocalizations.of(context)!.q1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SelectedItem(
                  title: AppLocalizations.of(context)!.ar,
                  value: 0,
                  groupValue: _value,
                  onChanged: (value) => setState(() => _value = value)),
              SelectedItem(
                  title: AppLocalizations.of(context)!.en,
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) => setState(() => _value = value)),
              const SizedBox(
                height: 30,
              ),
              AvatarGlow(
                endRadius: 35.0,
                showTwoGlows: true,
                glowColor: const Color(0xff8CABCD),
                animate: true,
                curve: Curves.easeInCubic,
                child: Image.asset(
                  'assets/images/icon1.png',
                  height: 50,
                ),
              ),
              const Spacer()
            ],
          ),
          Positioned(
            child: Image.asset(
              "assets/images/image1.png",
              fit: BoxFit.fitWidth,
            ),
            bottom: 0,
          )
        ],
      ),
    );
  }
}
