import 'package:aphaa_app/model/doctor.dart';

class SickLeaves {
  String? leaveId;
  String? repStatus;
  String? repDate;
  Doctor? doctor;

  SickLeaves({this.leaveId, this.repStatus, this.repDate, this.doctor});

  SickLeaves.fromJson(Map<String, dynamic> json) {
    leaveId = json['leaveId'];
    repStatus = json['repStatus'];
    repDate = json['repDate'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveId'] = this.leaveId;
    data['repStatus'] = this.repStatus;
    data['repDate'] = this.repDate;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    return data;
  }
}

