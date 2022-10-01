
import 'package:aphaa_app/model/prescriptionListResponse/prescriptionList.dart';

import '../Pages.dart';

class PrescriptionListResponse {
  List<PrescriptionList>? prescriptionList;
  List<Pages>? pages;

  PrescriptionListResponse({this.prescriptionList, this.pages});

  PrescriptionListResponse.fromJson(Map<String, dynamic> json) {
    if (json['prescriptionList'] != null) {
      prescriptionList = <PrescriptionList>[];
      json['prescriptionList'].forEach((v) {
        prescriptionList!.add(new PrescriptionList.fromJson(v));
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
    if (this.prescriptionList != null) {
      data['prescriptionList'] =
          this.prescriptionList!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}