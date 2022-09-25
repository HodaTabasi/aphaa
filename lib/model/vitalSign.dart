import 'Clinic.dart';
import 'doctor.dart';

class VitalSign {
  String? vitalSignId;
  String? vitalSignDate;
  Clinic? clinic;
  Doctor? doctor;
  String? notes;

  VitalSign(
      {this.vitalSignId,
        this.vitalSignDate,
        this.clinic,
        this.doctor,
        this.notes});

  VitalSign.fromJson(Map<String, dynamic> json) {
    vitalSignId = json['vitalSignId'];
    vitalSignDate = json['vitalSignDate'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vitalSignId'] = this.vitalSignId;
    data['vitalSignDate'] = this.vitalSignDate;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['notes'] = this.notes;
    return data;
  }
}

