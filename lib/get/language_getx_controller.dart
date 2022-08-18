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
    language.value = language.value == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language: language.value);
    // notifyListeners();
  }
}
