class PaymentDitails {
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

  PaymentDitails(
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

  PaymentDitails.fromJson(Map<String, dynamic> json) {
    print(json);
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
        prescriptionItems!.add(new PrescriptionItems.fromJson(v));
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
  String? itemDesc;
  String? itemName;
  String? qtyDesc;
  String? qty;
  String? priceDesc;
  String? price;

  PrescriptionItems(
      {this.itemDesc,
        this.itemName,
        this.qtyDesc,
        this.qty,
        this.priceDesc,
        this.price});

  PrescriptionItems.fromJson(Map<String, dynamic> json) {
    itemDesc = json['itemDesc'];
    itemName = json['itemName'];
    qtyDesc = json['qtyDesc'];
    qty = json['qty'];
    priceDesc = json['priceDesc'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemDesc'] = this.itemDesc;
    data['itemName'] = this.itemName;
    data['qtyDesc'] = this.qtyDesc;
    data['qty'] = this.qty;
    data['priceDesc'] = this.priceDesc;
    data['price'] = this.price;
    return data;
  }
}
