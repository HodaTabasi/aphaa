import 'package:aphaa_app/model/Clinic.dart';
import 'package:aphaa_app/model/doctor.dart';

class Appointments {
  String? date;
  String? time;
  String? reservationStatus;
  Clinic? clinic;
  Doctor? doctor;
  String? notes;
  String? y;

  Appointments(
      {this.date,
        this.time,
        this.reservationStatus,
        this.clinic,
        this.doctor,
        this.notes,
        this.y});

  Appointments.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    time = json['time'];
    reservationStatus = json['reservationStatus'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    notes = json['notes'];
    y = json['Y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['time'] = this.time;
    data['reservationStatus'] = this.reservationStatus;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['notes'] = this.notes;
    data['Y'] = this.y;
    return data;
  }
}
