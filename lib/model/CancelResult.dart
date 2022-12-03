class CancelResult {
  String? resSatus;
  String? resMsg;

  CancelResult({this.resSatus, this.resMsg});

  CancelResult.fromJson(Map<String, dynamic> json) {
    resSatus = json['resSatus'];
    resMsg = json['resMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resSatus'] = this.resSatus;
    data['resMsg'] = this.resMsg;
    return data;
  }
}