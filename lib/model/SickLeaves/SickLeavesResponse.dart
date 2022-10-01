import 'package:aphaa_app/model/SickLeaves/SickLeaves.dart';

import '../Pages.dart';

class SickLeavesResponse {
  List<SickLeaves>? leaves;
  List<Pages>? pages;

  SickLeavesResponse({this.leaves, this.pages});

  SickLeavesResponse.fromJson(Map<String, dynamic> json) {
    if (json['leaves'] != null) {
      leaves = <SickLeaves>[];
      json['leaves'].forEach((v) {
        leaves!.add(new SickLeaves.fromJson(v));
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
    if (this.leaves != null) {
      data['leaves'] = this.leaves!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

