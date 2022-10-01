import 'package:aphaa_app/model/Clinic.dart';
import 'package:aphaa_app/model/doctor.dart';

class Approvals {
  String? reqId;
  String? reqDate;
  String? reqTime;
  String? reqStatus;
  String? reqDetails;
  Clinic? clinic;
  Doctor? doctor;

  Approvals(
      {this.reqId,
        this.reqDate,
        this.reqTime,
        this.reqStatus,
        this.reqDetails,
        this.clinic,
        this.doctor});

  Approvals.fromJson(Map<String, dynamic> json) {
    reqId = json['reqId'];
    reqDate = json['reqDate'];
    reqTime = json['reqTime'];
    reqStatus = json['reqStatus'];
    reqDetails = json['reqDetails'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reqId'] = this.reqId;
    data['reqDate'] = this.reqDate;
    data['reqTime'] = this.reqTime;
    data['reqStatus'] = this.reqStatus;
    data['reqDetails'] = this.reqDetails;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}
