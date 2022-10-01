import 'package:aphaa_app/model/familly/FamillyMember.dart';

import '../Pages.dart';

class FamillyResponse {
  List<FamilyMember>? familyMembers;
  List<Pages>? pages;

  FamillyResponse({this.familyMembers, this.pages});

  FamillyResponse.fromJson(Map<String, dynamic> json) {
    if (json['familyMembers'] != null) {
      familyMembers = <FamilyMember>[];
      json['familyMembers'].forEach((v) {
        familyMembers!.add(new FamilyMember.fromJson(v));
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
    if (this.familyMembers != null) {
      data['familyMembers'] =
          this.familyMembers!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


