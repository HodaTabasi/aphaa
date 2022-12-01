import 'package:aphaa_app/model/doctor.dart';

import '../Clinic.dart';

class SickLeaves {
  String? repId;
  String? repDate;
  String? repType;
  Clinic? clinic;
  Doctor? doctor;

  SickLeaves(
      {this.repId, this.repDate, this.repType, this.clinic, this.doctor});

  SickLeaves.fromJson(Map<String, dynamic> json) {
    repId = json['repId'];
    repDate = json['repDate'];
    repType = json['repType'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repId'] = this.repId;
    data['repDate'] = this.repDate;
    data['repType'] = this.repType;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

