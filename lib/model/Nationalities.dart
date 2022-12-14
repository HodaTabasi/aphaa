class Nationalities {
  String? natCode;
  String? natName;

  Nationalities({this.natCode, this.natName});

  Nationalities.fromJson(Map<String, dynamic> json) {
    natCode = json['natCode'];
    natName = json['natName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['natCode'] = this.natCode;
    data['natName'] = this.natName;
    return data;
  }
}
