import '../Pages.dart';
import 'PatientPaymentRecord.dart';

class PaymentRecordResponse {
  List<PatientPaymentRecord>? invoices;
  List<Pages>? pages;

  PaymentRecordResponse({this.invoices, this.pages});

  PaymentRecordResponse.fromJson(Map<String, dynamic> json) {
    if (json['invoices'] != null) {
      invoices = <PatientPaymentRecord>[];
      json['invoices'].forEach((v) {
        invoices!.add(PatientPaymentRecord.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoices != null) {
      data['invoices'] = this.invoices!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
