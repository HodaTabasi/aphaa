import 'dart:async';
import 'dart:convert';

import 'package:aphaa_app/api/api_settings.dart';
import 'package:aphaa_app/model/Appointments.dart';
import 'package:aphaa_app/model/FamillyMember.dart';
import 'package:aphaa_app/model/PrescriptionListItems.dart';
import 'package:aphaa_app/model/doctor.dart';
import '../../model/Clinic.dart';
import '../../model/ServiceTest.dart';
import '../../model/prescriptionList.dart';
import '../api_helper.dart';
import 'package:http/http.dart' as http;

class HospitalApiController with ApiHelper {

  Future<List<FamillyMember>> getFamilyMembers(patientCode) async {
    print(patientCode);
    final queryParameters = {
      'patientCode': '$patientCode',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}familyMembers', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['familyMembers'] as List;
      return jsonArray.map((jsonObject) => FamillyMember.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<ServiceTest>> getLabReports() async {
    final queryParameters = {
      'patientCode': '0/372081',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}labReports', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['services'] as List;
      return jsonArray.map((jsonObject) => ServiceTest.fromJson(jsonObject)).toList();
    }
    return [];

  }

  getRadReports() async {
    final queryParameters = {
      'patientCode': '0/372081',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}radReports', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  Future<List<Appointments>> getNextAppt({patientCode}) async {
    final queryParameters = {
      'patientCode': '0/32230',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}nextAppt', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['myNextAppointments'] as List;
      return jsonArray.map((jsonObject) => Appointments.fromJson(jsonObject)).toList();
    }
    return [];

  }

  Future<List<Appointments>> getPrevAppt({patientCode}) async {
    final queryParameters = {
      'patientCode': '0/32230',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}prevAppt', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['myPrevAppointments'] as List;
      return jsonArray.map((jsonObject) => Appointments.fromJson(jsonObject)).toList();
    }
    return [];

  }

  Future<List<prescriptionList>> getRxList({patientCode}) async {
    final queryParameters = {
      'patientCode': '0/32230',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}rxList', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['prescriptionList'] as List;
      return jsonArray.map((jsonObject) => prescriptionList.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<PrescriptionListItems?> getRxItems({invoiceNo,invoiceDate,invoiceType}) async {
    final queryParameters = {
      'invoiceNo': '3926',
      'invoiceDate': '2020-12-21',
      'invoiceType': '1',
      'pageNo': '1',
      'offset': '1',
      'rows': '5',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}rxItems', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse;
        PrescriptionListItems prescriptionListItems = PrescriptionListItems.fromJson(jsonObject);
        return prescriptionListItems;
      }
    }
    return null;

  }

  getSickLeaves() async {
    final queryParameters = {
      'patientCode': '0/32230',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}sickLeaves', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  getSickLeaveDtl() async {
    final queryParameters = {
      'leaveId': '172',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}sickLeaveDtl', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }
  }

  getSrvApvl() async {
    final queryParameters = {
      'patientCode': '0/7702',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}srvApvl', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  getSrvApvlDtl() async {
    final queryParameters = {
      'reqId': '90008',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}srvApvl', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  Future<List<Doctor>> getVisitedDrs() async {
    final queryParameters = {
      'patientCode': '0/32230',
      'pageNo': '1',
      'offset': '1',
      'rows': '5',
      'lang': 'AR',
    };

    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}visitedDrs', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['doctors'] as List;
      return jsonArray.map((jsonObject) => Doctor.fromJson(jsonObject)).toList();
    }
    return [];
  }

  getPtVS() async {
    final queryParameters = {
      'patientCode': '90008',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtVS', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  getPtVSDtl() async {
    final queryParameters = {
      'vitalSignId': '2021-10-1000112511',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtVSDtl', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  getPtElg() async {
    final queryParameters = {
      'patientId': '2320128214',
      'lang': 'AR',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtElg', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  //تحميل ملفات
  getPdfFile() async {
    final queryParameters = {
      'patientCode': '0/372081',
      'serviceType': 'lab-test',
      'clinicCode': '25',
      'fileName': '89_02072020_2_0033610_02072020100255.pdf',
    };
    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtVSDtl', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  //////////// بيانات الدكتور ///////

  Future<List<Doctor>>getClDrs({clinicCode}) async {
    final queryParameters = {
      'clinicCode': '$clinicCode',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase3}clDrs', queryParameters);

    print(uri);
    final response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonArray = jsonResponse['doctors'] as List;
      return jsonArray.map((jsonObject) => Doctor.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<Clinic>?> getClList() async {
    final queryParameters = {
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    // 'http://aiph.me:8000/api/clinic/clList?pageNo=1&offset=1&rows=5&lang=AR'
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase3}clList', queryParameters);
    print(uri);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['clinics'] as List;
        return jsonArray.map((jsonObject) => Clinic.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
  }

  Future<Doctor?> getDoctorDtl({doctorCode}) async {
    final queryParameters = {
      'doctorCode': '1',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase2}DoctorDtl', queryParameters);
    final response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Doctor.fromJson(jsonResponse);
    }
    return null;

  }

  getDoctorSched() async {
    final queryParameters = {
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase2}DoctorSched', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

  getDoctorSchedDtl() async {
    final queryParameters = {
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.https(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase2}DoctorSchedDtl', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      print("gggf");
    }

  }

}