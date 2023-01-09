import 'dart:convert';

import 'package:aphaa_app/model/Patient.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/model/offer.dart';
import 'package:http/http.dart' as http;

import '../../get/change_name_getx_controller.dart';
import '../../model/SocialContact.dart';
import '../../model/api_response.dart';
import '../../preferences/shared_pref_controller.dart';
import '../api_helper.dart';
import '../api_settings.dart';

class AppApiController with ApiHelper {

  Future<List<SocialContact>> getAllContact() async {
    Uri uri = Uri.parse(ApiSettings.allContact);
    var response = await http.get(uri, headers: headersWithOutToken);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['items'] as List;
        return jsonArray.map((jsonObject) => SocialContact.fromJson(jsonObject))
            .toList();
      }
    }
    return [];
  }

  Future<List<Offers>> getOffers() async {
    Uri uri = Uri.parse(ApiSettings.showOffers);
    var response = await http.get(uri, headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['items'] as List;
        return jsonArray.map((jsonObject) => Offers.fromJson(jsonObject))
            .toList();
      }
    }
    return [];
  }

  Future<Patient> getProfile() async {
    Uri uri = Uri.parse(ApiSettings.getProfile);
    var response = await http.get(uri, headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['items'];
        Patient patient = Patient.fromJson(jsonObject);
        return patient;
      }
    }
    return Patient();
  }

  Future<ApiResponse> editProfile(Patient patient,{flag,insuranceFlag = false}) async {
    // print(patient?.email);
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
    Uri uri = Uri.parse(ApiSettings.editProfile);
    var response;
   response =  insuranceFlag ? await http.put(uri, body:patient.insuranceDataToJson(),headers: headers)
    :  await http.put(uri, body:patient.editProfileToJson(flag),headers: headers);


    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200){
        var jsonObject = jsonResponse['items'];
        Patient student = Patient.fromJson(jsonObject);
        SharedPrefController().saveWithoutToken(student: student);
        ChangeGetxController.to.changeName(student.firstName, student.lastName);
      }
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<List<Doctor>> getAllDoctors() async {
    Uri uri = Uri.parse(ApiSettings.getAllDoctors);
    var response = await http.get(uri, headers: headersWithOutToken);

    print("fgf ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['items'] as List;
        return jsonArray.map((jsonObject) => Doctor.fromJson(jsonObject))
            .toList();
      }
    }
    return [];
  }

  Future<Doctor> getOneDoctor(id) async {
    Uri uri = Uri.parse(ApiSettings.getOnDoctor.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri, headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['items'];
        Doctor doctor = Doctor.fromJson(jsonObject);
        return doctor;
      }
    }
    return Doctor();
  }
}
