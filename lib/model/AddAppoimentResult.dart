class AddAppoimentResult {
  String? resStatusCode;
  String? resStatusDesc;
  String? consultSNo;
  String? patientCode;
  String? resNo;
  String? resDate;
  String? doctorCode;

  AddAppoimentResult(
      {this.resStatusCode,
        this.resStatusDesc,
        this.consultSNo,
        this.patientCode,
        this.resNo,
        this.resDate,
        this.doctorCode});

  AddAppoimentResult.fromJson(Map<String, dynamic> json) {
    resStatusCode = json['resStatusCode'];
    resStatusDesc = json['resStatusDesc'];
    consultSNo = json['consultSNo'];
    patientCode = json['patientCode'];
    resNo = json['resNo'];
    resDate = json['resDate'];
    doctorCode = json['doctorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resStatusCode'] = this.resStatusCode;
    data['resStatusDesc'] = this.resStatusDesc;
    data['consultSNo'] = this.consultSNo;
    data['patientCode'] = this.patientCode;
    data['resNo'] = this.resNo;
    data['resDate'] = this.resDate;
    data['doctorCode'] = this.doctorCode;
    return data;
  }
}