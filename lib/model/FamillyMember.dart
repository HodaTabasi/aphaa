class FamillyMember {
  String? patientName;
  String? medicFileNumber;
  String? patientIDNumber;

  FamillyMember({this.patientName, this.medicFileNumber, this.patientIDNumber});

  FamillyMember.fromJson(Map<String, dynamic> json) {
    patientName = json['patientName'];
    medicFileNumber = json['medicFileNumber'];
    patientIDNumber = json['patientIDNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientName'] = this.patientName;
    data['medicFileNumber'] = this.medicFileNumber;
    data['patientIDNumber'] = this.patientIDNumber;
    return data;
  }
}
