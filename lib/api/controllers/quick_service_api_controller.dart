import 'dart:convert';
import 'dart:io';

import 'package:aphaa_app/model/Patient.dart';
import 'package:http/http.dart' as http;

import '../../model/api_response.dart';
import '../../preferences/shared_pref_controller.dart';
import '../api_helper.dart';
import '../api_settings.dart';

class QuickServiceApiController with ApiHelper {

  Future<ApiResponse> consultation({name,email,mobile,clinic,description,doctors_id}) async {
    var myData = {
    'name':"$name",
    'email':"$email",
    'mobile':"$mobile",
    'clinic':"$clinic",
    'description':"$description",
    'doctors_id':"$doctors_id"
    };
    Uri uri = Uri.parse(ApiSettings.consultation);
    var response = await http.post(uri, body:myData,headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200){
        var jsonObject = jsonResponse['items'];
      }
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }


  Future<ApiResponse> appointment({name,email,mobile,clinic,date,time,doctor}) async {
    var myData = {
      'name':"$name",
      'email':"$email",
      'mobile':"$mobile",
      'clinic':"$clinic",
      'date':"$date",
      'time':"$time",
      'doctors_id':"$doctor"
    };
    Uri uri = Uri.parse(ApiSettings.appointment);
    var response = await http.post(uri, body:myData,headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200){
        var jsonObject = jsonResponse['items'];
      }
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }
/*
*name:lyan hsan foud alrook
identity_number:1101
mobile:0593658701
paying_type:cash
insurance_number:2520
* */

  // Future<ApiResponse> upload({required String path}) async {
  //   //FORM DATA - MULTI PART REQUEST
  //   Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
  //   var request = http.MultipartRequest('POST', uri);
  //   var file = await http.MultipartFile.fromPath('image', path);
  //   request.files.add(file);
  //   // request.fields['KEY'] = 'VALUE';
  //   request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
  //   request.headers[HttpHeaders.acceptHeader] = 'application/json';
  //   var response = await request.send();
  //
  //   if (response.statusCode == 201 || response.statusCode == 400) {
  //     var body = await response.stream.transform(utf8.decoder).first;
  //     var jsonResponse = jsonDecode(body);
  //     var apiResponse = ApiResponse<StudentImage>(
  //       message: jsonResponse['message'],
  //       success: jsonResponse['status'],
  //     );
  //     if (response.statusCode == 201) {
  //       var image = StudentImage.fromJson(jsonResponse['object']);
  //       apiResponse.object = image;
  //     }
  //     return apiResponse;
  //   }
  //   return ApiResponse<StudentImage>(
  //     message: 'Something went wrong',
  //     success: false,
  //   );
  // }
  Future<ApiResponse> openFile({name,identity_number,mobile,paying_type,insurance_number,image}) async {
    Uri uri = Uri.parse(ApiSettings.openFile);
    var request = http.MultipartRequest('POST', uri);
    var file = await http.MultipartFile.fromPath('image', image);
    request.fields["name"] = name;
    request.fields["identity_number"] = identity_number;
    request.fields["mobile"] = mobile;
    request.fields["paying_type"] = paying_type;
    request.fields["insurance_number"] = insurance_number;

    request.files.add(file);
    // request.fields['KEY'] = 'VALUE';
    request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    var response = await request.send();

    if (response.statusCode == 201 || response.statusCode == 400 || response.statusCode == 200) {
      var body = await response.stream.transform(utf8.decoder).first;
      var jsonResponse = jsonDecode(body);
      var apiResponse = ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
      if (response.statusCode == 201) {
        apiResponse.object = image;
      }
      return apiResponse;
    }
    return ApiResponse(
      message: 'Something went wrong',
      success: false,
    );
  }
}
