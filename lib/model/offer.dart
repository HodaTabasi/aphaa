class Offers {
  int? id;
  String? title;
  String? description;
  int? price;
  String? clinic;
  String? expier;
  String? image;

  Offers(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.clinic,
        this.expier,
        this.image});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    clinic = json['clinic'];
    expier = json['expier'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['clinic'] = this.clinic;
    data['expier'] = this.expier;
    data['image'] = this.image;
    return data;
  }
}
