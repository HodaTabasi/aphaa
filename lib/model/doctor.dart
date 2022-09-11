class Doctor {
  String? doctorCode;
  String? doctorName;
  String? clinicName;
  String? img;
  List<String>? sciMainInfo;
  List<String>? pastExpInfo;
  List<String>? medSrvInfo;
  List<DrSkillInfo>? drSkillInfo;

  Doctor(
      {this.doctorCode,
        this.doctorName,
        this.clinicName,
        this.img,
        this.sciMainInfo,
        this.pastExpInfo,
        this.medSrvInfo,
        this.drSkillInfo});

  Doctor.fromJson(Map<String, dynamic> json) {
    doctorCode = json['doctorCode'];
    doctorName = json['doctorName'];
    clinicName = json['clinicName'];
    img = json['img'];
    sciMainInfo = json['sciMainInfo'];
    pastExpInfo = json['pastExpInfo'];
    medSrvInfo = json['medSrvInfo'];
    if (json['drSkillInfo'] != null) {
      drSkillInfo = <DrSkillInfo>[];
      json['drSkillInfo'].forEach((v) {
        drSkillInfo!.add(new DrSkillInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorCode'] = this.doctorCode;
    data['doctorName'] = this.doctorName;
    data['clinicName'] = this.clinicName;
    data['img'] = this.img;
    data['sciMainInfo'] = this.sciMainInfo;
    data['pastExpInfo'] = this.pastExpInfo;
    data['medSrvInfo'] = this.medSrvInfo;
    if (this.drSkillInfo != null) {
      data['drSkillInfo'] = this.drSkillInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrSkillInfo {
  String? skillName;
  String? skillPct;

  DrSkillInfo({this.skillName, this.skillPct});

  DrSkillInfo.fromJson(Map<String, dynamic> json) {
    skillName = json['skillName'];
    skillPct = json['skillPct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skillName'] = this.skillName;
    data['skillPct'] = this.skillPct;
    return data;
  }
}
