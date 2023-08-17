import 'dart:async';
import 'dart:convert';
import 'dart:math';

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
import 'package:intl/intl.dart';
import '../../get/login_getx_controller.dart';
import '../../model/AddAppoimentResult.dart';
import '../../model/Appointment/AppointmentResponse.dart';
import '../../model/ApprovalsResponse/ApprovalItem.dart';
import '../../model/ApprovalsResponse/ApprovalsResponse.dart';
import '../../model/CancelResult.dart';
import '../../model/Clinic.dart';
import '../../model/IDTypes.dart';
import '../../model/InsuranceCompany.dart';
import '../../model/Nationalities.dart';
import '../../model/PaymentDitails.dart';
import '../../model/PaymentPermssion.dart';
import '../../model/billResponse.dart';
import '../../model/consultaions/consult_response.dart';
import '../../model/lab_rad_result/LabReportsResponse.dart';
import '../../model/VitalSign/VitalSignResponse.dart';
import '../../model/VitalSign/vitalSignsDils.dart';
import '../../model/api_response.dart';
import '../../model/patent_payment_record/PaymentRecordResponse.dart';
import '../../model/prescriptionListResponse/PrescriptionListResponse.dart';
import '../../model/sms/send_model.dart';
import '../../model/time_avilable_response/TimeAvilableResponse.dart';
import '../../preferences/shared_pref_controller.dart';
import '../api_helper.dart';
import 'package:http/http.dart' as http;
import '../../model/getPDF.dart';

