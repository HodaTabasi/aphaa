import 'package:aphaa_app/model/ApprovalsResponse/Approvals.dart';

import '../Pages.dart';

class ApprovalsResponse {
  List<Approvals>? approvals;
  List<Pages>? pages;

  ApprovalsResponse({this.approvals, this.pages});

  ApprovalsResponse.fromJson(Map<String, dynamic> json) {
    if (json['approvals'] != null) {
      approvals = <Approvals>[];
      json['approvals'].forEach((v) {
        approvals!.add(new Approvals.fromJson(v));
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
    if (this.approvals != null) {
      data['approvals'] = this.approvals!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
