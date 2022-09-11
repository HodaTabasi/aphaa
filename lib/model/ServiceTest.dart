class ServiceTest {
  String? serviceType;
  String? serviceName;
  String? serviceDate;
  String? clinicCode;
  String? clinicName;
  String? fileName;

  ServiceTest(
      {this.serviceType,
        this.serviceName,
        this.serviceDate,
        this.clinicCode,
        this.clinicName,
        this.fileName});

  ServiceTest.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    serviceName = json['serviceName'];
    serviceDate = json['serviceDate'];
    clinicCode = json['clinicCode'];
    clinicName = json['clinicName'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceType'] = this.serviceType;
    data['serviceName'] = this.serviceName;
    data['serviceDate'] = this.serviceDate;
    data['clinicCode'] = this.clinicCode;
    data['clinicName'] = this.clinicName;
    data['fileName'] = this.fileName;
    return data;
  }
}
