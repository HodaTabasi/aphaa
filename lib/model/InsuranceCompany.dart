class InsuranceCompany {
  String? companyCode;
  String? companyName;

  InsuranceCompany({this.companyCode, this.companyName});

  InsuranceCompany.fromJson(Map<String, dynamic> json) {
    companyCode = json['companyCode'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    return data;
  }
}
