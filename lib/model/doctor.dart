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
    if (json['img'] != null) {
      img = json['img'];
    }
    if (json['sciMainInfo'] != null) {
      sciMainInfo = json['sciMainInfo'].cast<String>();
    }
    if (json['pastExpInfo'] != null) {
      pastExpInfo = json['pastExpInfo'].cast<String>();
    }

    if (json['medSrvInfo'] != null) {

      medSrvInfo = json['medSrvInfo'].cast<String>();
    }

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
    if (this.img != null) {
      data['img'] = this.img;
    }
    if (this.sciMainInfo != null) {
      data['sciMainInfo'] = this.sciMainInfo;
    }
    if (this.pastExpInfo != null) {
      data['pastExpInfo'] = this.pastExpInfo;
    }

    if (this.medSrvInfo != null) {
      data['medSrvInfo'] = this.medSrvInfo;
    }
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
