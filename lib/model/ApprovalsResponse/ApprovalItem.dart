class ApprovalItem {
  String? id;
  String? serviceType;
  String? serviceName;
  String? serviceQty;
  String? servicePrice;
  String? approvedAmount;
  String? approvalDate;
  String? approvalTime;
  String? approvalStatus;
  String? approvalDetail;
  String? validityPeriod;

  ApprovalItem(
      {this.id,
        this.serviceType,
        this.serviceName,
        this.serviceQty,
        this.servicePrice,
        this.approvedAmount,
        this.approvalDate,
        this.approvalTime,
        this.approvalStatus,
        this.approvalDetail,
        this.validityPeriod});

  ApprovalItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    serviceType = json['serviceType'];
    serviceName = json['serviceName'];
    serviceQty = json['serviceQty'];
    servicePrice = json['servicePrice'];
    approvedAmount = json['approvedAmount'];
    approvalDate = json['approvalDate'];
    approvalTime = json['approvalTime'];
    approvalStatus = json['approvalStatus'];
    approvalDetail = json['approvalDetail'];
    validityPeriod = json['validityPeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['serviceType'] = this.serviceType;
    data['serviceName'] = this.serviceName;
    data['serviceQty'] = this.serviceQty;
    data['servicePrice'] = this.servicePrice;
    data['approvedAmount'] = this.approvedAmount;
    data['approvalDate'] = this.approvalDate;
    data['approvalTime'] = this.approvalTime;
    data['approvalStatus'] = this.approvalStatus;
    data['approvalDetail'] = this.approvalDetail;
    data['validityPeriod'] = this.validityPeriod;
    return data;
  }
}
