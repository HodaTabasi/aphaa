class SmsResponse {
  String? id;
  String? responseStatus;
  String? codeType;
  String? locale;
  int? length;
  String? to;
  String? channel;

  SmsResponse(
      {this.id,
        this.responseStatus,
        this.codeType,
        this.locale,
        this.length,
        this.to,
        this.channel});

  SmsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    responseStatus = json['response_status'];
    codeType = json['code_type'];
    locale = json['locale'];
    length = json['length'];
    to = json['to'];
    channel = json['channel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['response_status'] = this.responseStatus;
    data['code_type'] = this.codeType;
    data['locale'] = this.locale;
    data['length'] = this.length;
    data['to'] = this.to;
    data['channel'] = this.channel;
    return data;
  }
}
