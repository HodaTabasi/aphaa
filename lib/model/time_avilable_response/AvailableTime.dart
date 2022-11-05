class AvailableTime {
  String? consultSNo;
  String? consultTime;
  String? consultTime24;

  AvailableTime({this.consultSNo, this.consultTime, this.consultTime24});

  AvailableTime.fromJson(Map<String, dynamic> json) {
    consultSNo = json['consultSNo'];
    consultTime = json['consultTime'];
    consultTime24 = json['consultTime24'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consultSNo'] = this.consultSNo;
    data['consultTime'] = this.consultTime;
    data['consultTime24'] = this.consultTime24;
    return data;
  }
}