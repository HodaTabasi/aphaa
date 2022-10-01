class Pages {
  String? page;
  String? offset;

  Pages({this.page, this.offset});

  Pages.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['offset'] = this.offset;
    return data;
  }
}