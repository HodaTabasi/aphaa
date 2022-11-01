class Eligibility {
  String? patientCode;
  String? patientName;
  String? patientMOB;
  String? isEligible;
  String? isInsured;

  Eligibility(
      {this.patientCode,
        this.patientName,
        this.patientMOB,
        this.isEligible,
        this.isInsured});

  Eligibility.fromJson(Map<String, dynamic> json) {
    patientCode = json['patientCode'];
    patientName = json['patientName'];
    patientMOB = json['patientMOB'];
    isEligible = json['isEligible'];
    isInsured = json['isInsured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientCode'] = this.patientCode;
    data['patientName'] = this.patientName;
    data['patientMOB'] = this.patientMOB;
    data['isEligible'] = this.isEligible;
    data['isInsured'] = this.isInsured;
    return data;
  }
  @override
  String toString() {
    return 'Eligibility{patientCode: $patientCode, patientName: $patientName, patientMOB: $patientMOB, isEligibility: $isEligible}';
  }
}
