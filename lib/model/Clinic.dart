class Clinic {
  String? clinicCode;
  String? clinicName;

  Clinic({this.clinicCode, this.clinicName});

  Clinic.fromJson(Map<String, dynamic> json) {
    clinicCode = json['clinicCode'];
    clinicName = json['clinicName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicCode'] = this.clinicCode;
    data['clinicName'] = this.clinicName;
    return data;
  }
}