import 'dart:io';

import '../model/api_response.dart';
import '../preferences/shared_pref_controller.dart';

mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message: SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'ar'?'حصل خطا ما':'Something went wrong', success: false);

  ApiResponse get successResponce => ApiResponse(message:SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'ar'?'تمت العملية بنجاح':'accomplished Successfully',success: true);

  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  Map<String, String> get headersWithOutToken {
    return {
      // HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }
}
