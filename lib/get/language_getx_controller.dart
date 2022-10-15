import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../preferences/shared_pref_controller.dart';

class LanguageGetxController extends GetxController {
  static LanguageGetxController get to => Get.find<LanguageGetxController>();

  String? lang =
      SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name);

  Rx<String> language = SharedPrefController()
              .getValueFor<String>(key: PrefKeys.lang.name) ==
          null
      ? 'ar'.obs
      : SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)!.obs;

  void changeLanguage() {
    // language = language == 'ar'.obs ? 'en'.obs : 'ar'.obs;
    language.value = language.value == 'ar' ? 'en' : 'ar';
    SharedPrefController().changeLanguage(language: language.value);
    var locale = Locale(language.value);
    Get.updateLocale(locale);
    // language.refresh();
    print(language);
  }

  void changeEditLanguage(lang) {
    // language = language == 'ar'.obs ? 'en'.obs : 'ar'.obs;
    language.value = lang == 0 ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language: language.value);
    var locale = Locale(language.value);
    Get.updateLocale(locale);
    // language.refresh();
    print(language);
  }
}
