import 'package:aphaa_app/model/Clinic.dart';

import '../doctor.dart';

class LeaveDetail {
  String? repId;
  String? repDate;
  String? leaveDuration;
  String? repDiag;
  String? repStaus;
  String? serviceType;
  String? fileName;
  Clinic? clinic;
  Doctor? doctor;

  LeaveDetail(
      {this.repId,
        this.repDate,
        this.leaveDuration,
        this.repDiag,
        this.repStaus,
        this.serviceType,
        this.fileName,
        this.clinic,
        this.doctor});

  LeaveDetail.fromJson(Map<String, dynamic> json) {
    repId = json['repId'];
    repDate = json['repDate'];
    leaveDuration = json['leaveDuration'];
    repDiag = json['repDiag'];
    repStaus = json['repStaus'];
    serviceType = json['serviceType'];
    fileName = json['fileName'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repId'] = this.repId;
    data['repDate'] = this.repDate;
    data['leaveDuration'] = this.leaveDuration;
    data['repDiag'] = this.repDiag;
    data['repStaus'] = this.repStaus;
    data['serviceType'] = this.serviceType;
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
