class VitalSignDtils {
  String? signName;
  String? signValue;

  VitalSignDtils({this.signName, this.signValue});

  VitalSignDtils.fromJson(Map<String, dynamic> json) {
    signName = json['signName'];
    signValue = json['signValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signName'] = this.signName;
    data['signValue'] = this.signValue;
    return data;
  }
}
