class PtCons {
  String? consNo;
  String? consDate;
  String? ptConsult;
  String? replyDate;
  String? replyDTL;

  PtCons(
      {this.consNo,
        this.consDate,
        this.ptConsult,
        this.replyDate,
        this.replyDTL});

  PtCons.fromJson(Map<String, dynamic> json) {
    consNo = json['consNo'];
    consDate = json['consDate'];
    ptConsult = json['ptConsult'];
    replyDate = json['replyDate'];
    replyDTL = json['replyDTL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consNo'] = this.consNo;
    data['consDate'] = this.consDate;
    data['ptConsult'] = this.ptConsult;
    data['replyDate'] = this.replyDate;
    data['replyDTL'] = this.replyDTL;
    return data;
  }
}
