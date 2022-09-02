class Patient {
  late int  id;
  late String  firstName;
  late String  secondName;
  late String  thirdName;
  late String  lastName;
  late String  identityNumber;
  late String  mobile;
  late String  email;
  late String  patientType;
  late String  payingType;
  late String  insuranceNumber;
  late String  insuranceDate;
  late String  insuranceName;
  late String  deletedAt;
  late String  createdAt;
  late String  updatedAt;
  late String  password;

  Patient();

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    thirdName = json['third_name'];
    lastName = json['last_name'];
    identityNumber = json['identity_number'];
    mobile = json['mobile'];
    email = json['email'];
    patientType = json['patient_type'];
    payingType = json['paying_type'];
    insuranceNumber = json['insurance_number'];
    insuranceDate = json['insurance_date'];
    insuranceName = json['insurance_name'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['second_name'] = this.secondName;
    data['third_name'] = this.thirdName;
    data['last_name'] = this.lastName;
    data['identity_number'] = this.identityNumber;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['patient_type'] = this.patientType;
    data['paying_type'] = this.payingType;
    data['insurance_number'] = this.insuranceNumber;
    data['insurance_date'] = this.insuranceDate;
    data['insurance_name'] = this.insuranceName;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['password'] = this.password;
    data['password_confirm'] = this.password;
    return data;
  }
}
