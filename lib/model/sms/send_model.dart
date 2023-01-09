class SMSSndModel {
  String? otpFlag;
  String? otpMsg;
  String? ptMOB;
  String? rejReason;

  SMSSndModel({this.otpFlag, this.otpMsg, this.ptMOB, this.rejReason});

  SMSSndModel.fromJson(Map<String, dynamic> json) {
    otpFlag = json['otpFlag'];
    otpMsg = json['otpMsg'];
    ptMOB = json['ptMOB'];
    rejReason = json['rejReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otpFlag'] = this.otpFlag;
    data['otpMsg'] = this.otpMsg;
    data['ptMOB'] = this.ptMOB;
    data['rejReason'] = this.rejReason;
    return data;
  }
}
