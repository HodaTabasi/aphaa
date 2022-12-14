class PrescriptionListItems {
  String? s1Desc;
  num? s1Val;
  String? s2Desc;
  num? s2Val;
  String? s3Desc;
  num? s3Val;
  String? s4Desc;
  num? s4Val;
  String? s5Desc;
  num? s5Val;
  String? s6Desc;
  num? s6Val;
  String? s7Desc;
  num? s7Val;
  String? s8Desc;
  num? s8Val;
  List<PrescriptionItems>? prescriptionItems;

  PrescriptionListItems(
      {this.s1Desc,
        this.s1Val,
        this.s2Desc,
        this.s2Val,
        this.s3Desc,
        this.s3Val,
        this.s4Desc,
        this.s4Val,
        this.s5Desc,
        this.s5Val,
        this.s6Desc,
        this.s6Val,
        this.s7Desc,
        this.s7Val,
        this.s8Desc,
        this.s8Val,
        this.prescriptionItems});

  PrescriptionListItems.fromJson(Map<String, dynamic> json) {
    s1Desc = json['s1Desc'];
    s1Val = json['s1Val'];
    s2Desc = json['s2Desc'];
    s2Val = json['s2Val'];
    s3Desc = json['s3Desc'];
    s3Val = json['s3Val'];
    s4Desc = json['s4Desc'];
    s4Val = json['s4Val'];
    s5Desc = json['s5Desc'];
    s5Val = json['s5Val'];
    s6Desc = json['s6Desc'];
    s6Val = json['s6Val'];
    s7Desc = json['s7Desc'];
    s7Val = json['s7Val'];
    s8Desc = json['s8Desc'];
    s8Val = json['s8Val'];

    if (json['prescriptionItems'] != null) {
      prescriptionItems = <PrescriptionItems>[];
      json['prescriptionItems'].forEach((v) {
        prescriptionItems!.add(PrescriptionItems.fromJson(v));
      });

    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s1Desc'] = this.s1Desc;
    data['s1Val'] = this.s1Val;
    data['s2Desc'] = this.s2Desc;
    data['s2Val'] = this.s2Val;
    data['s3Desc'] = this.s3Desc;
    data['s3Val'] = this.s3Val;
    data['s4Desc'] = this.s4Desc;
    data['s4Val'] = this.s4Val;
    data['s5Desc'] = this.s5Desc;
    data['s5Val'] = this.s5Val;
    data['s6Desc'] = this.s6Desc;
    data['s6Val'] = this.s6Val;
    data['s7Desc'] = this.s7Desc;
    data['s7Val'] = this.s7Val;
    data['s8Desc'] = this.s8Desc;
    data['s8Val'] = this.s8Val;
    if (this.prescriptionItems != null) {
      data['prescriptionItems'] =
          this.prescriptionItems!.map((v) => v.toJson()).toList();
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
    this.drugName = json['drugName'];
    this.dose = json['dose'];
    this.durationOfUse = json['durationOfUse'];
    this.frequency = json['frequency'];
    this.route = json['route'];
    this.qty = json['qty'];
    this.price = json['price'];
    this.remarks = json['remarks'];
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