import 'AvailableTime.dart';

class TimeAvilableResponse {
  var reqAmt;
  String? resType;
  String? paymentNotice;
  List<AvailableTime>? availableTimes;

  TimeAvilableResponse(
      {this.reqAmt, this.resType, this.paymentNotice, this.availableTimes});

  TimeAvilableResponse.fromJson(Map<String, dynamic> json) {
    reqAmt = json['reqAmt'];
    resType = json['resType'];
    paymentNotice = json['paymentNotice'];
    if (json['availableTimes'] != null) {
      availableTimes = <AvailableTime>[];
      json['availableTimes'].forEach((v) {
        availableTimes!.add(new AvailableTime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reqAmt'] = this.reqAmt;
    data['resType'] = this.resType;
    data['paymentNotice'] = this.paymentNotice;
    if (this.availableTimes != null) {
      data['availableTimes'] =
          this.availableTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

