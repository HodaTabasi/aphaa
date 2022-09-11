class PrescriptionListItems {
  double? total;
  int? tax;
  List<PrescriptionItems>? prescriptionItems;
  List<Pages>? pages;

  PrescriptionListItems(
      {this.total, this.tax, this.prescriptionItems, this.pages});

  PrescriptionListItems.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    tax = json['tax'];
    if (json['prescriptionItems'] != null) {
      prescriptionItems = <PrescriptionItems>[];
      json['prescriptionItems'].forEach((v) {
        prescriptionItems!.add(new PrescriptionItems.fromJson(v));
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
    data['total'] = this.total;
    data['tax'] = this.tax;
    if (this.prescriptionItems != null) {
      data['prescriptionItems'] =
          this.prescriptionItems!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrescriptionItems {
  String? drugName;
  String? dose;
  String? durationOfUse;
  String? frequency;
  String? route;
  String? qty;
  String? price;
  String? remarks;

  PrescriptionItems(
      {this.drugName,
        this.dose,
        this.durationOfUse,
        this.frequency,
        this.route,
        this.qty,
        this.price,
        this.remarks});

  PrescriptionItems.fromJson(Map<String, dynamic> json) {
    drugName = json['drugName'];
    dose = json['dose'];
    durationOfUse = json['durationOfUse'];
    frequency = json['frequency'];
    route = json['route'];
    qty = json['qty'];
    price = json['price'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drugName'] = this.drugName;
    data['dose'] = this.dose;
    data['durationOfUse'] = this.durationOfUse;
    data['frequency'] = this.frequency;
    data['route'] = this.route;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['remarks'] = this.remarks;
    return data;
  }
}

class Pages {
  String? page;
  String? offset;

  Pages({this.page, this.offset});

  Pages.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['offset'] = this.offset;
    return data;
  }
}
