class PatientPaymentRecord {
  String? invType;
  String? invNo;
  String? invDate;
  String? doctorName;
  String? clinicName;
  String? consNo;
  String? consDate;
  String? expTime;
  String? cashAmt;
  String? creditAmt;
  String? serviceType;
  String? pdfStatus;
  String? refNo;
  String? pdfName;

  /*
  * "consNo": "",
            "consDate": "",
            "expTime": "",
            * */

  PatientPaymentRecord(
      {this.invType,
        this.invNo,
        this.invDate,
        this.doctorName,
        this.clinicName,
        this.consNo,
        this.consDate,
        this.expTime,
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
    consNo = json['consNo'];
    consDate = json['consDate'];
    expTime = json['expTime'];
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
    data['consNo'] = this.consNo ;
    data['consDate'] =this.consDate;
    data['expTime'] =this.expTime;
    data['cashAmt'] = this.cashAmt;
    data['creditAmt'] = this.creditAmt;
    data['serviceType'] = this.serviceType;
    data['pdfStatus'] = this.pdfStatus;
    data['pdfName'] = this.pdfName;
    data['refNo'] = this.refNo;
    return data;
  }
}
