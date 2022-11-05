class billResponse {
  String? invNo;
  String? resType;
  String? paymentNotice;

  billResponse({this.invNo, this.resType, this.paymentNotice});

  billResponse.fromJson(Map<String, dynamic> json) {
    invNo = json['invNo'];
    resType = json['resType'];
    paymentNotice = json['paymentNotice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invNo'] = this.invNo;
    data['resType'] = this.resType;
    data['paymentNotice'] = this.paymentNotice;
    return data;
  }
}