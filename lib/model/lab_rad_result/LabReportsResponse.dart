import '../Pages.dart';
import 'ServiceTest.dart';

class LabReportsResponse {
  List<ServiceTest>? services;
  List<Pages>? pages;

  LabReportsResponse({this.services, this.pages});

  LabReportsResponse.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <ServiceTest>[];
      json['services'].forEach((v) {
        services!.add(new ServiceTest.fromJson(v));
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
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}