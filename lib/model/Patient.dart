class Patient {
  int? id;
  String? firstName;
  String? secondName;
  String? thirdName;
  String? lastName;
  String? mobile;
  String? email;
  String? payingType;
  String? patientType;
  String? identityNumber;
  String? insuranceNumber;
  String? insuranceDate;
  String? insuranceName;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? password;
  String? token;
  String? name;
  String? Employer;
  String? p_code;

  Patient();

  Patient.BaseData(
      {this.firstName,
      this.secondName,
      this.thirdName,
      this.lastName,
      this.email,
      this.password,
      this.patientType,
      this.identityNumber,
      this.mobile});

  Patient.ProfileData(
      {this.firstName,
      this.secondName,
      this.thirdName,
      this.lastName,
      this.email,
      this.Employer,
      this.mobile});

  Patient.ProfileData1(
      {this.firstName,
      this.secondName,
      this.thirdName,
      this.lastName,
      this.mobile,
      this.Employer = "ss"});

  Patient.insuranceData({
    this.insuranceNumber,
    this.insuranceDate,
    this.insuranceName,
    this.p_code
  });

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
    name = json['name'];
    token = json['token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    Employer = json['Employer'];
    p_code = json['p_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['password'] = this.password;
    data['password_confirm'] = this.password;
    data['p_code'] = this.p_code;
    return data;
  }
  Map<String, dynamic> cashToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['second_name'] = this.secondName;
    data['third_name'] = this.thirdName;
    data['last_name'] = this.lastName;
    data['identity_number'] = this.identityNumber;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['patient_type'] = this.patientType;
    data['paying_type'] = this.payingType;
    data['password'] = this.password;
    data['password_confirm'] = this.password;
    data['Employer'] = this.Employer;
    return data;
  }

  Map<String, dynamic> insuranceDataToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insurance_number'] = this.insuranceNumber;
    data['insurance_date'] = this.insuranceDate;
    data['insurance_name'] = this.insuranceName;
    return data;
  }

  Map<String, dynamic> editProfileToJson(flag) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['second_name'] = this.secondName;
    data['third_name'] = this.thirdName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    if (flag) data['email'] = this.email;
    data['Employer'] = this.Employer;

    return data;
  }

@override
String toString() {
  return 'Patient{firstName: $firstName, secondName: $secondName, thirdName: $thirdName, lastName: $lastName, mobile: $mobile, email: $email, patientType: $patientType, id:$identityNumber}';
}
}
