class Eligibility {
  String? patientCode;
  String? patientName;
  String? patientMOB;
  String? patientGender;
  String? patientAge;
  String? patientHight;
  String? patientWeight;
  String? patientAlgy;
  String? chrDisease;
  String? isEligible;
  String? isInsured;
  String? mastPtCode;

  Eligibility(
      {this.patientCode,
        this.patientName,
        this.patientMOB,
        this.patientGender,
        this.patientAge,
        this.patientHight,
        this.patientWeight,
        this.patientAlgy,
        this.chrDisease,
        this.isEligible,
        this.isInsured,
        this.mastPtCode});

  Eligibility.fromJson(Map<String, dynamic> json) {
    patientCode = json['patientCode'];
    patientName = json['patientName'];
    patientMOB = json['patientMOB'];
    patientGender = json['patientGender'];
    patientAge = json['patientAge'];
    patientHight = json['patientHight'];
    patientWeight = json['patientWeight'];
    patientAlgy = json['patientAlgy'];
    chrDisease = json['chrDisease'];
    isEligible = json['isEligible'];
    isInsured = json['isInsured'];
    mastPtCode = json['mastPtCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientCode'] = this.patientCode;
    data['patientName'] = this.patientName;
    data['patientMOB'] = this.patientMOB;
    data['patientGender'] = this.patientGender;
    data['patientAge'] = this.patientAge;
    data['patientHight'] = this.patientHight;
    data['patientWeight'] = this.patientWeight;
    data['patientAlgy'] = this.patientAlgy;
    data['chrDisease'] = this.chrDisease;
    data['isEligible'] = this.isEligible;
    data['isInsured'] = this.isInsured;
    data['mastPtCode'] = this.mastPtCode;
    return data;
  }

  @override
  String toString() {
    return 'Eligibility{patientCode: $patientCode, patientName: $patientName, patientMOB: $patientMOB, patientGender: $patientGender, patientAge: $patientAge, patientHight: $patientHight, patientWeight: $patientWeight, patientAlgy: $patientAlgy, chrDisease: $chrDisease, isEligible: $isEligible, isInsured: $isInsured, mastPtCode: $mastPtCode}';
  }
}
