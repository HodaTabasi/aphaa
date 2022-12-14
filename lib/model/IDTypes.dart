class IDTypes {
  String? idTypeCode;
  String? idTypeName;

  IDTypes({this.idTypeCode, this.idTypeName});

  IDTypes.fromJson(Map<String, dynamic> json) {
    idTypeCode = json['idTypeCode'];
    idTypeName = json['idTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTypeCode'] = this.idTypeCode;
    data['idTypeName'] = this.idTypeName;
    return data;
  }
}