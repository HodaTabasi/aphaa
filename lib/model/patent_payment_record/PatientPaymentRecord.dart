class PatientPaymentRecord {
  String? invType;
  String? invNo;
  String? invDate;
  String? doctorName;
  String? clinicName;
  String? cashAmt;
  String? creditAmt;
  String? serviceType;
  String? pdfStatus;
  String? refNo;
  String? pdfName;

  PatientPaymentRecord(
      {this.invType,
        this.invNo,
        this.invDate,
        this.doctorName,
        this.clinicName,
        this.cashAmt,
        this.creditAmt,
        this.serviceType,
        this.pdfStatus,
        this.refNo,
        this.pdfName});

  PatientPaymentRecord.fromJson(Map<String, dynamic> json) {
    invType = json['invType'];
    invNo = json['invNo'];
    invDate = json['invDate'];
    doctorName = json['doctorName'];
    clinicName = json['clinicName'];
    cashAmt = json['cashAmt'];
    creditAmt = json['creditAmt'];
    serviceType = json['serviceType'];
    pdfStatus = json['pdfStatus'];
    pdfName = json['pdfName'];
    refNo = json['refNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invType'] = this.invType;
    data['invNo'] = this.invNo;
    data['invDate'] = this.invDate;
    data['doctorName'] = this.doctorName;
    data['clinicName'] = this.clinicName;
    data['cashAmt'] = this.cashAmt;
    data['creditAmt'] = this.creditAmt;
    data['serviceType'] = this.serviceType;
    data['pdfStatus'] = this.pdfStatus;
    data['pdfName'] = this.pdfName;
    data['refNo'] = this.refNo;
    return data;
  }
}
