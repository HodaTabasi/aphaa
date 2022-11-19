import 'package:aphaa_app/model/Clinic.dart';

import '../doctor.dart';

class LeaveDetail {
  String? leaveId;
  String? leaveDate;
  String? leaveDuration;
  String? fileName;
  Clinic? clinic;
  Doctor? doctor;

  LeaveDetail(
      {this.leaveId,
        this.leaveDate,
        this.leaveDuration,
        this.fileName,
        this.clinic,
        this.doctor});

  LeaveDetail.fromJson(Map<String, dynamic> json) {
    leaveId = json['leaveId'];
    leaveDate = json['leaveDate'];
    leaveDuration = json['leaveDuration'];
    fileName = json['fileName'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveId'] = this.leaveId;
    data['leaveDate'] = this.leaveDate;
    data['leaveDuration'] = this.leaveDuration;
    data['fileName'] = this.fileName;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

