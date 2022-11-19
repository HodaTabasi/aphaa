import 'dart:async';
import 'dart:convert';

import 'package:aphaa_app/api/api_settings.dart';
import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/model/Eligibility.dart';
import 'package:aphaa_app/model/SickLeaves/SickLeavesResponse.dart';
import 'package:aphaa_app/model/VisitedDrs/VisitedDrsResponse.dart';
import 'package:aphaa_app/model/SickLeaves/LeaveDetail.dart';
import 'package:aphaa_app/model/allDocResponse.dart';
import 'package:aphaa_app/model/prescriptionListResponse/PrescriptionListItems.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/model/familly/FamillyResponse.dart';
import '../../model/Appointment/AppointmentResponse.dart';
import '../../model/ApprovalsResponse/ApprovalItem.dart';
import '../../model/ApprovalsResponse/ApprovalsResponse.dart';
import '../../model/Clinic.dart';
import '../../model/InsuranceCompany.dart';
import '../../model/billResponse.dart';
import '../../model/lab_rad_result/LabReportsResponse.dart';
import '../../model/VitalSign/VitalSignResponse.dart';
import '../../model/VitalSign/vitalSignsDils.dart';
import '../../model/api_response.dart';
import '../../model/patent_payment_record/PaymentRecordResponse.dart';
import '../../model/prescriptionListResponse/PrescriptionListResponse.dart';
import '../../model/time_avilable_response/TimeAvilableResponse.dart';
import '../../preferences/shared_pref_controller.dart';
import '../api_helper.dart';
import 'package:http/http.dart' as http;
import '../../model/getPDF.dart';

class HospitalApiController with ApiHelper {
  // Future<List<FamilyMember>> getFamilyMembers(patientCode) async {
  //   print(patientCode);
  //   final queryParameters = {
  //     // 'patientCode': '$patientCode',
  //     'patientCode': '0/372081',
  //     'pageNo': '1',
  //     'offset': '1',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}familyMembers', queryParameters);
  //   final response = await http.get(uri);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['familyMembers'] as List;
  //     return jsonArray.map((jsonObject) => FamilyMember.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  // }

  Future<FamillyResponse?> getFamilyMembers(
      {patientCode, page = 1, offset = 1}) async {
    print(patientCode);
    final queryParameters = {
       'patientCode': '$patientCode',
      // 'patientCode': '0/372081',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}familyMembers', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['familyMembers'] as List;
      return FamillyResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<LabReportsResponse?> getLabReports(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
       'patientCode': '$patientCode',
      // 'patientCode': '0/372081',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}labReports', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return LabReportsResponse.fromJson(jsonResponse);
      // var jsonResponse = jsonDecode(response.body);
      // var jsonArray = jsonResponse['services'] as List;
      // return jsonArray
      //     .map((jsonObject) => ServiceTest.fromJson(jsonObject))
      //     .toList();
    }
    return null;
  }

  Future<LabReportsResponse?> getRadReports(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
       'patientCode': '$patientCode',
      // 'patientCode': '0/372081',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}radReports', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return LabReportsResponse.fromJson(jsonResponse);
      // var jsonResponse = jsonDecode(response.body);
      // var jsonArray = jsonResponse['services'] as List;
      // return jsonArray
      //     .map((jsonObject) => ServiceTest.fromJson(jsonObject))
      //     .toList();
    }
    return null;
  }

  // Future<List<Appointments>> getNextAppt({patientCode,page = 1,offset = 1}) async {
  //   final queryParameters = {
  //     // 'patientCode': '$patientCode',
  //     'patientCode': '0/32230',
  //     'pageNo': '$page',
  //     'offset': '$offset',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}nextAppt', queryParameters);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['myNextAppointments'] as List;
  //     return jsonArray.map((jsonObject) => Appointments.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  //
  // }

