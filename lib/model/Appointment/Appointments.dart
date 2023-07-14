import 'package:aphaa_app/model/Clinic.dart';
import 'package:aphaa_app/model/doctor.dart';

class Appointments {
  String? resDate;
  String? time;
  String? resStatus;
  Clinic? clinic;
  Doctor? doctor;
  String? notes;
  String? y;
  String? patientCode;
  String? resNo;
  String? consNo;
  String? date;
  String? reservationStatus;

  Appointments(
      {this.resDate,
        this.time,
        this.resStatus,
        this.clinic,
        this.doctor,
        this.notes,
        this.y,
        this.patientCode,
        this.resNo,
        this.consNo,
         this.date,
      this.reservationStatus});


  Appointments.fromJsonPrev(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    reservationStatus = json['reservationStatus'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    notes = json['notes'];

    print(" $notes , $time , $date , $reservationStatus  ");
  }

  Map<String, dynamic> toJsonPrev() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['reservationStatus'] = this.reservationStatus;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['notes'] = this.notes;
    return data;
  }



Appointments.fromJson(Map<String, dynamic> json) {
    resDate = json['resDate'];
    time = json['time'];
    resStatus = json['resStatus'];
    clinic =
    json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    notes = json['notes'];
    y = json['Y'];
    patientCode = json['patientCode'];
    resNo = json['resNo'];
    consNo = json['consNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resDate'] = this.resDate;
    data['time'] = this.time;
    data['resStatus'] = this.resStatus;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['notes'] = this.notes;
    data['Y'] = this.y;
    data['patientCode'] = this.patientCode;
    data['resNo'] = this.resNo;
    data['consNo'] = this.consNo;
    return data;
  }
}

