class SocialContact {
  int? id;
  String? value;
  String? type;

  SocialContact({this.id, this.value, this.type});

  SocialContact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['type'] = this.type;
    return data;
  }
}
