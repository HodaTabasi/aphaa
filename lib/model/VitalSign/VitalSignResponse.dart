import 'package:aphaa_app/model/VitalSign/vitalSign.dart';

import '../Pages.dart';

class VitalSignResponse {
  List<VitalSign>? vitalSigns;
  List<Pages>? pages;

  VitalSignResponse({this.vitalSigns, this.pages});

  VitalSignResponse.fromJson(Map<String, dynamic> json) {
    if (json['vitalSigns'] != null) {
      vitalSigns = <VitalSign>[];
      json['vitalSigns'].forEach((v) {
        vitalSigns!.add(new VitalSign.fromJson(v));
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
    if (this.vitalSigns != null) {
      data['vitalSigns'] = this.vitalSigns!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}