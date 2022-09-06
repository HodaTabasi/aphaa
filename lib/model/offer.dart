class Offers {
  int? id;
  String? title;
  String? description;
  int? price;
  String? image;

  Offers({this.id, this.title, this.description, this.price, this.image});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
