class OpenFileResponse {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? identityNumber;
  String? payingType;
  Null? insuranceNumber;
  String? image;

  OpenFileResponse(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.identityNumber,
        this.payingType,
        this.insuranceNumber,
        this.image});

  OpenFileResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    identityNumber = json['identity_number'];
    payingType = json['paying_type'];
    insuranceNumber = json['insurance_number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['identity_number'] = this.identityNumber;
    data['paying_type'] = this.payingType;
    data['insurance_number'] = this.insuranceNumber;
    data['image'] = this.image;
    return data;
  }
}
