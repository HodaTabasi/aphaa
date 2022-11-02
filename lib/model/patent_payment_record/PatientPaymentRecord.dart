class PatientPaymentRecord {
  String? invType;
  String? invNo;
  String? invDate;
  String? cashAmt;
  String? creditAmt;
  String? totalAmt;
  String? pdfName;

  PatientPaymentRecord(
      {this.invType,
        this.invNo,
        this.invDate,
        this.cashAmt,
        this.creditAmt,
        this.totalAmt,
        this.pdfName});

  PatientPaymentRecord.fromJson(Map<String, dynamic> json) {
    invType = json['invType'];
    invNo = json['invNo'];
    invDate = json['invDate'];
    cashAmt = json['cashAmt'];
    creditAmt = json['creditAmt'];
    totalAmt = json['totalAmt'];
    pdfName = json['pdfName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invType'] = this.invType;
    data['invNo'] = this.invNo;
    data['invDate'] = this.invDate;
    data['cashAmt'] = this.cashAmt;
    data['creditAmt'] = this.creditAmt;
    data['totalAmt'] = this.totalAmt;
    data['pdfName'] = this.pdfName;
    return data;
  }
}
