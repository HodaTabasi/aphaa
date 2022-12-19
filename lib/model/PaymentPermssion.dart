class PaymentPermssion {
  String? permsNo;
  String? permsStatus;
  String? resType;
  String? reqAmt;
  String? paymentNotice;

  PaymentPermssion(
      {this.permsNo,
        this.permsStatus,
        this.resType,
        this.reqAmt,
        this.paymentNotice});

  PaymentPermssion.fromJson(Map<String, dynamic> json) {
    permsNo = json['permsNo'];
    permsStatus = json['permsStatus'];
    resType = json['resType'];
    reqAmt = json['reqAmt'];
    paymentNotice = json['paymentNotice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permsNo'] = this.permsNo;
    data['permsStatus'] = this.permsStatus;
    data['resType'] = this.resType;
    data['reqAmt'] = this.reqAmt;
    data['paymentNotice'] = this.paymentNotice;
    return data;
  }
}
