import 'package:aphaa_app/model/Clinic.dart';
import 'package:aphaa_app/model/doctor.dart';

class PrescriptionList {
  String? invoiceNo;
  String? invoiceDate;
  String? invoiceType;
  String? invoiceStatus;
  String? invoiceFlag;
  Clinic? clinic;
  Doctor? doctor;

  PrescriptionList(
      {this.invoiceNo,
        this.invoiceDate,
        this.invoiceType,
        this.invoiceStatus,
        this.invoiceFlag,
        this.clinic,
        this.doctor});

  PrescriptionList.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoiceNo'];
    invoiceDate = json['invoiceDate'];
    invoiceType = json['invoiceType'];
    invoiceStatus = json['invoiceStatus'];
    invoiceFlag = json['invoiceFlag'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceNo'] = this.invoiceNo;
    data['invoiceDate'] = this.invoiceDate;
    data['invoiceType'] = this.invoiceType;
    data['invoiceStatus'] = this.invoiceStatus;
    data['invoiceFlag'] = this.invoiceFlag;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}
