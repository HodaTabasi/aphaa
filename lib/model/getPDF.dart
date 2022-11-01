class PdfClass {
  String? pdfFile;

  PdfClass({this.pdfFile});

  PdfClass.fromJson(String json) {
    pdfFile = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pdfFile'] = this.pdfFile;
    return data;
  }
}