  Future<AppointmentResponse?> getNextAppt(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      //'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang': SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}nextAppt', queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return AppointmentResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<AppointmentResponse?> getPrevAppt(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
       'patientCode': '$patientCode',
      //'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang': SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}prevAppt', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return AppointmentResponse.fromJson(jsonResponse);
    }
    return null;
  }

  // Future<List<Appointments>> getPrevAppt({patientCode,page = 1,offset = 1}) async {
  //   final queryParameters = {
  //     'patientCode': '$patientCode',
  //     // 'patientCode': '0/32230',
  //     'pageNo': '1',
  //     'offset': '1',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}prevAppt', queryParameters);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['myPrevAppointments'] as List;
  //     return jsonArray.map((jsonObject) => Appointments.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  //
  // }

  // Future<List<prescriptionList>> getRxList({patientCode,page = 1,offset = 1}) async {
  //   final queryParameters = {
  //     'patientCode': '$patientCode',
  //     // 'patientCode': '0/32230',
  //     'pageNo': '1',
  //     'offset': '1',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}rxList', queryParameters);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['prescriptionList'] as List;
  //     return jsonArray.map((jsonObject) => prescriptionList.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  // }

  Future<PrescriptionListResponse?> getRxList(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
       'patientCode': '$patientCode',
      // 'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}rxList', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return PrescriptionListResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<PrescriptionListItems?> getRxItems(
      {invoiceNo, invoiceDate, invoiceType,page,offset}) async {
    print(" $invoiceDate $invoiceNo $invoiceType");
    final queryParameters = {
      'invoiceNo': '$invoiceNo',
       // 'invoiceNo': '5995',
      'invoiceDate': '$invoiceDate',
      // 'invoiceDate': '2022-09-22',
      'invoiceType': '$invoiceType',
      // 'invoiceType': '1',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}rxItems', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse;
        PrescriptionListItems prescriptionListItems =
            PrescriptionListItems.fromJson(jsonObject);
        return prescriptionListItems;

      }
    }
    return null;
  }

  Future<SickLeavesResponse?> getSickLeaves(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/37416',
      'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}sickLeaves', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return SickLeavesResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<List<LeaveDetail>> getSickLeaveDtl({leaveId}) async {
    final queryParameters = {
      'leaveId': '$leaveId',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}sickLeaveDtl', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['leaveDetail'] as List;
      return jsonArray
          .map((jsonObject) => LeaveDetail.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  // Future<List<Approvals>> getSrvApvl({patientCode,page = 1,offset = 1}) async {
  //   final queryParameters = {
  //     'patientCode': '0/7702',
  //     // 'patientCode': '$patientCode',
  //     'pageNo': '$page',
  //     'offset': '$offset',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}srvApvl', queryParameters);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['approvals'] as List;
  //     return jsonArray.map((jsonObject) => Approvals.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  // }

  Future<ApprovalsResponse?> getSrvApvl(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/7702',
       'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}srvApvl', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApprovalsResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<List<ApprovalItem>> getSrvApvlDtl({reqId}) async {
    final queryParameters = {
      'reqId': '$reqId',
      'pageNo': '1',
      'offset': '1',
      'rows': '100',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}srvApvlDtl', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['approvalItems'] as List;
      return jsonArray
          .map((jsonObject) => ApprovalItem.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  // Future<List<Doctor>> getVisitedDrs({patientCode,page = 1,offset = 1}) async {
  //   final queryParameters = {
  //     // 'patientCode': '$patientCode',
  //     'patientCode': '0/32230',
  //     'pageNo': '$page',
  //     'offset': '$offset',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}visitedDrs', queryParameters);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['doctors'] as List;
  //     return jsonArray.map((jsonObject) => Doctor.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  // }

  Future<VisitedDrsResponse?> getVisitedDrs(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      // 'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}visitedDrs', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return VisitedDrsResponse.fromJson(jsonResponse);
    }
    return null;
  }

  // Future<List<VitalSign>> getPtVS({patientCode,page = 1,offset = 1}) async {
  //   final queryParameters = {
  //     'patientCode': '0/32230',
  //     // 'patientCode': '$patientCode',
  //     'pageNo': '$page',
  //     'offset': '$offset',
  //     'rows': '7',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase1}PtVS', queryParameters);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['vitalSigns'] as List;
  //     return jsonArray.map((jsonObject) => VitalSign.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  // }

  Future<VitalSignResponse?> getPtVS(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/32230',
       'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}PtVS', queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return VitalSignResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<List<VitalSignDtils>> getPtVSDtl({vitalSignId}) async {
    final queryParameters = {
      'vitalSignId': '$vitalSignId',
      'pageNo': '1',
      'offset': '1',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}PtVSDtl', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['vitalSigns'] as List;
      return jsonArray
          .map((jsonObject) => VitalSignDtils.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<InsuranceCompany>> getInsuranceCompany() async {
    final queryParameters = {
      'lang':
      SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}compList', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['companies'] as List;
      print(jsonArray);
      return jsonArray
          .map((jsonObject) => InsuranceCompany.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<PaymentRecordResponse?> getPatientpayment({patientCode,page = 1,offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/595907',
      'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang': SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase4}ptPymt', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return PaymentRecordResponse.fromJson(jsonResponse);
      // var jsonResponse = jsonDecode(response.body);
      // var jsonArray = jsonResponse['invoices'] as List;
      // print(jsonArray);
      // return jsonArray
      //     .map((jsonObject) => PatientPaymentRecord.fromJson(jsonObject))
      //     .toList();
    }
    return null;
  }



  Future<Eligibility?> getPtElg({patientId}) async {
    final queryParameters = {
      'patientId': '$patientId',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}PtElg', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse;
        Eligibility eligibility = Eligibility.fromJson(jsonObject);
        return eligibility;
      }
    }
    return null;
  }

  //تحميل ملفات
  getPdfFile({patientCode,serviceType,clinicCode,fileName}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      // 'patientCode': '0/372081',
      'serviceType': '$serviceType',
      'clinicCode': '$clinicCode',
      'fileName': '$fileName',
    };
    print(queryParameters);
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}pdfFile', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return PdfClass.fromJson(jsonResponse['pdfFile']);
    }
  }

  //////////// بيانات الدكتور ///////

  Future<DoctorListResponse?> getClDrs(
      {clinicCode = "", flag = false, page = 1, offset = 1}) async {
    final queryParameters = {
      'clinicCode': '$clinicCode',
      'pageNo': '${flag ? page : 1}',
      'offset': '${flag ? offset : 1}',
      'rows': '${flag ? 15 : 100}',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}clDrs', queryParameters);

    print(uri);

    final response = await http.get(uri);
    // var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return DoctorListResponse.fromJson(jsonResponse);
    }
    return null;
  }

  // Future<List<Doctor>>getClDrs({clinicCode="",flag = false}) async {
  //   final queryParameters = {
  //     'clinicCode': '$clinicCode',
  //     'pageNo': '1',
  //     'offset': '1',
  //     'rows': '${flag?7:100}',
  //     'lang': SharedPrefController()
  //         .getValueFor<String>(key: PrefKeys.lang.name),
  //   };
  //
  //   final uri =
  //   Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase3}clDrs', queryParameters);
  //
  //   print(uri);
  //   final response = await http.get(uri);
  //   var jsonResponse = jsonDecode(response.body);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     var jsonArray = jsonResponse['doctors'] as List;
  //     return jsonArray.map((jsonObject) => Doctor.fromJson(jsonObject))
  //         .toList();
  //   }
  //   return [];
  // }

  Future<List<Clinic>?> getClList({page = 1,offset = 1}) async {
    final queryParameters = {
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '100',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };
    // 'http://aiph.me:8000/api/clinic/clList?pageNo=1&offset=1&rows=5&lang=AR'
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}clList', queryParameters);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['clinics'] as List;
        return jsonArray
            .map((jsonObject) => Clinic.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
  }

  Future<Doctor?> getDoctorDtl({doctorCode}) async {
    print(doctorCode);
    final queryParameters = {
      'doctorCode': '$doctorCode',
      // 'doctorCode': '1',
      'pageNo': '1',
      'offset': '1',
      'rows': '100',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase2}DoctorDtl', queryParameters);
    final response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return Doctor.fromJson(jsonResponse);
    }
    return null;
  }

  Future<List<String>> getDoctorSched({clinicCode, doctorCode,month ,year}) async {
    final queryParameters = {
      'clinicCode': '$clinicCode',
      'doctorCode': '$doctorCode',
      'resYear':'$year',
      'resMonth':'$month',
      'patientId':'${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.identityNumber.name)}',
      'lang': SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase, '${ApiSettings.HospitalBase2}DoctorSched', queryParameters);
    final response = await http.get(uri);

    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['availableDays'] as List;
      return jsonArray.map((jsonObject) {
        String s = jsonObject['availableDay'];
        return s;
      }).toList();
    }
    return [];
  }


  Future<TimeAvilableResponse?> getDoctorSchedDtl(
      {clinicCode, doctorCode, availableDay}) async {
    final queryParameters = {
      'clinicCode': '$clinicCode',
      'doctorCode': '$doctorCode',
      'availableDay': '${availableDay.toString().split(" ").first}',
      'pageNo': '1',
      'offset': '1',
      'rows': '100',
      'lang':
      SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase2}DoctorSchedDtl', queryParameters);
    NewAccountGetxController.to.changeTimeLoading();
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // TimeAvilableResponse.fromJson(jsonResponse);
      // var jsonResponse = jsonDecode(response.body);
      // var jsonArray = jsonResponse['availableTimes'] as List;
      print("fsdfsd ${jsonResponse}");
      NewAccountGetxController.to.changeDoctorTimeList(TimeAvilableResponse.fromJson(jsonResponse));
    }
    return null;
  }

  Future<ApiResponse> addAppoitment(
      {patientCode,
      patientName,
      patientId,
      patientMOB,
      doctorCode,
      clinicCode,
      resDate,
      consultTime24,
      consultSNo,
      resRemarks}) async {
    Uri uri = Uri.parse('http://aiph.me:8000/api/clinic/clRes');
    print({
      "patientCode": '$patientCode',
      "patientName": '$patientName',
      "patientId": '$patientId',
      "patientMOB": '$patientMOB',
      "doctorCode": '$doctorCode',
      "clinicCode": '$clinicCode',
      "resDate": '$resDate',
      "consultTime24": '$consultTime24',
      "consultSNo": '$consultSNo',
      "resRemarks": '$resRemarks',
      "lang":
      SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name),
    });
    var response = await http.post(uri, body: {
      "patientCode": '$patientCode',
      "patientName": '$patientName',
      "patientId": '$patientId',
      "patientMOB": '$patientMOB',
      "doctorCode": '$doctorCode',
      "clinicCode": '$clinicCode',
      "resDate": '$resDate',
      "consultTime24": '$consultTime24',
      "consultSNo": '$consultSNo',
      "resRemarks": '$resRemarks',
      "lang":
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??"ar",
    });


    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return ApiResponse(
        message: jsonResponse['resStatusDesc']??'add Success',
        success: jsonResponse['resStatusCode'] == "1" ?true:false,
      );
    }
    return failedResponse;
  }
  Future<billResponse?> setConsInv({permsNo,pymtDate,pymtRef,pymtStatus,respCode,cartId,custName,custPhone,paidAmt}) async {
    Uri uri = Uri.parse('http://aiph.me:8000/api/invoice/setConsInv/');

    var response = await http.post(uri, body: {
      "permsNo": '$permsNo',
      "pymtDate": '$pymtDate',
      "pymtRef": '$pymtRef',
      "pymtStatus": '$pymtStatus',
      "respCode": '$respCode',
      "cartId": '$cartId',
      "custName": '$custName',
      "custPhone": '$custPhone',
      "paidAmt": '$paidAmt',
      "lang": SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)??"ar",
    });

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return billResponse.fromJson(jsonResponse);
    }
    return null;
}

}
