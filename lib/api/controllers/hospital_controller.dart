import 'dart:async';
import 'dart:convert';

import 'package:aphaa_app/api/api_settings.dart';
import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/model/Appointments.dart';
import 'package:aphaa_app/model/AvailableTime.dart';
import 'package:aphaa_app/model/FamillyMember.dart';
import 'package:aphaa_app/model/LeaveDetail.dart';
import 'package:aphaa_app/model/PrescriptionListItems.dart';
import 'package:aphaa_app/model/SickLeaves.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/model/vitalSignsDils.dart';
import '../../model/ApprovalItem.dart';
import '../../model/Approvals.dart';
import '../../model/Clinic.dart';
import '../../model/ServiceTest.dart';
import '../../model/prescriptionList.dart';
import '../../model/vitalSign.dart';
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

  Future<List<SickLeaves>> getSickLeaves({patientCode}) async {
    final queryParameters = {
      'patientCode': '0/37416',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}sickLeaves', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['leaves'] as List;
      return jsonArray.map((jsonObject) => SickLeaves.fromJson(jsonObject)).toList();
    }
    return [];

  }

  Future<List<LeaveDetail>> getSickLeaveDtl({leaveId}) async {
    final queryParameters = {
      'leaveId': '$leaveId',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}sickLeaveDtl', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['leaveDetail'] as List;
      return jsonArray.map((jsonObject) => LeaveDetail.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Approvals>> getSrvApvl({patientCode}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}srvApvl', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['approvals'] as List;
      return jsonArray.map((jsonObject) => Approvals.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<ApprovalItem>> getSrvApvlDtl({reqId}) async {
    final queryParameters = {
      'reqId': '$reqId',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}srvApvlDtl', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['approvalItems'] as List;
      return jsonArray.map((jsonObject) => ApprovalItem.fromJson(jsonObject)).toList();
    }
    return [];

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
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['doctors'] as List;
      return jsonArray.map((jsonObject) => Doctor.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<VitalSign>> getPtVS() async {
    final queryParameters = {
      'patientCode': '0/32230',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtVS', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['vitalSigns'] as List;
      return jsonArray.map((jsonObject) => VitalSign.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<VitalSignDtils>> getPtVSDtl({vitalSignId}) async {
    final queryParameters = {
      'vitalSignId': '$vitalSignId',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };
    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtVSDtl', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['vitalSigns'] as List;
      return jsonArray.map((jsonObject) => VitalSignDtils.fromJson(jsonObject)).toList();
    }
    return [];

  }

  getPtElg({patientId}) async {
    final queryParameters = {
      'patientId': '$patientId',
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

  Future<List<String>> getDoctorSched({clinicCode,doctorCode}) async {
    final queryParameters = {
      'clinicCode':'$clinicCode',
      'doctorCode':'$doctorCode',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase2}DoctorSched', queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['availableDays'] as List;
      return jsonArray.map((jsonObject) {
        String s =jsonObject['availableDay'];
        return s;
      }).toList();
    }
    return [];
  }

  Future<List<AvailableTime>> getDoctorSchedDtl({clinicCode, doctorCode,availableDay}) async {

    final queryParameters = {
      'clinicCode':'$clinicCode',
      'doctorCode':'$doctorCode',
      'availableDay':'${availableDay.toString().split(" ").first}',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang': 'AR',
    };

    final uri =
    Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase2}DoctorSchedDtl', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['availableTimes'] as List;
      NewAccountGetxController.to.changeDoctorTimeList(jsonArray.map((jsonObject) =>AvailableTime.fromJson(jsonObject)).toList());
    }
    return [];
  }
}