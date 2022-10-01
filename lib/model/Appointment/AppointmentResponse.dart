import 'package:aphaa_app/model/Appointment/Appointments.dart';

import '../Pages.dart';

class AppointmentResponse {
  List<Appointments>? myNextAppointments;
  List<Appointments>? myPrevAppointments;
  List<Pages>? pages;

  AppointmentResponse({this.myNextAppointments, this.pages});

  AppointmentResponse.fromJson(Map<String, dynamic> json) {
    if (json['myNextAppointments'] != null) {
      myNextAppointments = <Appointments>[];
      json['myNextAppointments'].forEach((v) {
        myNextAppointments!.add(new Appointments.fromJson(v));
      });
    }
    if (json['myPrevAppointments'] != null) {
      myPrevAppointments = <Appointments>[];
      json['myPrevAppointments'].forEach((v) {
        myPrevAppointments!.add(new Appointments.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myNextAppointments != null) {
      data['myNextAppointments'] =
          this.myNextAppointments!.map((v) => v.toJson()).toList();
    }

    if (this.myPrevAppointments != null) {
      data['myPrevAppointments'] =
          this.myPrevAppointments!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}