class HospitalApiController with ApiHelper {
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<AppointmentResponse?> getNextAppt(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      //'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}prevAppt', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return AppointmentResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<PrescriptionListResponse?> getRxList(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      // 'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
      {invoiceNo, invoiceDate, invoiceType, page, offset}) async {
    print(" fgd  $invoiceDate $invoiceNo $invoiceType");
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}rxItems', queryParameters);
    final response = await http.get(uri);
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse;
      PrescriptionListItems prescriptionListItems =
          PrescriptionListItems.fromJson(jsonObject);
      print(prescriptionListItems);
      return prescriptionListItems;
    }
    return null;
  }

  Future<SickLeavesResponse?> getSickLeaves(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/372081',
      'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };
    // final uri = Uri.parse("http://aiph.me:8000/api/patient/sickLeaves?patientCode=1/66600&pageNo=1&offset=1&rows=5&lang=AR");
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}sickLeaves', queryParameters);
    print(uri);
    final response =
        await http.get(uri, headers: {'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return SickLeavesResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<PaymentPermssion?> getPymtPerms(
      {patientCode, resNo, resDate, doctorCode}) async {
    final queryParameters = {
      'patientCode': patientCode,
      'resNo': '$resNo',
      'resDate': '$resDate',
      'doctorCode': '$doctorCode',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };
    // final uri = Uri.parse("http://aiph.me:8000/api/patient/sickLeaves?patientCode=1/66600&pageNo=1&offset=1&rows=5&lang=AR");
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase4}pymtPermsFnl', queryParameters);
    print(uri);
    final response =
        await http.get(uri, headers: {'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return PaymentPermssion.fromJson(jsonResponse);
    }
    return null;
  }

  Future<List<LeaveDetail>> getSickLeaveDtl({leaveId}) async {
    final queryParameters = {
      'repId': '$leaveId',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase1}sickLeaveDtl', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['leaveDetail'] as List;
      return jsonArray
          .map((jsonObject) => LeaveDetail.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<ApprovalsResponse?> getSrvApvl(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/7702',
      'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<VisitedDrsResponse?> getVisitedDrs(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      'patientCode': '$patientCode',
      // 'patientCode': '0/32230',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<VitalSignResponse?> getPtVS(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/32230',
      'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<PaymentRecordResponse?> getPatientpayment(
      {patientCode, page = 1, offset = 1}) async {
    final queryParameters = {
      // 'patientCode': '0/595907',
      'patientCode': '$patientCode',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase4}ptPymt', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(response.body);
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

  Future<ConsultResponse?> getConsultation(
      {patientCode, page = 1, offset = 1}) async {
    print(patientCode);
    final queryParameters = {
      'patientId': '$patientCode',
      // 'patientId': '2342922727',
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '7',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}getConsDtl', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(response.body);
      return ConsultResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<PaymentDitails?> getPatientpaymentDitails({refNo}) async {
    print("sra $refNo");
    final queryParameters = {
      // 'patientCode': '0/595907',
      'refNo': '$refNo',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase4}ptPymtDtl', queryParameters);
    final response = await http.get(uri);
    print("dddd ${response.body}");
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse;
      PaymentDitails prescriptionListItems =
          PaymentDitails.fromJson(jsonObject);
      return prescriptionListItems;
    }
    return null;
  }

  Future<Eligibility?> getPtElg({patientId}) async {
    final queryParameters = {
      'patientId': '$patientId',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
  getPdfFile({patientCode, serviceType, clinicCode = "", fileName}) async {
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
    // print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return PdfClass.fromJson(jsonResponse['pdfFile']);
    } else if (response.statusCode == 500) {
      print("ddsgsd");
      return null;
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<List<Clinic>?> getClList({page = 1, offset = 1}) async {
    final queryParameters = {
      'pageNo': '$page',
      'offset': '$offset',
      'rows': '100',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<List<Nationalities>?> getnatList() async {
    final queryParameters = {
      // 'nationalityName': 'S',
      // 'lang':'EN'
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'en',
    };
    // 'http://aiph.me:8000/api/clinic/clList?pageNo=1&offset=1&rows=5&lang=AR'
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}natList', queryParameters);
    print(uri);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['nationalities'] as List;
        return jsonArray
            .map((jsonObject) => Nationalities.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
  }

  Future<List<IDTypes>?> getidTypesList() async {
    final queryParameters = {
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };
    // 'http://aiph.me:8000/api/clinic/clList?pageNo=1&offset=1&rows=5&lang=AR'
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}idTypesList', queryParameters);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonArray = jsonResponse['idTypes'] as List;
        return jsonArray
            .map((jsonObject) => IDTypes.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
  }

  /////////////

  Future<Doctor?> getDoctorDtl({doctorCode}) async {
    print(doctorCode);
    final queryParameters = {
      'doctorCode': '$doctorCode',
      // 'doctorCode': '1',
      'pageNo': '1',
      'offset': '1',
      'rows': '100',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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

  Future<List<String>> getDoctorSched(
      {clinicCode, doctorCode, month, year}) async {
    final queryParameters = {
      'clinicCode': '$clinicCode',
      'doctorCode': '$doctorCode',
      'resYear': '$year',
      'resMonth': '$month',
      'patientId':
          '${SharedPrefController().getValueFor<String>(key: PrefKeysPatient.identityNumber.name)}',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase2}DoctorSched', queryParameters);
    final response = await http.get(uri);

    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['availableDays'] as List;
      String date =
          "${jsonResponse['resYear']}-${jsonResponse['resMonth']}-01 03:04:05";
      // print(DateFormat("yyyy-M-dd hh:mm:ss").parse(date).toString());
      if (jsonResponse['resYear'] != null && jsonResponse['resMonth'] != null) {
        NewAccountGetxController.to.initYear = jsonResponse['resYear'];
        NewAccountGetxController.to.initMonth = jsonResponse['resMonth'];
        NewAccountGetxController.to.currentDate =
            DateFormat("yyyy-M-dd hh:mm:ss").parse(date);
      } else {
        // NewAccountGetxController.to.currentDate = null;
      }
      return jsonArray.map((jsonObject) {
        String s = jsonObject['availableDay'];
        return s;
      }).toList();
    }
    return [];
  }

  Future<TimeAvilableResponse?> getDoctorSchedDtl(
      {clinicCode, doctorCode, availableDay, pId = ''}) async {
    final queryParameters = {
      'clinicCode': '$clinicCode',
      'doctorCode': '$doctorCode',
      'availableDay': '${availableDay.toString().split(" ").first}',
      'patientId': pId,
      'pageNo': '1',
      'offset': '1',
      'rows': '100',
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
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
      NewAccountGetxController.to
          .changeDoctorTimeList(TimeAvilableResponse.fromJson(jsonResponse));
    }
    return null;
  }

  Future<AddAppoimentResult?> addAppoitment(
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
    Uri uri = Uri.parse('http://aiph.me:8082/api/clinic/clResFnl');
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
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              "ar",
    });

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      AddAppoimentResult responses = AddAppoimentResult.fromJson(jsonResponse);

      return responses;
      // return ApiResponse(
      //   message: jsonResponse['resStatusDesc'] ?? 'add Success',
      //   success: jsonResponse['resStatusCode'] == "1" ? true : false,
      // );
    }
    return null;
  }

  Future<billResponse?> setConsInv(map) async {
    Uri uri = Uri.parse('http://aiph.me:8082/api/invoice/setConsInvFnl/');

    var response = await http.post(uri, body: map);

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return billResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<ApiResponse> setCxlRes({resNo, resDate, doctorCode}) async {
    Uri uri = Uri.parse('http://aiph.me:8082/api/clinic/cxlResFnl');

    var response = await http.post(uri, body: {
      "resNo": '$resNo',
      "resDate": '$resDate',
      "doctorCode": '$doctorCode',
      "lang":
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              "ar",
    });

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return ApiResponse(
        message: jsonResponse['resMsg'],
        success: jsonResponse['resSatus'] == "1" ? true : false,
      );

      // return CancelResult.fromJson(jsonResponse);
    }
    return failedResponse;
  }

  Future<SMSSndModel?> sendSMSCode({required String patientId}) async {
    final queryParameters = {
      'patientId': patientId,
    };
    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}getOtp', queryParameters);
    print(uri);
    final response = await http.get(uri);

    print(response);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return SMSSndModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<SMSSndModel?> checkSMSCode(
      {required String patientId, required String otpCode}) async {
    final queryParameters = {
      'patientId': patientId,
      'otpCode': otpCode,
      'lang':
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
              'ar',
    };

    final uri = Uri.http(ApiSettings.HospitalBase,
        '${ApiSettings.HospitalBase3}validateOtp', queryParameters);
    print(uri);
    final response = await http.get(uri);

    print(response);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return SMSSndModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<ApiResponse> sendConsultation(
      {patientName,
      patientId,
      patientMOB,
      patientGender,
      patientHight,
      patientWeight,
      patientAge,
      chrDisease,
      patientAlgy,
      patientConsult}) async {
    Uri uri = Uri.parse('http://aiph.me:8082/api/clinic/setConsFnl');
    print({
      'patientName': patientName,
      'patientId': patientId,
      'patientMOB': patientMOB,
      'patientGender': patientGender,
      'patientHight': patientHight,
      'patientWeight': patientWeight,
      'patientAge': patientAge,
      'chrDisease': chrDisease,
      'patientAlgy': patientAlgy,
      'patientConsult': patientConsult,
      "lang":
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name),
    });
    var response = await http.post(uri, body: {
      'patientName': patientName,
      'patientId': patientId,
      'patientMOB': patientMOB,
      'patientGender': patientGender,
      'patientHight': patientHight,
      'patientWeight': patientWeight,
      'patientAge': patientAge,
      'chrDisease': chrDisease,
      'patientAlgy': patientAlgy,
      'patientConsult': patientConsult,
      "lang":
          SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name),
    });

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse responses = ApiResponse(
          message: jsonResponse['consMsg'],
          success: jsonResponse['consFlag'] == "true" ? true : false);

      return responses;
    } else {
      return failedResponse;
    }
    // return null;
  }
}
