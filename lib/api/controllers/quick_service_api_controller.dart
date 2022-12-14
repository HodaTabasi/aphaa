import 'dart:convert';
import 'dart:io';

import 'package:aphaa_app/model/OpenFileResponse.dart';
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
    'doctor':"$doctors_id"
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


  Future<ApiResponse> appointment({name,email,mobile,clinic,date,time,doctor,cost}) async {
    var myData = {
      'name':"$name",
      'email':"$email",
      'mobile':"$mobile",
      'clinic':"$clinic",
      'availableDay':"$date",
      'availableTimes':"$time",
      'doctor':"$doctor",
      'cost':"$cost"
    };
    Uri uri = Uri.parse(ApiSettings.appointment);
    var response = await http.post(uri, body:myData,headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      // if(response.statusCode == 200){
      //   var jsonObject = jsonResponse['items'];
      // }
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
  Future<ApiResponse> openFile({fname,lname,gname,pname,identity_number,mobile,image,email,request_type,nationality,id_type,DOB}) async {
    Uri uri = Uri.parse(ApiSettings.openFile);
    var request = http.MultipartRequest('POST', uri);
    var file = await http.MultipartFile.fromPath('image', image);
    request.fields["Fname"] = fname;
    request.fields["Lname"] = lname;
    request.fields["Gname"] = gname;
    request.fields["Pname"] = pname;
    request.fields["identity_number"] = identity_number;
    request.fields["mobile"] = mobile;
    request.fields["email"] = email;
    request.fields["request_type"] = request_type;
    request.fields["nationality"] = nationality;
    request.fields["id_type"] = id_type;
    request.fields["DOB"] = DOB;

    request.files.add(file);
    // request.fields['KEY'] = 'VALUE';
    request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    var response = await request.send();
    // print(jsonDecode(await response.stream.transform(utf8.decoder).first));
    var body = await response.stream.transform(utf8.decoder).first;
    var jsonResponse = jsonDecode(body);
    if (response.statusCode == 201 || response.statusCode == 400 || response.statusCode == 200) {
      var apiResponse = ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
      if (response.statusCode == 200) {
        print("dfsdf");
        apiResponse.object = OpenFileResponse.fromJson(jsonResponse['items']);
      }
      return apiResponse;
    }
    return ApiResponse(
      message: jsonResponse['message'],
      success: jsonResponse['status']??false,
    );
  }
}
