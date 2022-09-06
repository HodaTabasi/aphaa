import 'dart:io';

import '../model/api_response.dart';
import '../preferences/shared_pref_controller.dart';

mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message: 'Something went wrong', success: false);

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
