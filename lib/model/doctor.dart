class Doctor {
  int? id;
  String? name;
  String? description;
  String? code;
  String? specialty;
  String? image;

  Doctor(
      {this.id,
        this.name,
        this.description,
        this.code,
        this.specialty,
        this.image});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    specialty = json['specialty'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['code'] = this.code;
    data['specialty'] = this.specialty;
    data['image'] = this.image;
    return data;
  }
}
