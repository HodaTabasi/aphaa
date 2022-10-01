import 'package:aphaa_app/model/Clinic.dart';

class LeaveDetail {
  String? leaveId;
  String? leaveDate;
  String? leaveDuration;
  String? fileName;
  Clinic? clinic;

  LeaveDetail(
      {this.leaveId,
        this.leaveDate,
        this.leaveDuration,
        this.fileName,
        this.clinic});

  LeaveDetail.fromJson(Map<String, dynamic> json) {
    leaveId = json['leaveId'];
    leaveDate = json['leaveDate'];
    leaveDuration = json['leaveDuration'];
    fileName = json['fileName'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
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
    return data;
  }
}

