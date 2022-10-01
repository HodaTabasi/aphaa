import '../Pages.dart';
import '../doctor.dart';

class VisitedDrsResponse {
  List<Doctor>? doctors;
  List<Pages>? pages;

  VisitedDrsResponse({this.doctors, this.pages});

  VisitedDrsResponse.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctor>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctor.fromJson(v));
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
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}