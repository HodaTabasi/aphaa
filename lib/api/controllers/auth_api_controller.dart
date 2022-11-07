import 'dart:convert';
import 'dart:io';

import 'package:aphaa_app/model/Patient.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../preferences/shared_pref_controller.dart';
import '../api_helper.dart';
import '../api_settings.dart';

class AuthApiController with ApiHelper {
  Future<ApiResponse> register({Patient? student,flag = false}) async {
    // print(student);
    // print(student!.payingType);
    // print(student.identityNumber);
    // print(student.Employer);
    // print(student.p_code);
    // print(student.insuranceNumber);
    // print(student.insuranceDate);
    // print(student.insuranceName);
    // {
    //   'first_name': student.firstName,
    // 'second_name': student.secondName,
    // 'third_name': student.thirdName,
    // 'last_name': student.lastName,
    // 'identity_number': student.identityNumber,
    // 'mobile': student.mobile,
    // 'patient_type': student.patientType,
    // 'paying_type': student.payingType,
    // 'insurance_number': student.insuranceNumber,
    // 'insurance_date': student.insuranceDate,
    // 'insurance_name': student.insuranceName,
    // 'email': student.email,
    // 'password': student.password,
    // 'password_confirm': student.password,
    // }

    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: flag?student?.cashToJson():student?.toJson(), headers: headersWithOutToken);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['items'];
        Patient student = Patient.fromJson(jsonObject);
        SharedPrefController().save(student: student);
        SharedPrefController().setValuePCode(pCode: jsonObject["p_code"]);
      }
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']??false);
    }
    return failedResponse;
  }

  Future<ApiResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'password': password,
    });
    print(response);

    if (response.statusCode == 200 || response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['items'];
        Patient student = Patient.fromJson(jsonObject);
        SharedPrefController().setPassword(password);
        SharedPrefController().save(student: student);
        SharedPrefController().setValuePCode(pCode:student.p_code!);
      }
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().clear();
      if(response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
      }else {
        return  ApiResponse(message: SharedPrefController().getValueFor(key: PrefKeys.lang.name) == 'ar'?'تسجيل الدخول بنجاح':'Logged out successfully', success: true);
      }
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: response.statusCode == 200
            ? jsonResponse['message']
            : 'Logged out successfully',
        success: true,
      );
    }
    return failedResponse;
  }

  //Forget Password - Reset Password
  Future<ApiResponse> changePassword(
      {required String password, required String rePassword}) async {
    var myData = {
      'current_password': SharedPrefController().password,
      'password': password,
      'password_confirmation': rePassword
    };
    Uri uri = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(uri, body: myData,headers: headers);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      print('Code: ${jsonResponse['code']}');
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

Future<ApiResponse> resetPassword(
    {mobile,required String password, required String rePassword}) async {
  Uri uri = Uri.parse(ApiSettings.resetPassword);
  var response = await http.post(uri,body: {
    'mobile':mobile,
    'password':password,
    'password_confirmation': rePassword,
  });

  if(response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
  }
  return failedResponse;
}
}
