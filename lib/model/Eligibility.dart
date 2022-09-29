class Eligibility {
  String? patientCode;
  String? patientName;
  String? patientMOB;
  String? isEligibility;

  Eligibility(
      {this.patientCode,
        this.patientName,
        this.patientMOB,
        this.isEligibility});

  Eligibility.fromJson(Map<String, dynamic> json) {
    patientCode = json['patientCode'];
    patientName = json['patientName'];
    patientMOB = json['patientMOB'];
    isEligibility = json['IsEligibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientCode'] = this.patientCode;
    data['patientName'] = this.patientName;
    data['patientMOB'] = this.patientMOB;
    data['IsEligibility'] = this.isEligibility;
    return data;
  }

  @override
  String toString() {
    return 'Eligibility{patientCode: $patientCode, patientName: $patientName, patientMOB: $patientMOB, isEligibility: $isEligibility}';
  }
}
