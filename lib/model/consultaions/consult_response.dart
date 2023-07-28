import '../Pages.dart';
import 'consult_model.dart';

class ConsultResponse {
  List<PtCons>? ptCons;
  List<Pages>? pages;

  ConsultResponse({this.ptCons, this.pages});

  ConsultResponse.fromJson(Map<String, dynamic> json) {
    if (json['ptCons'] != null) {
      ptCons = <PtCons>[];
      json['ptCons'].forEach((v) {
        ptCons!.add(new PtCons.fromJson(v));
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
    if (this.ptCons != null) {
      data['ptCons'] = this.ptCons!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
